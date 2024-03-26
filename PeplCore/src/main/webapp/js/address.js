document.addEventListener('DOMContentLoaded', function() {
		//우편번호 검색
		const zipbtn = document.querySelector("#zipbtn");

		//버튼이 눌려 졌을 때만 동작
		zipbtn.addEventListener('click', ()=> {
			new daum.Postcode({
				oncomplete : function(data) {
			//		폼명		우편번호코드입력할 input 태그의 이름.값 = 넘어온 데이터의 zonecode값 넘겨 주기
			document.member.zipcode.value = data.zonecode;
			//주소 전체를 받기 위한 변수
			let fullAddress = '';
			
			//추가 주소, 건물명/동명을 받을 변순
			let extendAddress = '';
			
			//기본주소 (R=도로명, J=지번)
			if(data.userSelectedType === 'R'){
				fullAddress = data.roadAddress;
				
				
				//추가 주소 => 법정동/법정리 이름, 건물명
				//빌딩명과 법정동/법정리가 있을 수도 있고 없을 수도 있음
				if(data.bname !== ''){//법정동/법정리
					extendAddress += data.bname;
				}
				if(data.buildingName !== ''){
					extendAddress += (extendAddress !== '' ? ', ' + data.buildingName : data.buildingName);
				}
			//기본주소(추가 주소)
			fullAddress += (extendAddress !== '' ? '(' + extendAddress + ')' : '');
			}else{
				fullAddress = data.jibunAddress;
			}//end of if
			
			//폼에 찍기
			document.member.address1.value = fullAddress;
			document.member.address2.focus();
			
				}
			}).open();

		});//zipbtn이 클릭되었을때 동작의 끝
});//전체 함수 종료
