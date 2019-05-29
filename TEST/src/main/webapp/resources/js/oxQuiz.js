function send(quiz_check){
  	var quiz_answer = document.getElementById("quizAnswer").value;
  	var quizNum = Number(document.getElementById("quizNum").value);
  	var highScore = Number(document.getElementById("highScore").value);
  	var life = Number(document.getElementById("life").value);  
  	
  	if(quiz_check == quiz_answer){
  		alert("정답입니다.");
  		if(20>quizNum){
  			quizNum=quizNum+1;
  			location.href="oxQuiz.do?quizNum="+quizNum+"&highScore="+highScore;
  		
  		}
  	}
  	else {
  		document.getElementById("life"+life).style.display = "none";
  		life=life-1;
  		document.getElementById("life").value = life;
  		alert("오답입니다.");
  	}
  	
  	if(life==0){
  		location.href="home.do";
  	}
  	
  }