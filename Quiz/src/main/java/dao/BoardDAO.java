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

	public void insertBoard(BoardVO vo) {
		sqlSession.insert("board.insertBoard",vo);
		
	}


	public BoardVO boardView(int board_idx) {
		
		return sqlSession.selectOne("board.boardView",board_idx);
	}

	public void boardClick(int board_idx) {
		sqlSession.update("board.boardClick",board_idx);
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

	public void updateBoard(BoardVO vo) {
		sqlSession.update("board.updateBoard",vo);
	}

	public void boardDelete(int board_idx) {
		sqlSession.delete("board.deleteBoard",board_idx);
	}
}
