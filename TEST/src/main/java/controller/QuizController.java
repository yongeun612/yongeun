package controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.QuizDAO;
import vo.QuizVO;

@Controller
public class QuizController {

	QuizDAO quiz_dao;
	public static final String VIEW_PATH = "/WEB-INF/views/blog/";
	
	public QuizController() {
		
	}
	
	public QuizController(QuizDAO quiz_dao) {
		this.quiz_dao = quiz_dao;
	}
	
	
	@RequestMapping(value ="/quizList.do")
	public String QuizList(Model model,@RequestParam(defaultValue="1") int quizNum) {
	
	QuizVO quiz= quiz_dao.quizList(quizNum);
	model.addAttribute("quizNum",quizNum);
	model.addAttribute("quiz",quiz);
	model.addAttribute("life",3);
	
	return VIEW_PATH+"quiz.jsp";
	}
	
}
