package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {
	// 쿼리를 수행시킬 클래스 --> 추가, 삭제, 갱신, 조회 등의 메서드 제공
	
	//이 멤버변수는.. xml 파일에 의해 생성된 객체가 주입될 예정
	//코드 상에서 따로 new 를 해서 객체를 만들지 않을 것
	
	SqlSession sqlSession;

	// 주입될 때 사용될 setter
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//select 메서드
	
	public List<MemberVO> selectList(){
		
		List<MemberVO> list = null;
		
		list = sqlSession.selectList("member.member_list");
		
		return list;
	}
	

}
