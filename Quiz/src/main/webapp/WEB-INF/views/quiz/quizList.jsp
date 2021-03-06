<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
  <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Quiz+</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/clean-blog.min.css" rel="stylesheet">

</head>

<body>
  <jsp:include page="menu.jsp"/>
  
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/pageimg5.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>Quiz Plus</h1>
            <span class="subheading">Choose between two quizzes.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
	      <div style="margin-left: auto; margin-right: auto; display: block;">
			<table class="table">
				<thead>
				<tr>
					<th>No.</th>
					<th>문제</th>
					<th>답</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th></th>
					<th></th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="quiz" items="${quiz}">
					<tr>
							<td>${quiz.quiz_idx}</td>
							<td>${quiz.quiz_question}</td>
							<td>${quiz.quiz_answer}</td>
							<td>${quiz.quiz_btn1}</td>
							<td>${quiz.quiz_btn2}</td>
							<td>${quiz.quiz_btn3}</td>
							<td>${quiz.quiz_btn4}</td>
							<td><a href="${path}/app/quizFixPage.do?quiz_idx=${quiz.quiz_idx}">수정</a></td>
							<td><a href="${path}/app/quizDel.do?quiz_idx=${quiz.quiz_idx}">삭제</a></td>
					</tr>
				</c:forEach>
				
				</tbody>
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
