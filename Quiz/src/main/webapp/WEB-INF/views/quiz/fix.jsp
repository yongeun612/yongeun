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
            <h1>Fix Page"src/main/webapp/resources/img"</h1>
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
       <a href="quizList.do"><img src="${pageContext.request.contextPath}/resources/img/cabin.jpg" style="width:320px; height:280px;"/></a>
       <a href="oxQuizList.do"><img src="${pageContext.request.contextPath}/resources/img/cake.jpg" style=" width:320px; height:280px;"/></a>
      </div>
      <input type="hidden" id="user" name="user" value="${sessionScope.userId}">
      
      </div>
    </div>
  </div>

  <hr>

  <!-- Footer -->
  <jsp:include page="footer.jsp"/>

</body>

</html>
