package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	public BoardVO boardView(String board_title) {
		
		return sqlSession.selectOne("board.boardView",board_title);
	}

	public void boarClick(String board_title) {
		sqlSession.update("board.boardClick",board_title);
	}

	public int countPage(String searchOption, String keyword) {
		return sqlSession.selectOne("board.boardCount");
	}

	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) {
		
		Map<String,Object> map = new  HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("searchOption",searchOption);
		map.put("keyword",keyword);
		return sqlSession.selectList("board.listAll",map);
	}
}
