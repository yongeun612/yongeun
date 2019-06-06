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
				
			var check= confirm("작성하시겠습니까?");
			if(check == false){
				return;
			}
			f.action="boardWrite.do";
			f.submit();
		}