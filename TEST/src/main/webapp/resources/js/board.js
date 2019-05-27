function list(page){
  		location.href="${path}/app/boardList.do?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
  	}