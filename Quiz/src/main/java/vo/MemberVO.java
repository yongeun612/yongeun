package vo;

public class MemberVO {
	
	private int blog_idx; //회원 인덱스
	private String blog_name; //이름
	private String blog_id;  //아이디
	private String blog_pw; //비밀번호
	private String blog_email; //이메일주소
	
	
	public int getBlog_idx() {
		return blog_idx;
	}
	public void setBlog_idx(int blog_idx) {
		this.blog_idx = blog_idx;
	}
	public String getBlog_name() {
		return blog_name;
	}
	public void setBlog_name(String blog_name) {
		this.blog_name = blog_name;
	}
	public String getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(String blog_id) {
		this.blog_id = blog_id;
	}
	public String getBlog_pw() {
		return blog_pw;
	}
	public void setBlog_pw(String blog_pw) {
		this.blog_pw = blog_pw;
	}
	public String getBlog_email() {
		return blog_email;
	}
	public void setBlog_email(String blog_email) {
		this.blog_email = blog_email;
	}
	
	
}
