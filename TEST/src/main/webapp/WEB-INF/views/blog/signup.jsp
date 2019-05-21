<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>


<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>YongEun Blog</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/clean-blog.min.css" rel="stylesheet">


  <script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
  <script>	
	function idCheck() {
			var id = document.getElementById("blog_id").value;
			if (id == '') {
				return;
			}
			var url = "idCheck.do";
			var param = "blog_id="+encodeURIComponent(id);
	
			sendRequest(url, param, resultFn, "POST");
		}
	
		function resultFn() {
			
			if (xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
				var json = eval(data);
				if (json == '1') {
					document.getElementById("check").style.display="block";
				}else{
					document.getElementById("check").style.display="none";
				}
			}
		}
		
		function pwCheck(){
			var pw = document.getElementById("blog_pw").value;
			var repw = document.getElementById("blog_rpw").value;
			if( pw ==''||repw=='')return;
			if(pw!=repw){
				document.getElementById("check2").style.display="block";
			}else{
				document.getElementById("check2").style.display="none";
			}
		}	
		
		
		function send(f){
			var name = f.blog_name.value;
			var email = f.blog_email.value;
			var id = f.blog_id.value;
			var pw = f.blog_pw.value;
			var rpw = f.blog_rpw.value;
			if(name==""){
				alert("이름을 입력해주세요.");
				f.blog_name.focus();
				return;
			}
			if(email==""){
				alert("이메일을 입력해주세요.");
				f.blog_email.focus();
				return;
			}
			if(id==""){
				alert("아이디를 입력해주세요.");
				f.blog_id.focus();
				return;
			}
			if(pw==""){
				alert("비밀번호를 입력해주세요.");
				f.blog_pw.focus();
				return;
			}
			if(rpw=""){
				alert("비밀번호 확인을 입력해주세요.");
				f.blog_rpw.focus();
				return;
			}
			
			confirm("가입하시겠습니까?");
			f.action="memberSend.do";
			f.submit();
		}
  </script>	

</head>

<body>
  <jsp:include page="menu.jsp"/>
  
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>Contact Me</h1>
            <span class="subheading">Have questions? I have answers.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <p>Want to get in touch? Fill out the form below to send me a message and I will get back to you as soon as possible!</p>
        <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
        <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
        <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
        <form name="signupForm" id="signupForm" method="POST">
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>Name</label>
              <input type="text" class="form-control" placeholder="Name" name="blog_name" id="blog_name" required data-validation-required-message="Please enter your name.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>Email Address</label>
              <input type="email" class="form-control" placeholder="Email Address" name="blog_email" id="blog_email" required data-validation-required-message="Please enter your email address.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>ID</label>
              <input type="text" class="form-control" placeholder="ID" name="blog_id" id="blog_id"  oninput="idCheck();" required data-validation-required-message="Please enter your Id.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
  			<h6 style="display: none;color:red" id="check">아이디가 이미 존재합니다.</h6>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>Password</label>
              <input type="password" class="form-control" placeholder="Password" name="blog_pw" id="blog_pw" oninput="pwCheck();" required data-validation-required-message="Please enter your password.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>Re-enter password</label>
              <input type="password" class="form-control" placeholder="Re-enter password" id="blog_rpw" oninput="pwCheck();" required data-validation-required-message="Please enter your password.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <h6 style="display: none;color:red" id="check2">비밀번호가 일치하지 않습니다.</h6>
          <br>
          
          
          <div id="success"></div>
          <div class="form-group">
            <button class="btn btn-primary" id="sendBtn" onclick="send(this.form);">Send</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <hr>

  <!-- Footer -->
  <jsp:include page="footer.jsp"/>

</body>

</html>
