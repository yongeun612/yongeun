package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.QuizDAO;
import vo.OxQuizVO;
import vo.QuizRankVO;
import vo.QuizVO;

@Controller
public class QuizController {

	QuizDAO quiz_dao;
	public static final String VIEW_PATH = "/WEB-INF/views/quiz/";
	
	public QuizController() {
		
	}
	
	public QuizController(QuizDAO quiz_dao) {
		this.quiz_dao = quiz_dao;
	}
	
	//선택형 퀴즈실행
	@RequestMapping(value ="/selectQuiz.do")
	public String selectQuiz(Model model,@RequestParam(defaultValue="1") int quizNum,HttpServletRequest request,@RequestParam(defaultValue="0")int highScore) {
	
		
	HttpSession httpSession = request.getSession(true);		
	
	String userId =(String)httpSession.getAttribute("userId");
	QuizRankVO quizRank =quiz_dao.scoreCheck(userId);
	
	if(highScore==0) {
		highScore=quizRank.getRank_select_score();
	}
	if(highScore<(quizNum-1)) {
			highScore=quizNum-1;
			quizRank.setRank_select_score((quizNum-1));
			quiz_dao.selScoreUpdate(quizRank);
	}
	List<QuizRankVO> rank = quiz_dao.rankList();
	QuizVO quiz= quiz_dao.quizList(quizNum);
	model.addAttribute("quizNum",quizNum);
	model.addAttribute("quiz",quiz);
	model.addAttribute("life",3);
	model.addAttribute("rank",rank);
	model.addAttribute("highcore",highScore);
	return VIEW_PATH+"quiz.jsp";
	}
	
	//ox 퀴즈실행
	@RequestMapping(value ="/oxQuiz.do")
	public String OxQuiz(Model model,@RequestParam(defaultValue="1") int quizNum,HttpServletRequest request,@RequestParam(defaultValue="0")int highScore) {
		
		
		HttpSession httpSession = request.getSession(true);		
		
		String userId =(String)httpSession.getAttribute("userId");
		QuizRankVO quizRank =quiz_dao.scoreCheck(userId);
		
		if(highScore==0) {
			highScore=quizRank.getRank_ox_score();
		}
		
		if(highScore<(quizNum-1)) {
			highScore=quizNum-1;
			quizRank.setRank_ox_score((quizNum-1));
			quiz_dao.oxScoreUpdate(quizRank);
		}
		List<QuizRankVO> rank = quiz_dao.oxRankList();
		OxQuizVO quiz= quiz_dao.oxQuizList(quizNum);
		model.addAttribute("quizNum",quizNum);
		model.addAttribute("quiz",quiz);
		model.addAttribute("life",1);
		model.addAttribute("rank",rank);
		model.addAttribute("highcore",highScore);
		return VIEW_PATH+"quizOX.jsp";
	}
}
