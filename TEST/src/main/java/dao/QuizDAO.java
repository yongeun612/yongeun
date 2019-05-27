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

		public List<QuizVO> listAll() {
			return sqlSession.selectList("quiz.listAll");
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

		
}
