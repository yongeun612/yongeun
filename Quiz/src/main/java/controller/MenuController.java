package controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDAO;
import vo.MemberVO;

@Controller
public class MenuController {
	
	public static final String VIEW_PATH = "/WEB-INF/views/quiz/";
	MemberDAO member_dao;
	
	public MenuController() { 

	}
	
	
	public MenuController(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	//홈페이지 이동
	@RequestMapping(value = "/home.do")
	public String main() {
		
		return VIEW_PATH+"home.jsp";
		
	}
	
	//작성페이지 이동
	@RequestMapping(value = "/write.do")
	public String about() {
		
		return VIEW_PATH+"write.jsp";
		
	}
	
	//회원가입페이지 이동
	@RequestMapping(value = "/signup.do")
	public String contact() {
		
		return VIEW_PATH+"signup.jsp";
		
	}
	
	//로그인페이지 이동
	@RequestMapping(value = "/login.do")
	public String login() {
		
		return VIEW_PATH+"login.jsp";
	}
	
	//로그아웃(세션값 제거)
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return VIEW_PATH+"home.jsp";
	}
	
	//수정페이지 
	@RequestMapping(value = "/fixPage.do")
	public String fix() {
		
		return VIEW_PATH+"fix.jsp";
	}
	
	//로그인
	@RequestMapping(value = "/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo,HttpSession session){
		boolean result = member_dao.loginCheck(vo);
		ModelAndView mav = new ModelAndView();
		if(result) {
			mav.setViewName("/WEB-INF/views/quiz/home.jsp");
			mav.addObject("msg","success");
			session.setAttribute("userId",vo.getBlog_id());
			session.setAttribute("userName",vo.getBlog_name());
		} else {
			mav.setViewName("/WEB-INF/views/quiz/login.jsp");
			mav.addObject("msg","failure");
		}
		return mav;
		
	}
	
	//아이디 중복체크
	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam String blog_id) {
		
		String idCheck = member_dao.idCheck(blog_id);
		
		return idCheck; 
	}
	
	//회원가입
	@RequestMapping(value = "/memberSend.do")
	public String memberSend(@ModelAttribute MemberVO vo){
		member_dao.insertMember(vo);
		member_dao.insertRank(vo.getBlog_id());
		return VIEW_PATH+"home.jsp";
		
	}
	
}
