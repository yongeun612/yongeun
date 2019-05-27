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
	
	@RequestMapping(value = "/home.do")
	public String main() {
		
		return VIEW_PATH+"home.jsp";
		
	}
	@RequestMapping(value = "/write.do")
	public String about() {
		
		return VIEW_PATH+"write.jsp";
		
	}
	
	
	@RequestMapping(value = "/signup.do")
	public String contact() {
		
		return VIEW_PATH+"signup.jsp";
		
	}
	
	@RequestMapping(value = "/login.do")
	public String login() {
		
		return VIEW_PATH+"login.jsp";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return VIEW_PATH+"main.jsp";
	}
	
	
	@RequestMapping(value = "/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo,HttpSession session){
		boolean result = member_dao.loginCheck(vo);
		ModelAndView mav = new ModelAndView();
		if(result) {
			mav.setViewName("/WEB-INF/views/blog/main.jsp");
			mav.addObject("msg","success");
			session.setAttribute("userId",vo.getBlog_id());
			session.setAttribute("userName",vo.getBlog_name());
		} else {
			mav.setViewName("/WEB-INF/views/blog/login.jsp");
			mav.addObject("msg","failure");
		}
		return mav;
		
	}
	
	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam String blog_id) {
		
		String idCheck = member_dao.idCheck(blog_id);
		
		return idCheck; 
	}
	
	@RequestMapping(value = "/memberSend.do")
	public String memberSend(@ModelAttribute MemberVO vo){
		member_dao.insertMember(vo);
		member_dao.insertRank(vo.getBlog_id());
		return VIEW_PATH+"main.jsp";
		
	}
	
}
