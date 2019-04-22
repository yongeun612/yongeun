package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDAO;

@Controller
public class MemberController {

	MemberDAO member_dao;
	
	public MemberController() {
		
	}
	
	public MemberController(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	
	
	
}
