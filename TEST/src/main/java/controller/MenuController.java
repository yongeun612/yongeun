package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDAO;
import vo.MemberVO;

@Controller
public class MenuController {
	
	MemberDAO member_dao;
	
	public MenuController() { 

	}
	
	
	public MenuController(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	@RequestMapping(value = "/main.do")
	public String main() {
		
		return "/WEB-INF/views/blog/main.jsp";
		
	}
	//페이지 이동
	@RequestMapping(value = "/about.do")
	public String about() {
		
		return "/WEB-INF/views/blog/about.jsp";
		
	}
	
	@RequestMapping(value = "/post.do")
	public String post() {
		
		return "/WEB-INF/views/blog/post.jsp";
		
	}
	
	@RequestMapping(value = "/signup.do")
	public String contact() {
		
		return "/WEB-INF/views/blog/signup.jsp";
		
	}
	
	@RequestMapping(value = "/login.do")
	public String login() {
		
		return "/WEB-INF/views/blog/login.jsp";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/WEB-INF/views/blog/main.jsp";
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
	
}
