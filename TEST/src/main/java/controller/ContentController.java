package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDAO;
import other.BoardPager;
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
		
		return "boardList.do";
	}
		
	@RequestMapping(value = "/boardView.do")
	public String boardView(String board_title,Model model){
		
		board_dao.boarClick(board_title);
		BoardVO board = board_dao.boardView(board_title);
		model.addAttribute("board",board);
		
		return VIEW_PATH+"boardView.jsp";
	}
	
	@RequestMapping(value = "boardList.do")
	public ModelAndView BoardPage(@RequestParam(defaultValue="board_title") String searchOption,
							@RequestParam(defaultValue="") String keyword,
							@RequestParam(defaultValue="1") int curPage) {
	int count = board_dao.countPage(searchOption,keyword);
	BoardPager boardPager = new BoardPager(count, curPage);
	int start = boardPager.getPageBegin();
	int end = boardPager.getPageEnd();
	
	List<BoardVO> list = board_dao.listAll(start,end,searchOption,keyword);
	
	Map<String, Object> map = new HashMap<String,Object>();
	map.put("list",list);
	map.put("count",count);
	map.put("searchOption",searchOption);
	map.put("keyword",keyword);
	map.put("boardPager",boardPager);
	
	ModelAndView mav = new ModelAndView();
	mav.addObject("map",map);
	mav.setViewName(VIEW_PATH+"board.jsp");
	
	return mav;
	}
	
}
