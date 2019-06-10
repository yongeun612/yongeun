package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/quizList.do")
	public String QuizList(Model model) {
		List<QuizVO> quiz = quiz_dao.quizListAll();
		
		model.addAttribute("quiz",quiz);
		
		return VIEW_PATH+"quizList.jsp";
	}
	
	@RequestMapping(value="/oxQuizList.do")
	public String OxQuizList(Model model) {
		List<OxQuizVO> oxquiz = quiz_dao.oxQuizListAll();
		model.addAttribute("oxquiz",oxquiz);
		return VIEW_PATH+"quizOxList.jsp";
	}
	
	@RequestMapping(value="/quizFix.do")
	public String QuizUpdate(QuizVO vo) {
		quiz_dao.quizFix(vo);
		return "quizList.do";
	}
	
	@RequestMapping(value="/oxQuizFix.do")
	public String OxQuizUpdate(OxQuizVO vo) {
		quiz_dao.oxQuizFix(vo);
		return "oxQuizList.do";
	}
	
	@RequestMapping(value="/quizAdd.do")
	public String QuizAdd(QuizVO vo) {
		quiz_dao.quizAdd(vo);
		return "home.do";
	}
	
	@RequestMapping(value="/OxQuizAdd.do")
	public String OxQuizAdd(OxQuizVO vo) {
		quiz_dao.oxQuizAdd(vo);
		return "home.do";
	}
	
	
	
	
	@RequestMapping(value="/quizDel.do")
	public String QuizDel(@RequestParam int quiz_idx) {
		quiz_dao.quizDel(quiz_idx);
		return "quizList.do";
	}
	
	@RequestMapping(value="/oxQuizDel.do")
	public String OxQuizDel(@RequestParam int oxquiz_idx) {
		quiz_dao.oxquizDel(oxquiz_idx);
		return "oxQuizList.do";
	}
	
	@RequestMapping(value="/quizFixPage.do")
	public String QuizFixPage(@RequestParam int quiz_idx,Model model) {
		QuizVO quiz=quiz_dao.quizList(quiz_idx);
		model.addAttribute("quiz",quiz);
		return VIEW_PATH+"quizFix.jsp";
	}
	@RequestMapping(value="/oxQuizFixPage.do")
	public String OxQuizFixPage(@RequestParam int oxquiz_idx,Model model) {
		OxQuizVO oxQuiz= quiz_dao.oxQuizList(oxquiz_idx);
		model.addAttribute("oxQuiz",oxQuiz);
		return VIEW_PATH+"quizOxFix.jsp";
	}
	
	@RequestMapping(value ="/quizAddPage.do")
	public String quizAddPage() {
		return VIEW_PATH+"addQuiz.jsp";
	}
	
	@RequestMapping(value ="/oxQuizAddPage.do")
	public String oxQuizAddPage() {
		return VIEW_PATH+"addOxQuiz.jsp";
	}
	
	
	
}
