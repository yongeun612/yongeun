package vo;

public class MemberVO {
	// 이때 멤버변수이름은 테이블의 컬럼명과 일치시킴
	
	private int blog_idx;
	private String blog_name;
	private String blog_id;
	private String blog_pw;
	private String blog_email;
	
	
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
