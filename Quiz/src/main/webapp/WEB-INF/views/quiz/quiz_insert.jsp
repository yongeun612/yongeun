<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
			function send(f) {
		
				var qs_question = f.qs_question.value.trim();
				var qs_answer = f.qs_answer.value.trim();
				var qs_mem_id = f.qs_mem_id.value.trim();
				var ex1 = f.ex1.value.trim();
				var ex2 = f.ex2.value.trim();
				var ex3 = f.ex3.value.trim();
				var ex4 = f.ex4.value.trim();
				var check = false;
		
				if (qs_answer == ex1)
					check = true;
				if (qs_answer == ex2)
					check = true;
				if (qs_answer == ex3)
					check = true;
				if (qs_answer == ex4)
					check = true;
		
				if (check == false) {
					alert("답과 보기를 정확하게 입력하세요.");
					return;
				}
				if (confirm("저장 하시겠습니까?") == true) {
					f.submit();
				}
			}
			
			function goback(){
				//location.href = "QuizGet.do";
			}
		</script>
	</head>
	<body>
		<div class="wrapper">
			<form action="quizinsert.korea">
				<table id="table_box">
					<tr>
						<td>문제 입력 : <br>
							<textarea name="qs_question" id="text_box"></textarea>
						</td>
					</tr>
	
					<tr>
						<td>1. 
							<input type="text" name="ex1" >
						</td>
					</tr>
	
					<tr>
						<td>2. 
							<input type="text" name="ex2" >
						</td>
					</tr>
	
					<tr>
						<td>3. 
							<input type="text" name="ex3" >
						</td>
					</tr>
	
					<tr>
						<td>4. 
							<input type="text" name="ex4" >
						</td>
					</tr>
	
					<tr>
						<td>정답 : 
							<input type="text" name="qs_answer" >
						</td>
					</tr>
	
					<tr>
						<td><input type="button" value="확인" onclick="send(this.form);">
							<input type="button" value="취소" onclick="goback();"></td>
					</tr>
				</table>
					<input type="hidden" id="qs_mem_id" name="qs_mem_id" value="mem_id">
			</form>
		</div>
	</body>
</html>