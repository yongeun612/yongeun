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


	public String idCheck(String blog_id) {
		String name = sqlSession.selectOne("member.IdCheck",blog_id);
		return (name == null) ? "0" : "1";
	}

	public void insertMember(MemberVO vo) {
      sqlSession.insert("member.insertMember",vo);		
	}


	public void insertRank(String id) {
	  sqlSession.insert("member.insertRank",id);
	}

	

}
