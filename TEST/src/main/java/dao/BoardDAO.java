package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void insertboard(BoardVO vo) {
		sqlSession.insert("board.insertBoard",vo);
		
	}

	public List<BoardVO> boardList(BoardVO vo) {
		
		return sqlSession.selectList("board.boardList",vo);
	}
}
