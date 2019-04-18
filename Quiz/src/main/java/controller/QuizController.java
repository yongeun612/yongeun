package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.QuizDAO;
import vo.QuizMember;
import vo.QuizSelectVO;


// 컨트롤러 클래스가 db 패키지가 아니기 때문에(default)
// servlet-context.xml 을 수정해준다.
@Controller
@SessionAttributes({"user","quizNum","life"})
public class QuizController {
	// 요청이 오면 DB 조회하고, 결과를 돌려주는 역할 --> 컨트롤러
	// DB를 다룰 수 있는 DAO 객체를 주입한다.
	QuizDAO quiz_dao;
	
	public QuizController() { //기본생성자 오버로딩

	}
	
	// servlet-context.xml 에서 이 컨트롤러 객체를 만들면서, 생성자에 dao를 주입해줌
	public QuizController(QuizDAO quiz_dao) {
		this.quiz_dao = quiz_dao;
	}
	@RequestMapping("/list.korea")
	public String list(Model model) {
		
		int max =quiz_dao.countList();
		List<QuizMember> rank = quiz_dao.rank(); 
	    List<QuizSelectVO> list = quiz_dao.selectList();
		
	    
	    model.addAttribute("user","이몽룡");
	    model.addAttribute("quizNum",max);
	    model.addAttribute("life",2);
	    model.addAttribute("rank",rank);
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/quiz/quiz_list.jsp";
		
	}
	
	@RequestMapping("/quiznext.korea")
	public String Nextlist(@RequestParam int qs_idx, @RequestParam int quizNum ,Model model) {
		
		
		
		if(quizNum<qs_idx) {
			return "/WEB-INF/views/quiz/quiz_insert.jsp";
		}
		
		
		List<QuizMember> rank = quiz_dao.rank(); 
		List<QuizSelectVO> list = quiz_dao.nextList(qs_idx);
		
		
		
	    model.addAttribute("rank",rank);
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/quiz/quiz_list.jsp";
		
	}
	
	@RequestMapping("/quizinsert.korea")
	public String quizinsert(QuizSelectVO quizselectvo ) {
		
		quiz_dao.quizinsert(quizselectvo);
		
		return "/list.korea";
	}
	
	@RequestMapping("/endGame.korea")
	public String endGame(@RequestParam int qs_idx,@RequestParam String user) {
		System.out.println(qs_idx);
		System.out.println(user
				);
		quiz_dao.qsscore(qs_idx,user);
		
		return "/WEB-INF/views/quiz/quiz_score.jsp";
	}
	
	
}
