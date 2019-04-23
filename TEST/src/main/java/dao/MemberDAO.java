package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public List<MemberVO> selectList(){
		
		List<MemberVO> list = null;
		
		list = sqlSession.selectList("member.member_list");
		
		return list;
	}

	public boolean loginCheck(MemberVO vo) {
		String name = sqlSession.selectOne("member.loginCheck",vo);
		return (name == null) ? false : true;
	}

	

}
