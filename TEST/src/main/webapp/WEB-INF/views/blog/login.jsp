<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Login</title>

  <link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginstyle.css" media="screen" type="text/css" />

<script>
function send(f) {
	var userId = f.userId.value.trim();
	var userPw = f.password.value.trim();
	if(userId == ""){
		alert("아이디를 입력하세요.");
		f.userId.focus();
		return;
	}
	if(userPw == ""){
		alert("패스워드를 입력하세요.");
		f.password.focus();
		return;
	}
	f.action="loginCheck.do";
	f.submit();
	
}


/* 
$(document).ready(function(){
	$("#btnlogin").click(function(){
	var userId = $("#userId").val();
	var userPw = $("#password").val();
	console.log(userId, userPw);
	if(userId == ""){
		alert("아이디를 입력하세요.");
		$("#userId").focus();
		return;
	}
	if(userPw == ""){
		alert("비밀번호를 입력하세요.");
		$("#password").focus();
		return;
	}
	document.loginForm.action="loginCheck.do";
	document.loginForm.submit();
	});
}); */

</script>
</head>

<body>

  <div class="login-card">
    <h1>Log-in</h1><br>
  <form name="loginForm" method="post">
    <input type="text" name="userId"  id="userId" placeholder="Username">
    <input type="password" name="password" id="password" placeholder="Password">
    <input type="button" name="btnlogin" id="btnlogin" class="login login-submit" value="login" onclick="send(this.form);">
  </form>

  <div class="login-help">
    <a href="signup.do">Sign up</a> • <a href="#">Forgot Password</a>
  </div>
</div>


  <script src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>

</body>

</html>