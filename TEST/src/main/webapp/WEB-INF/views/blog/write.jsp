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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">	
  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/clean-blog.min.css" rel="stylesheet">


  <script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

<script>	
		
		function send(f){
			var title = f.board_title.value;
			var content = f.board_content.value;
			var writer = f.board_writer.value;
			if(title==""){
				alert("제목을 입력해주세요.");
				f.board_title.focus();
				return;
			}
			if(writer==""){
				alert("작성자를 입력해주세요.");
				f.board_writer.focus();
				return;
			}
			if(content==""){
				alert("글내용을 입력해주세요.");
				f.board_content.focus();
				return;
			}
				
			confirm("작성하시겠습니까?");
			f.action="boardWrite.do";
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

  <article style="width:700px;margin:0 auto;">

		<div class="container" role="main">

			<h2>board Form</h2>

			<form name="form" id="form" role="form" method="post" >

				<div class="mb-3">

					<label for="title">title</label>

					<input type="text" class="form-control" name="board_title" id="board_title" placeholder="제목을 입력해 주세요" style="width:700px;">

				</div>

				

				<div class="mb-3">

					<label for="reg_id">작성자</label>

					<input type="text" class="form-control" name="board_writer" id="board_writer" placeholder="이름을 입력해 주세요" style="width:700px;">

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="board_content" id="board_content" placeholder="내용을 입력해 주세요"style="width:700px;" ></textarea>

				</div>

			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="send(this.form);">저장</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='boardList.do'">목록</button>
			</div>

			</form>

			

		</div>

	</article>
	
	<hr>
 <jsp:include page="footer.jsp"/>
</body>
 

</html>
