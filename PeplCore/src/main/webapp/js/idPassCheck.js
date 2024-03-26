/**
 * 
 */
//비밀번호 확인

		function passwordCheckFunction(){
			//javascript
			/* let password1 = document.querySelector("#password1"); 
			let password2 = document.querySelector("#password2");
			
			if(password1 !== password2){
				let span = document.querySelector("#passwordText");
				span.textContent = "비밀번호가 일치하지 않습니다."
			}else{
				let span = document.querySelector("#passwordText");
				span.textContent = "비밀번호가 일치합니다."
			}//end of if
			 */
			
			
			//jQuery
			let pass1 = $('#pass1').val();//password1의  value값을 가져 옴
			let pass2 = $('#pass2').val();//password2의  value값을 가져 옴
			
			if(pass1 !== pass2){
				$("#passwordText").text("비밀번호가 일치하지 않습니다.").css("color","red");
			}else{
				$("#passwordText").text("일치합니다").css("color","blue");
				//$("#password2").attr("disabled",true)//비활성화
			}//end of if
			
		}//end of passwordCheckFunction()

// 아이디 중복체크 

	function registerFunction() {
		let id = $("#id").val();
		//$.ajax({타입,경로, 동기화 여부, 성공하면 할일})
		//$.ajax({type:'get/post', url:'경로', async : true/false, success : function(result){}})
		$.ajax({

			type : 'POST', //전달 방식, 경로, 데이터를 넣어 줘야 함
			url : 'memberDuplicateCheck.mc', //URL 맵핑
			//파라미터 : 값
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					$('#idText').text("사용할 수 있는 아이디 입니다.").css("color","blue");
				} else {
					$('#idText').text("사용할 수 없는 아이디 입니다.").css("color","red");
				}//end of if
			}//end of function

		});//end of $.ajax
	}//end of registerFunction
