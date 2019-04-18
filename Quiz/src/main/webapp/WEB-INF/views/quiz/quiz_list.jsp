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
		var qs_check = f.querySelector('input[name="qs_check"]:checked').value;
		var qs_answer = f.qs_answer.value;
		var quizNum = f.quizNum.value;
		var qs_idx = Number(f.qs_idx.value);
		var life = f.life.value;
		var user = f.user.value;
		
		if (qs_check == qs_answer) {
			alert("정답입니다!");
			document.getElementById("qs_idx").value = qs_idx+1;
			f.submit();

		} else {
			life=life-1;
			document.getElementById("life").value = life;
			alert("오답입니다!"+life);
			
			if(life==0){
				location.href ="endGame.korea";
			}
			return;
			//점수 페이지
		}
	}
	
	function goback(){
		//location.href = "main.jsp";
	}
	

</script>
</head>
<body>


<form action="quiznext.korea">
				<table  border="1">
					<tr>
						<td id="q">${list[0].qs_idx} 번 문제  ${user}
							<p id="text_box">${list[0].qs_question}</p><br>
							<p>${list[0].qs_answer}</p>
						</td>
					</tr>
					
					<tr>
						<td>1.<input type="radio" name=qs_check value="${list[0].ex1}">${list[0].ex1}
						</td>
					</tr>
	
					<tr>
						<td>2.<input type="radio" name=qs_check value="${list[0].ex2}">${list[0].ex2}
						</td>
					</tr>
	
					<tr>
						<td>3.<input type="radio" name=qs_check value="${list[0].ex3}">${list[0].ex3}
						</td>
					</tr>
	
					<tr>
						<td>4.<input type="radio" name=qs_check value="${list[0].ex4}">${list[0].ex4}
						</td>
					</tr>
	
					<tr>
						<td>
							<br>
							<input type="button" value="확인" onclick="send(this.form);">
							<input type="button" value="취소" onclick="goback();">
						</td>
					</tr>
				</table>
				
				<input type="hidden" id="qs_idx" name="qs_idx" value="${list[0].qs_idx}">
				<input type="hidden" id="quizNum" name="quizNum" value="${quizNum}">
				<input type="hidden" id="life" name="life" value="${life}">
				<input type="hidden" id="user" name="user" value="${user}">
				<input type="hidden" name="qs_answer" value="${list[0].qs_answer}">
			</form>
			
			<table border="1">
			<tr>
			<td>순위</td>
			<td>이름</td>
			<td>점수</td>
			</tr>
			<c:forEach var="score" items="${rank}">
			<tr>
			<td>${score.rank }</td>
			<td>${score.mem_name }</td>
			<td>${score.mem_score }</td>
			</tr>
			
			</c:forEach>
			
			
			
			</table>


</body>
</html>