package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDAO;
import vo.BoardVO;
import vo.MemberVO;

@Controller
public class ContentController {

	BoardDAO board_dao;
	public static final String VIEW_PATH = "/WEB-INF/views/blog/";
	
	public ContentController() {
		
	}
	
	public ContentController(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite(@ModelAttribute BoardVO vo){
		board_dao.insertboard(vo);
		return VIEW_PATH+"main.jsp";
	}
	
	@RequestMapping(value = "/boardList.do")
	public String boardList(@ModelAttribute BoardVO vo,Model model){
		List<BoardVO> list = board_dao.boardList(vo);
		model.addAttribute("list",list);
		return VIEW_PATH+"board.jsp";
	}
	
	
}
