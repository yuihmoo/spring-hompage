package kr.co.nandsoft.member.controller;

import kr.co.nandsoft.member.Board;
import kr.co.nandsoft.member.BoardRecord;
import kr.co.nandsoft.member.Member;
import kr.co.nandsoft.member.services.BoardService;
import kr.co.nandsoft.member.services.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Timestamp;

@Controller
@RequestMapping("/member/board")
public class BoardController {

    @Autowired
    MemberService service;

    @Autowired
    BoardService boardService;

//remember 로그인 확인하고 리스트 불러오는거 기억하기.
    @RequestMapping("/list")
    public ModelAndView list(HttpSession session, Member member) {

        ModelAndView mav = new ModelAndView();
        member = (Member) session.getAttribute("member");

        if(member == null) {
            mav.setViewName("member/loginForm");
            return mav;
        }
        else{
            mav.addObject("boards", boardService.boardListAll());
            mav.setViewName("member/board/list");
            return mav;
        }
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
            board.setWrite_date(timestamp);
            board.setMemId(member.getMemId());
            mav.addObject("boards", boardService.boardRead(board));
            //remember 조회수 기록 테이블 멤버변수 board 객체에서 get
            BoardRecord boardRecord = new BoardRecord();
            boardRecord.setPageNum(board.getNum());
            boardRecord.setMemId(board.getMemId());
            Date today = new Date(System.currentTimeMillis());
            boardRecord.setRead_Time(today);
            //remember 레코드 서비스 호출
            boardService.insert_Read_Record(board);
            boardService.select_Record(boardRecord, board);

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
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        board.setWrite_date(timestamp);
        Board brd = boardService.boardInsert(board);

        if(brd == null)
            return "member/board/writeForm";

        request.setAttribute("member", brd);

        return "redirect:/member/board/list";
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
            mav.addObject("boards", boardService.boardRead(board));

            mav.setViewName("member/board/modifyForm");
            return mav;
        }
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Board board) {

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        board.setWrite_date(timestamp);
        boardService.boardModify(board);

        if(board == null)
            return "member/board/modifyForm";

        return "redirect:/member/board/list";
    }

    @RequestMapping("/delete")
    public String delete(Board board) {
        int Num = board.getNum();
        boardService.boardDelete(Num);
        return "redirect:/member/board/list";
    }
}
