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

@Controller
public class ContentController {

	BoardDAO board_dao;
	public static final String VIEW_PATH = "/WEB-INF/views/quiz/";
	
	public ContentController() {
		
	}
	
	public ContentController(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	//게시글 작성
	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite(@ModelAttribute BoardVO vo){
		
		board_dao.insertBoard(vo);
		
		return "boardList.do";
	}
	
	//게시글 수정
	@RequestMapping(value = "/boardFix.do")
	public String boardFix(@ModelAttribute BoardVO vo){
		System.out.println(vo.getBoard_title());
		board_dao.updateBoard(vo);
		
		return "boardList.do";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/boardDel.do")
	public String boardDel(@RequestParam int board_idx){
		board_dao.boardDelete(board_idx);
		
		return "boardList.do";
	}
	
	//해당 글 이동
	@RequestMapping(value = "/boardView.do")
	public String boardView(@RequestParam int board_idx,Model model){
		board_dao.boardClick(board_idx);
		BoardVO board = board_dao.boardView(board_idx);
		model.addAttribute("board",board);
		
		return VIEW_PATH+"boardView.jsp";
	}
	
	@RequestMapping(value = "/boardFixPage.do")
	public String boardFixPage(@RequestParam int board_idx,Model model){
		
		BoardVO board = board_dao.boardView(board_idx);
		model.addAttribute("board",board);
		
		return VIEW_PATH+"boardFix.jsp";
	}
	
	
	//게시글 목록
	@RequestMapping(value = "boardList.do")
	public ModelAndView BoardPage(@RequestParam(defaultValue="board_title")
													  String searchOption,
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
