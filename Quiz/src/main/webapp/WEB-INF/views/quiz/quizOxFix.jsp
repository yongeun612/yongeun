<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
  <script type="text/javascript">
  function fix(f){
		var check=confirm("수정하시겠습니까?");
		if(check == false){
			return;
		}
		f.action="oxQuizFix.do";
		f.submit();
	}</script>
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
					<form>
						번호:<input type="text" class="form-control" name="oxquiz_idx" id="oxquiz_idx" readOnly value="${oxQuiz.oxquiz_idx}"/>
						문제:<input type="text" class="form-control" name="oxquiz_question" id="oxquiz_question" value="${oxQuiz.oxquiz_question}"/>
						답:<input type="text" class="form-control" name="oxquiz_answer" id="oxquiz_answer" value="${oxQuiz.oxquiz_answer}"/>
						<br>
						<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="fix(this.form);">저장</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='quizList.do'">목록</button>
					</form>
      </div>
      
      </div>
    </div>
  </div>

  <hr>

  <!-- Footer -->
  <jsp:include page="footer.jsp"/>

</body>

</html>
