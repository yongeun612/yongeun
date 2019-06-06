<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>


<head>
  <script src="${pageContext.request.contextPath}/resources/js/fix.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Quiz+</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">	
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
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>Free board</h1>
            <span class="subheading">Fill it out as much as you want.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <article style="width:700px;margin:0 auto;">
		<div class="container" role="main">
			<form name="form" id="form" role="form" method="post" >
				<div class="mb-3">
					<input type="hidden" id="board_idx" name="board_idx" value="${board.board_idx}">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="board_title" id="board_title" value="${board.board_title}" style="width:700px;"/>
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="board_writer" id="board_writer" readonly value="${board.board_writer }" style="width:700px;"/>
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<input type="text" class="form-control" name="board_content" id="board_content" value="${board.board_content}" style="width:700px; height:200px; word-wrap: break-word;" />
				</div>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="fix(this.form);">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='boardList.do'">목록</button>
			</div>
			</form>
		</div>
	</article>
	<hr>
 <jsp:include page="footer.jsp"/>
</body>
</html>
