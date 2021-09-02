package kr.co.nandsoft.member.controller;

import kr.co.nandsoft.member.Member;
import kr.co.nandsoft.member.services.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

@Controller
@RequestMapping("/member")
public class MemberController {
//remember Autowired 객체 불러오는거 기억하기.
    @Autowired
    MemberService service;

    @ModelAttribute("cp")
    public String getContextPath(HttpServletRequest request) {
        return request.getContextPath();
    }

    @ModelAttribute("serverTime")
    public String getServerTime(Locale locale) {

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        return dateFormat.format(date);
    }

    // Join
    @RequestMapping("/joinForm")
    public String joinForm(@ModelAttribute("member") Member member) {
        return "member/joinForm";
    }


    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String joinReg(@ModelAttribute("member")Member member) {

        service.memberRegister(member);

        return "member/loginForm";
    }

    //remember Login
    @RequestMapping("/loginForm")
    public String loginForm(@ModelAttribute("member")Member member) {
        return "member/loginForm";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String memLogin(Member member, HttpSession session) {
        Member mem = service.memberSearch(member);
        if(mem == null)
            return "member/loginForm";

        session.setAttribute("member", mem);

//        return "member/loginOk";
        return "member/index";
    }

    //remember Logout
    @RequestMapping("/logout")
    public String memLogout(Member member, HttpSession session) {

        session.invalidate();

        return "redirect:/";
    }

    //remember Modify
    @RequestMapping(value = "/modifyForm")
    public ModelAndView modifyForm(HttpServletRequest request) {

        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");

        ModelAndView mav = new ModelAndView();
        mav.addObject("member", service.memberSearch(member));

        mav.setViewName("member/modifyForm");

        return mav;
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public ModelAndView modify(@ModelAttribute("member")Member member, HttpServletRequest request) {

        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();

        Member mem = service.memberModify(member);
        if(mem == null) {
            mav.setViewName("member/modifyForm");
        } else {
            session.setAttribute("member", mem);
            mav.addObject("memAft", mem);
            mav.setViewName("member/modifyOk");
        }

        return mav;
    }

    //remember Remove
    @RequestMapping("/removeForm")
    public ModelAndView removeForm(HttpServletRequest request) {

        ModelAndView mav = new ModelAndView();

        HttpSession session =  request.getSession();
        Member member = (Member) session.getAttribute("member");

        mav.addObject("member", member);
        mav.setViewName("member/removeForm");

        return mav;
    }
//todo 회원 탈퇴 하는 정책 고민해보기.
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String memRemove(@ModelAttribute("member")Member member, HttpServletRequest request) {

        int result = service.memberRemove(member);

        if(result == 0)
            return "member/removeForm";

        HttpSession session = request.getSession();
        session.invalidate();

        return "member/removeOk";
    }
}
