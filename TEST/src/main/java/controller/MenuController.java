package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDAO;


// 컨트롤러 클래스가 db 패키지가 아니기 때문에(default)
// servlet-context.xml 을 수정해준다.
@Controller
public class MenuController {
	// 요청이 오면 DB 조회하고, 결과를 돌려주는 역할 --> 컨트롤러
	// DB를 다룰 수 있는 DAO 객체를 주입한다.
	MemberDAO member_dao;
	
	public MenuController() { //기본생성자 오버로딩

	}
	
	// servlet-context.xml 에서 이 컨트롤러 객체를 만들면서, 생성자에 dao를 주입해줌
	public MenuController(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	@RequestMapping("/main")
	public String main(Model model) {
		model.addAttribute("list",null);
		return "/WEB-INF/views/blog/main.jsp";
		
	}
	
	@RequestMapping("/about.korea")
	public String about(Model model) {
		model.addAttribute("list",null);
		return "/WEB-INF/views/blog/about.jsp";
		
	}
	
	@RequestMapping("/post.korea")
	public String post(Model model) {
		model.addAttribute("list",null);
		return "/WEB-INF/views/blog/post.jsp";
		
	}
	
	@RequestMapping("/signup.korea")
	public String contact(Model model) {
		model.addAttribute("list",null);
		return "/WEB-INF/views/blog/signup.jsp";
		
	}
	
	@RequestMapping("/login.korea")
	public String login(Model model) {
		model.addAttribute("list",null);
		return "/WEB-INF/views/blog/login.jsp";
		
	}
	
}
