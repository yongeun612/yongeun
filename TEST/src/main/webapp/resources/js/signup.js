	function idCheck() {
			var id = document.getElementById("blog_id").value;
			if (id == '') {
				return;
			}
			var url = "idCheck.do";
			var param = "blog_id="+encodeURIComponent(id);
	
			sendRequest(url, param, resultFn, "POST");
		}
	
	function resultFn() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
				var json = eval(data);
				
				if (json == '1') {
					document.getElementById("check").style.display="block";
				}else{
					document.getElementById("check").style.display="none";
				}
			}
		}
		
	function pwCheck(){
			var pw = document.getElementById("blog_pw").value;
			var repw = document.getElementById("blog_rpw").value;
			
			if( pw ==''||repw=='')return;
			if(pw!=repw){
				document.getElementById("check2").style.display="block";
			}else{
				document.getElementById("check2").style.display="none";
			}
		}	
		
		
	function send(f){
			
			var name = f.blog_name.value;
			var email = f.blog_email.value;
			var id = f.blog_id.value;
			var pw = f.blog_pw.value;
			var rpw = f.blog_rpw.value;
			
			if(name==""){
				alert("이름을 입력해주세요.");
				f.blog_name.focus();
				return;
			}
			if(email==""){
				alert("이메일을 입력해주세요.");
				f.blog_email.focus();
				return;
			}
			if(id==""){
				alert("아이디를 입력해주세요.");
				f.blog_id.focus();
				return;
			}
			if(pw==""){
				alert("비밀번호를 입력해주세요.");
				f.blog_pw.focus();
				return;
			}
			if(rpw=""){
				alert("비밀번호 확인을 입력해주세요.");
				f.blog_rpw.focus();
				return;
			}
			confirm("가입하시겠습니까?");
			f.action="memberSend.do";
			f.submit();
	}