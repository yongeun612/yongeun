<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
  <script>
	  function list(page){
			location.href="boardList.do?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
		}
  </script>
  
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
	
  <title>Free board</title>

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
            <h1>Free board</h1>
            <span class="subheading">Fill it out as much as you want.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
      <c:forEach items="${map.list}" var="list">
        <div class="post-preview">
          <a href="${path}/app/boardView.do?board_idx=${list.board_idx}">
            <h2 class="post-title">
              ${list.board_title}
            </h2>
            <h3 class="post-subtitle">
             ${list.board_writer}
            </h3>
          </a>
          <p class="post-meta">Posted on 
          <fmt:parseDate value="${list.board_date} " var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
     	  <fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd"/>
                    click : ${list.board_cnt}</p>
          <hr>
        </div>
        </c:forEach>
        <!-- Pager -->
        <div class="clearfix">
	        <tr>
			  	<td colspan="5">
					<c:if test="${map.boardPager.curBlock >= 1}">
						<a href="javascript:list('1')">[처음]</a>
					</c:if>
			  		
			  		<c:if test="${map.boardPager.curBlock > 1 }">
			  			<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
			  		</c:if>
			  		<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
			  			<c:choose>
			  				<c:when test="${num == map.boardPager.curPage }">
			  					<span style="color: red">${num}</span>&nbsp;
			  				</c:when>
			  				<c:otherwise>
			  					<a href="javascript:list('${num}')">${num}</a>&nbsp;
			  				</c:otherwise>
			  			</c:choose>
			  		</c:forEach>
			  			
			  		<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
			  			<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
			  		</c:if>
			  		
			  		<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
			  			<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
			  		</c:if>
			  	</td>
			  </tr>
  
  <form name="searchForm" method="post" action="${path}/app/boardList.do">
  	<select name="searchOption">
  		<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >제목+이름+내용</option>
  		<option value="board_title" <c:out value="${map.searchOption == 'board_title'?'selected':''}"/> >제목</option>
  		<option value="board_writer" <c:out value="${map.searchOption == 'board_writer'?'selected':''}"/> >작성자</option>
  		<option value="board_content" <c:out value="${map.searchOption == 'board_content'?'selected':''}"/> >내용</option>
  	</select>
  	<input name="keyword" value="${map.keyword}">
  	<input type="submit" class="btn btn-sm btn-primary" value="조회">
  	<c:if test="${sessionScope.userId != null }">
  	<button type="button" class="btn btn-sm btn-primary" id="writebtn" onclick="location.href='write.do'">작성</button>
  	</c:if>
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
