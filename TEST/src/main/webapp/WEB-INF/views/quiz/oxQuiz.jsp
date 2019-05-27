<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html >

<head>
  <script>
  function send(quiz_check){
  	var quiz_answer = document.getElementById("quizAnswer").value;
  	var quizNum = Number(document.getElementById("quizNum").value);
  	var highScore = Number(document.getElementById("highScore").value);
  	var life = Number(document.getElementById("life").value);  
  	
  	if(quiz_check == quiz_answer){
  		alert("정답입니다.");
  		if(20>quizNum){
  			quizNum=quizNum+1;
  			location.href="${path}/app/oxQuiz.do?quizNum="+quizNum+"&highScore="+highScore;
  		
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
  <div style="float:right;background-image: URL('${pageContext.request.contextPath}/resources/img/quiz-rank.jpg'); width: 400px ; height:450px ; background-repeat: no-repeat; background-size: 200px 450px;">
  <table style="width: 200px ; height:450px ; font-weight: bold;  text-align: center;">
  <tr>
	  <td>
	  </td>
	  <td>
	  	순위
	  </td>
	  <td>
	  </td>
  </tr>
  <c:forEach var="rank" items="${rank}"  begin="0" end="9">
  <tr>
	  <td style="text-align: right;">
	  ${rank.rankNum}.
	  </td>
	  <td> 
	  ${rank.rank_user}
	  </td>
	  <td>
	  ${rank.rank_ox_score}
	  </td>
  </tr> 
  </c:forEach>
  
  </table>
  
  </div>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
      <div style="background-image: URL('${pageContext.request.contextPath}/resources/img/quiz-board.jpg'); background-size: contain; width: 700px ; height:450px ; background-repeat: no-repeat; background-position: center; background-size: 700px 450px; margin-left: auto; margin-right: auto;">
      	<table style="border:hidden;margin-left: auto; margin-right: auto; width: 600px ; height:400px ; color:white; font-weight: bold;" >
					<tr>
						<td style="text-align: center;">
							<p id="text_box">${quiz.oxquiz_idx}번 문제</p>
						</td>
					</tr>
					<tr>
					<td>
					 <p>${quiz.oxquiz_question}</p>
					</td>
					</tr>
					<tr>
						<td>
						<a href="javascript:send('O')"  style="color: white;font-weight: bold;">1. O</a>
						</td>
					</tr>
					<tr>
						<td>
						<a href="javascript:send('X')"  style="color: white;font-weight: bold;">2. X</a>
						</td>
					</tr>
					<tr>
						<td>
							<div style="float:left">	
						 	Life :<img id=life1 src="${pageContext.request.contextPath}/resources/img/quiz-life.jpg" alt="none img" width="50" height="50">
							<img id=life2 src="${pageContext.request.contextPath}/resources/img/quiz-life.jpg" alt="none img" width="50" height="50">
							<img id=life3 src="${pageContext.request.contextPath}/resources/img/quiz-life.jpg" alt="none img" width="50" height="50">	
							</div>
							
							<div style="float:right" >
							<a href="${path}/app/home.do"><img src="${pageContext.request.contextPath}/resources/img/quiz-home.jpg" width="70" height="70"/> </a>
															
							</div>
							
							<input type="hidden" id="highScore" name="highScore" value="${highScore}">
							<input type="hidden" id="quizNum" name="quizNum" value="${quizNum}">
							<input type="hidden" id="quizAnswer" name="quizAnswer" value="${quiz.oxquiz_answer}">
							<input type="hidden" id="life" name="life" value="${life}">
						</td>
					</tr>
				</table>
      		</div>
        </div>
      </div>
    </div>
  <hr>

  <!-- Footer -->
  
  <jsp:include page="footer.jsp"/>
 </body>
</html>
