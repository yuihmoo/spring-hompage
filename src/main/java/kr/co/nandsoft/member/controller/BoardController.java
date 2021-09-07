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
                       @RequestParam(value = "perPageNum", required = false)String perPageNum) {

        member = (Member) session.getAttribute("member");
//        sqlFactory.openSession();
//        System.out.println("ok");

        if (member == null) {
            return "member/loginForm";

        } else if (StringUtils.isEmpty(page) && StringUtils.isEmpty(perPageNum)) {
            page = "1";
            perPageNum = "10";
        }
        else if (StringUtils.isEmpty(page)) {
            page = "1";
        }
        else if (StringUtils.isEmpty(perPageNum)) {
            perPageNum = "10";
        }

        logger.error("page : " + page);
        logger.error("perPageNum : " + perPageNum);

        ModelAndView mav = new ModelAndView("/member/board/listPage");
        PageMaker pageMaker = new PageMaker();
        Criteria criteria = new Criteria();
        criteria.setPage(Integer.parseInt(page));
        criteria.setPerPageNum(Integer.parseInt(perPageNum));
        pageMaker.setCri(criteria);
        pageMaker.setTotalCount(boardService.countAll());

        logger.error("criteria1 : " + criteria.getPage());
        logger.error("criteria2 : " + criteria.getPerPageNum());

        List<Map<String, Object>> list = boardService.selectPage(criteria);

        mav.addObject("cri", criteria);
        mav.addObject("list", list);
        mav.addObject("pageMaker", pageMaker);
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
    public String write(@ModelAttribute("board") Board board, HttpServletRequest request) {
        //remember 글을 쓸때 Write_date 값도 set

        if(board.getTitle().trim().length() == 0 || board.getContent().trim().length() == 0)
        {
            return "member/board/writeForm";
        }

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
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
