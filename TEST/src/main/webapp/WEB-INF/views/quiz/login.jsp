<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Login</title>
  
  <link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginstyle.css" media="screen" type="text/css" />
  
<script>
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


</script>
</head>

<body>

  <div class="login-card">
    <h1>Log-in</h1><br>
  <form name="loginForm" method="POST">
    <input type="text" name="blog_id"  id="blog_id" placeholder="Username">
    <input type="password" name="blog_pw" id="blog_pw" placeholder="Password">
    <input type="button" name="btnlogin" id="btnlogin" class="login login-submit" value="login" onclick="send(this.form);">
  	
  	<c:if test="${msg == 'failure'}">
  		<div style="color: red"> <h5>아이디 또는 비밀번호가 일치하지 않습니다.</h5></div>
  	</c:if>
  </form>

  <div class="login-help">
    <a href="signup.do">Sign up</a> • <a href="#">Forgot Password</a>
  </div>
</div>


  <script src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>

</body>

</html>