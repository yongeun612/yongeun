package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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

		
}
