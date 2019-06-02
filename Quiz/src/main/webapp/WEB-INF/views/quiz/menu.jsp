<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
		</title>
	
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
	
		<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
	    <div class="container">
	      <a class="navbar-brand" href="home.do">Quiz+</a>
	      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	        Menu<i class="fas fa-bars"></i>
	      </button>
	      <div class="collapse navbar-collapse" id="navbarResponsive">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item">
	            <a class="nav-link" href="home.do">Quiz Home</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="boardList.do">board</a>
	          </li>
	          <c:if test="${sessionScope.userId== null}">
		          <li class="nav-item">
		          	<a class="nav-link" href="login.do">sign in</a>
		          </li>
	          </c:if>
	          <c:if test="${sessionScope.userId != null}">
		          <li class="nav-item">
		          	<a class="nav-link" href="logout.do">sign out</a>
		          </li>
	          </c:if>
	          <li class="nav-item">
	            <a class="nav-link" href="signup.do">Sign up</a>
	          </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	</body>
	
	
</html>