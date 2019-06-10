package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.OxQuizVO;
import vo.QuizRankVO;
import vo.QuizVO;

public class QuizDAO {
	SqlSession sqlSession;
		
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}

		public List<QuizVO> quizListAll() {
			return sqlSession.selectList("quiz.quizListAll");
		}
		
		public List<OxQuizVO> oxQuizListAll() {
			return sqlSession.selectList("quiz.oxQuizListAll");
		}

		public QuizVO quizList(int quizNum) {
			
			return sqlSession.selectOne("quiz.quizList",quizNum);
		}

		public QuizRankVO scoreCheck(String userId) {
			return sqlSession.selectOne("quiz.scoreCheck",userId);
		}

		public void selScoreUpdate(QuizRankVO quizRank) {
			sqlSession.update("quiz.selScoreUpdate",quizRank);
		}
		
		public void oxScoreUpdate(QuizRankVO quizRank) {
			sqlSession.update("quiz.oxScoreUpdate",quizRank);
		}

		public List<QuizRankVO> rankList() {
			return sqlSession.selectList("quiz.rankList");
		}

		public OxQuizVO oxQuizList(int quizNum) {
			return sqlSession.selectOne("quiz.oxQuizList",quizNum);
		}

		public List<QuizRankVO> oxRankList() {
			return sqlSession.selectList("quiz.oxRankList");
		}

		public void quizDel(int quiz_idx) {
			sqlSession.delete("quiz.quizDel",quiz_idx);
		}
		
		public void oxquizDel(int oxquiz_idx) {
			sqlSession.delete("quiz.oxQuizDel",oxquiz_idx);
		}

		public void quizFix(QuizVO vo) {
			sqlSession.update("quiz.quizFix",vo);
		}
		
		public void oxQuizFix(OxQuizVO vo) {
			sqlSession.update("quiz.oxQuizFix",vo);
		}

		public void quizAdd(QuizVO vo) {
			sqlSession.insert("quiz.quizAdd",vo);
		}
		
		public void oxQuizAdd(OxQuizVO vo) {
			sqlSession.insert("quiz.oxQuizAdd",vo);
		}

		
}
