function send(f) {
	var userId = f.blog_id.value.trim();
	var userPw = f.blog_pw.value.trim();
	
	if(userId == ""){
		alert("아이디를 입력하세요.");
		f.blog_id.focus();
		return;
	}
	
	if(userPw == ""){
		alert("패스워드를 입력하세요.");
		f.blog_pw.focus();
		return;
	}
	
	f.action="loginCheck.do";
	f.submit();
	
}