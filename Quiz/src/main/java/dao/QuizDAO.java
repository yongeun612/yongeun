package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.QuizMember;
import vo.QuizSelectVO;

public class QuizDAO {
	// 쿼리를 수행시킬 클래스 --> 추가, 삭제, 갱신, 조회 등의 메서드 제공
	
	//이 멤버변수는.. xml 파일에 의해 생성된 객체가 주입될 예정
	//코드 상에서 따로 new 를 해서 객체를 만들지 않을 것
	
	SqlSession sqlSession;

	// 주입될 때 사용될 setter
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//select 메서드
	
	public List<QuizSelectVO> selectList(){
		
		List<QuizSelectVO> list = null;
		
		//mapper의 dept.xml에서 dept_list 수행
		list = sqlSession.selectList("quiz.quiz_list");
		
		return list;
	}
	
	public List<QuizSelectVO> nextList(int qs_idx){
		
		List<QuizSelectVO> list = null;
		
		//mapper의 dept.xml에서 dept_list 수행
		list = sqlSession.selectList("quiz.quiz_nextlist",qs_idx);
		
		return list;
	}
	
	public int countList(){
		int count;
		count=sqlSession.selectOne("quiz.quiz_countlist");
		return count;
	}
	
	public List<QuizMember> rank(){
		List<QuizMember> list = null;
		list = sqlSession.selectList("quiz.quiz_rank");
		
		return list;
	}
	
	public void quizinsert(QuizSelectVO quizselectvo) {
		
		sqlSession.insert("quiz.quiz_insert",quizselectvo);
	}

	public void qsscore(int qs_idx, String user) {
		System.out.println(qs_idx);
		System.out.println(user);
		/*List<QuizMember> list = new ArrayList<QuizMember>();*/
		QuizMember vo = new QuizMember();
		vo.setMem_name(user);
		vo.setMem_score(qs_idx);
		/*list.add(vo);*/
		sqlSession.update("quiz.quiz_score",vo);
		
	}
}
