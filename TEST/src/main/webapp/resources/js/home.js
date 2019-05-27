function list(quiz){
	  var userId = document.getElementById("user").value;
	 
	  if(userId==""){
		alert("로그인이 필요한 기능입니다.");
		return;
	}
	
	  location.href=quiz+".do";
}