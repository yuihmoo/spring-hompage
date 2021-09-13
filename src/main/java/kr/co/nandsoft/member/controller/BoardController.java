package kr.co.nandsoft.member.controller;

import kr.co.nandsoft.member.*;
import kr.co.nandsoft.member.services.BoardService;
import kr.co.nandsoft.member.services.MemberService;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

//study BoardController 라는 객체에 멤버변수로 logger, ApplicationContext, MemberService, BoardService, SqlSessionFactory(Mybatis) 를 주고, 생성자 하나를 만들어 준다.
@Controller
@RequestMapping("/member/board")
public class BoardController {

    private static final Logger logger = Logger.getLogger(BoardController.class);

    private final ApplicationContext applicationContext;

    private final MemberService service;

    private final BoardService boardService;

    private final SqlSessionFactory sqlFactory;

    public BoardController(ApplicationContext applicationContext, MemberService service, BoardService boardService, SqlSessionFactory sqlFactory) {
        this.applicationContext = applicationContext;
        this.service = service;
        this.boardService = boardService;
        this.sqlFactory = sqlFactory;
    }
// study getMapping 어노테이션을 통해 내가 등록한 빈을 콘솔 창에 얻을 수 있다.

    @GetMapping("/getbeans")
    public void getBeans() {
        if (this.applicationContext != null) {
            String[] beans = this.applicationContext.getBeanDefinitionNames();
            for (String bean : beans) {
                System.out.println("bean : " + bean);
            }
        }
    }

//remember 로그인 확인하고 리스트 불러오는거 기억하기.
    @RequestMapping(value = "/listPage", method = RequestMethod.GET)
    public Object list(Model model, HttpSession session, Member member, HttpServletRequest request,
                       @RequestParam(value = "page", required = false)String page,
                       @RequestParam(value = "perPageNum", required = false)String perPageNum,
                       @RequestParam(value = "sortOption", required = false)String sortOption,
                       @RequestParam(value = "searchOption")String searchOption) {

        member = (Member) session.getAttribute("member");
//        sqlFactory.openSession();
//        System.out.println("ok");
        //remember Paging 관련 page, perPageNum 의 null 을 방지하기 위함.
        if (member == null) {
            return "member/loginForm";

        } else if (StringUtils.isEmpty(page) && StringUtils.isEmpty(perPageNum)) {
            page = "1";
            perPageNum = "10";
            sortOption = "writeDate";
        }
        else if (StringUtils.isEmpty(page)) {
            page = "1";
            sortOption = "writeDate";
        }
        else if (StringUtils.isEmpty(perPageNum)) {
            perPageNum = "10";
            sortOption = "writeDate";
        }
        else if (StringUtils.isEmpty(searchOption)) {
            searchOption = "%";
        }
        //study logger 를 이용해서 확인하는 습관을 기르자.
        logger.error("page : " + page);
        logger.error("perPageNum : " + perPageNum);
        logger.info("sortOption : " + sortOption);
        logger.info("searchOption : " + searchOption);

        ModelAndView mav = new ModelAndView("/member/board/listPage");
        //remember Paging 관련 countAll(게시글 총 갯수), selectPage(현재 선택된 페이지 설정대로 DB 에서 Select)
        PageMaker pageMaker = new PageMaker();
        Criteria cri = new Criteria();
        cri.setPage(Integer.parseInt(page));
        cri.setPerPageNum(Integer.parseInt(perPageNum));
        cri.setSortOption(sortOption);
        cri.setSearchOption("%"+searchOption+"%");

        pageMaker.setCri(cri);
        pageMaker.setTotalCount(boardService.countAll());

        logger.error("criteria1 : " + cri.getPage());
        logger.error("criteria2 : " + cri.getPerPageNum());
        logger.info("criteria3 : " + cri.getSortOption());

        List<Map<String, Object>> list = boardService.selectPage(cri);


        mav.addObject("cri", cri);
        mav.addObject("list", list);
        mav.addObject("pageMaker", pageMaker);
        mav.addObject("member", service.memberSearch(member));
        session.setAttribute("member", member);

        return mav;
    }



    @RequestMapping("/read")
    public ModelAndView read(Board board, HttpSession session, Member member,
                             HttpServletResponse response, HttpServletRequest request){

        ModelAndView mav = new ModelAndView();
        member = (Member) session.getAttribute("member");

        if (member == null) {
            mav.setViewName("member/loginForm");
            return mav;
        }
        else
        {
            //remember read 서비스에 필요한 객체 멤버변수 set
            //study 시간 값 WAS에서 뽑지말고 DB로 통일 시키기 (1개의 기준이 필요)
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            board.setWriteDate(timestamp);
            board.setMemId(member.getMemId());
            mav.addObject("board", boardService.readBoard(board));
            //remember 조회수 기록 테이블 멤버변수 board 객체에서 get
            BoardRecord boardRecord = new BoardRecord();
            boardRecord.setPageNum(board.getNum());
            boardRecord.setMemId(board.getMemId());
            Date today = new Date(System.currentTimeMillis());
            boardRecord.setReadTime(today);
            //remember 레코드 서비스 호출
            boardService.insertRecord(board);
            boardService.selectRecord(boardRecord, board);

            mav.setViewName("member/board/read");
            session.setAttribute("member", member);
        }
        return mav;
    }

    @RequestMapping("/writeForm")
    public ModelAndView writeForm(HttpSession session, Member member) {

        ModelAndView mav = new ModelAndView();
        member = (Member) session.getAttribute("member");
        //remember 글쓰기 Form 로그인 확인
        if(member == null) {
            mav.setViewName("member/loginForm");
            return mav;
        }
        else {
            mav.addObject("member", service.memberSearch(member));
            session.setAttribute("member", member);
            mav.setViewName("member/board/writeForm");
            return mav;
        }
    }

    @RequestMapping(value = "/write", method = RequestMethod.POST)
    public String write(@ModelAttribute("board") Board board, HttpServletRequest request, Member member, HttpSession session) {
        //remember 글을 쓸때 Write_date 값도 set
        member = (Member) session.getAttribute("member");

        if(board.getTitle().trim().length() == 0 || board.getContent().trim().length() == 0)
        {
            return "member/board/writeForm";
        }

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //remember 클라이언트를 믿지말자. 화면에서 memId를 받으면 안된다.
        board.setMemId(member.getMemId());
        board.setWriteDate(timestamp);
        Board brd = boardService.insertBoard(board);
        request.setAttribute("member", brd);

        return "redirect:listPage";
    }

    @RequestMapping(value = "/modifyForm")
    public ModelAndView modifyForm(Board board, Member member, HttpSession session) {

        ModelAndView mav = new ModelAndView();
        member = (Member) session.getAttribute("member");

        if(member == null) {
            mav.setViewName("member/loginForm");
            return mav;
        }
        else {
            session.setAttribute("member", member);
            mav.addObject("board", boardService.readBoard(board));

            mav.setViewName("member/board/modifyForm");
            return mav;
        }
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Board board, HttpSession session) {

        Member member;

        member = (Member) session.getAttribute("member");

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        board.setWriteDate(timestamp);
        boardService.modifyBoard(board, member);

        if(board.getTitle() == "" || board.getContent() == "")
            return "member/board/modifyForm";

        return "redirect:listPage";
    }

    @RequestMapping("/delete")
    public String delete(Board board) {
        int num = board.getNum();
        boardService.deleteBoard(num);
        return "redirect:listPage";
    }
}
