<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html >

<head>
  <script>
  function send(){
	var quiz_check = document.querySelector('input[name="quiz_check"]:checked').value;
  	var quiz_answer = document.getElementById("quizAnswer").value;
  	var quizNum = Number(document.getElementById("quizNum").value);
  	var life = Number(document.getElementById("life").value);  
  	
  	if(quiz_check == quiz_answer){
  		alert("정답입니다.");
  		if(20>quizNum){
  			quizNum=quizNum+1;
  			location.href="${path}/app/quizList.do?quizNum="+quizNum;
  		
  		}
  	}
  	else {
  		document.getElementById("life"+life).style.display = "none";
  		life=life-1;
  		document.getElementById("life").value = life;
  		alert("오답입니다!");
  	}
  	if(life==0){
  		location.href="${path}/app/boardList.do";
  	}
  }
  
  </script>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>YongEun Blog</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/clean-blog.min.css" rel="stylesheet" type="text/css">

</head>

<body>

  <jsp:include page="menu.jsp"/>
 
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>YongEun's Blog</h1>
            <span class="subheading">Junior Web Developer</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
      	<table class="table" border="1">
					<tr>
						<td> 목숨:<img id=life1 src="${pageContext.request.contextPath}/resources/img/quiz-life.jpg" alt="none img" width="50" height="50">
							<img id=life2 src="${pageContext.request.contextPath}/resources/img/quiz-life.jpg" alt="none img" width="50" height="50">
							<img id=life3 src="${pageContext.request.contextPath}/resources/img/quiz-life.jpg" alt="none img" width="50" height="50">
							<p id="text_box">${quiz.quiz_idx}번 문제</p><br>
							<p>답 : ${quiz.quiz_answer}</p>
							
							
						</td>
					</tr>
					
					<tr>
						<td>1.<input type="radio" name=quiz_check value="${quiz.quiz_btn1}">${quiz.quiz_btn1}
						</td>
					</tr>
					<tr>
						<td>2.<input type="radio" name=quiz_check value="${quiz.quiz_btn2}">${quiz.quiz_btn2}
						</td>
					</tr>
					<tr>
						<td>3.<input type="radio" name=quiz_check value="${quiz.quiz_btn3}">${quiz.quiz_btn3}
						</td>
					</tr>
					<tr>
						<td>4.<input type="radio" name=quiz_check value="${quiz.quiz_btn4}">${quiz.quiz_btn4}
						</td>
					</tr>
					<tr>
						<td>
							<br>
							
							<input type="button" value="확인" onclick="send();">
							<input type="button" value="취소" onclick="goback();">
							<input type="hidden" id="quizNum" name="quizNum" value="${quizNum}">
							<input type="hidden" id="quizAnswer" name="quizAnswer" value="${quiz.quiz_answer}">
							<input type="hidden" id="life" name="life" value="${life}">
						</td>
					</tr>
				</table>
      
        </div>
      </div>
    </div>
  <hr>

  <!-- Footer -->
  
  <jsp:include page="footer.jsp"/>
 </body>
</html>
