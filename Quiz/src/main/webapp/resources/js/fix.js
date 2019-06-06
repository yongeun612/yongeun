function fix(f){
			var check=confirm("수정하시겠습니까?");
			if(check == false){
				return;
			}
			f.action="boardFix.do";
			f.submit();
		}