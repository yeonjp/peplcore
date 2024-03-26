<%@page import="com.peplcore.blogic.product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
/*글꼴 import*/
@font-face {
	font-family: "GmarketSansMedium";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "GmarketSansMedium";
}

body {
	margin: 0 auto;
	background-color: #373f52;
	width: 1400px;
	height: 820px;
}

.container {
	width: 1400px;
	height: 820px;
	background-color: #edf0f2;
}

/* 공통 코드 : a*/
a {
	color: black;
	text-decoration: none;
	display: block;
}

/*header*/
.header {
	font-family: "GmarketSansMedium";
	font-weight: bold;
	width: 1400px;
	height: 80px;
	display: flex;
	justify-content: space-between;
	background-color: #272e3d;
	align-items: center;
}

.header a {
	color: white;
}

.header>h1, img {
	display: inline-block;
	vertical-align: middle;
}

.header>img {
	width: 160px;
	height: 80px;
}

.header>topNav {
	text-decoration: none;
	display: block;
}

.admin {
	font-size: 1rem;
	font-weight: bold;
	margin-left: 10px;
}

.topNav {
	margin-right: 25px;
}

.topNav li {
	display: inline-block;
}

/*leftmain*/
.leftmain {
	font-family: "GmarketSansMedium";
	font-weight: bold;
	width: 150px;
	height: 680px;
	float: left;
	text-align: center;
	background-color: #272e3d;
}

.sideMenu {
	margin: 0;
	padding: 0;
	width: 150px;
}

.sideMenu>li {
	list-style: none;
	padding: 0;
	width: 150px;
	text-align: center;
	line-height: 40px;
	background-color: #272e3d;
	border: 0;
}

.sideMenu a {
	color: white;
}

.userhr {
	border-top: 1px solid #494e5a;
}

/* 아코디언 */
.accordion-header {
	background-color: #272e3d;
	color: #fff;
	padding: 15px;
	cursor: pointer;
}

.accordion-content {
	width: 120px;
	border-radius: 5px;
	display: none;
	margin-left: 15px;
	padding: 15px;
	background-color: #151f37;
}

.accordion-content a {
	color: gray;
}
/* 마우스 올렸을 때 반응! */
.sideMenu .accordion-header:hover {
	background-color: #ffd343;
	transition: 0.7s;
	color: #272e3d;
}

/*main*/
.main {
	margin: 0;
	padding: 0;
	width: 1250px;
	height: 680px;
	float: left;
}

/*mainNav*/
.mainNav li {
	display: inline-block;
}

/* 버튼 변경하기!!! */
.insertBtn, .cancletBtn {
	background-color: #04AA6D;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}
/*maincontent*/
.maincontent {
	width: 1150px;
	height: 600px;
	margin: 40px auto;
}
/*상품목록*/
.mainh {
	width: 1150px;
	height: 30px;
	display: flex;
	justify-content: space-between;
	margin-bottom: 5px;
}

.mainh>h3 {
	text-align: center;
	font-size: 1.2rem;
	font-weight: bold;
}

.mainh>h4 {
	text-align: center;
	font-size: 1rem;
	font-weight: bold;
	border: 1px solid #ccc;
	background-color: #ffd343;
}
/*상품 등록*/
.uploadCancle {
	width: 100px;
	height: 30px;
}

.uploadCancle>h4 {
	text-align: center;
	font-size: 1rem;
	font-weight: bold;
	border: 1px solid #ccc;
	background-color: #ffd343;
	margin-bottom: 1px;
}

.maincontent>h3 {
	font-size: 1.2rem;
	font-weight: bold;
	margin-bottom: 10px;
}

.maincontent>hr {
	border: 1px solid black;
	margin-bottom: 10px;
}

.maincontent>.lasthr {
	border: 1px solid black;
	margin-top: 30px;
	margin-bottom: 30px;
}

.maincontent>h4 {
	font-weight: bold;
	margin: 0;
	padding: 0;
}

table {
	margin: 0;
	padding: 0;
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
	border: 1px solid black;
	border-collapse: collapse;
	width: 800px;
}

th, td {
	width: 100px;
	height: 30px;
	margin: 0;
	padding: 0;
	border: 1px solid black;
}

h4 {
	margin-bottom: 15px;
}

textarea {
	resize: none;
}
/*footer*/
.Footer {
	text-align: center;
	clear: both;
	width: 1400px;
	height: 60px;
	line-height: 60px;
	background-color: #fff;
}
</style>
</head>
<body>
	<!-- container-->
	<div class="container">
		<!-- header-->
		<div class="header">
			<h1 class="admin">
				<a href="./index_jyp.html">ADMINISTRATOR</a>
			</h1>
			<!--logo-->
			<img class="mainlogo" src="../images/yellow.png"
				alt="This is PeplCore logo" />
			<!--topNav-->
			<div class="topNav">
				<ul>
					<li><a href="#"> <i class="fa-solid fa-store fa-lg"></i>&nbsp;쇼핑몰&nbsp;&nbsp;&nbsp;
					</a></li>
					<li><a href="#"><i
							class="fa-solid fa-arrow-right-from-bracket"></i>&nbsp;로그아웃</a></li>
				</ul>
				<!--end of topNav-->
			</div>
			<!--end of header-->
		</div>
		<!-- 왼쪽 사이드바 메뉴, 아코디언 사용할거임 -->
		<div class="leftmain">
			<ul class="sideMenu">
				<!-- 회원 관리 -->
				<li>
					<div class="accordion-header userhr"
						onmouseover="ToggleAccordion(this)">회원 관리</div>
					<div class="accordion-content">
						<!--display:none-->
						<p>
							<a href="#">회원 관리</a>
						</p>
					</div>
				</li>
				<!-- 상품 관리 -->
				<li>
					<div class="accordion-header" onmouseover="ToggleAccordion(this)">
						상품 관리</div> <!--display:none-->
					<div class="accordion-content">
						<p>
							<a href="productManagement.pc">상품 목록</a>
						</p>
					</div>
				</li>
				<!-- 게시글 관리 -->
				<li>
					<div class="accordion-header" onmouseover="ToggleAccordion(this)">
						게시글 관리</div> <!--display:none-->
					<div class="accordion-content">
						<p>
							<a href="#">공지사항</a>
						</p>
						<p>
							<a href="#">FAQ</a>
						</p>
						<p>
							<a href="#">QnA</a>
						</p>
						<p>
							<a href="#">review</a>
						</p>
					</div>
				</li>
			</ul>
			<!-- end of leftmain-->
		</div>

		<!-- main-->
		<div class="main">
			<!--maincontent-->
			<div class="maincontent">
				<h3>상품 등록</h3>
				<hr />
				<!-- 사진을 보낼려면 form 태그에 enctype = multipart/form-data를 작성해주고 -->
				<form action="insertProduct.pc" method="post">
<!-- 				<form action="insertProduct.pc" method="post" enctype="multipart/form-data"> -->
<!-- 				<form action="insertProduct.pc" method="post"> -->
					<table>
						<tr>
							<th>상품 번호</th>
							<%
							ProductDAO dao = new ProductDAO();
							%>
							<td><input type="text" name="pseq" readonly="readonly"
								value="<%= dao.getLastProductSeq() + 1 %>" /></td>
							<%-- <td><%= dao.getLastProductSeq() + 1 %></td> --%>
						</tr>
						<tr>
							<th>상품 분류</th>
							<td>
								<select name="pcategory" id="pcategorySelect" >
									<option value="상의">상의</option>
									<option value="하의">하의</option>
									<option value="신발">신발</option>
									<option value="악세사리">악세사리</option>
								</select>
							</td>
								
						</tr>
						<tr>
							<th>상품 이름</th>
							<td><input type="text" name="pname" /></td>
						</tr>
						<tr>
							<th>상품 수량</th>
							<td><input type="text" name="pnum" value="0"/></td>
						</tr>
						<tr>
							<th>상품 품절 여부</th>
							<td><input type="radio" name="poutStock" value="품절">품절
								<input type="radio" name="poutStock" value="재고있음">재고있음</td>
						</tr>
						<tr>
							<th>상품 사이즈</th>
							<%-- free - 여건 되면 s, m, l, xl로 세분화해주기
								 못하겠어요! 그냥 FREE로 고정해버릴래요ㅋㅋㅋㅋㅋㅜㅜ --%>
							<td>
								<input type="text" name="psize" readonly="readonly" value="FREE"/>
							</td>
						</tr>
						<tr>
							<th>상품 설명</th>
							<td><textarea name="pdescription" cols="60" rows="10"
									placeholder="내용을 입력해 주세요."></textarea></td>
						</tr>
						<tr>
							<th>상품 원가</th>
							<td><input type="text" name="pcost" value="0"/></td>
						</tr>
						<tr>
							<th>상품 판매가</th>
							<td><input type="text" name="pselling" value="0"/></td>
						</tr>

					</table>
					<input type="submit" name="insertProduct" class="insertBtn" value="등록완료" id="registerBtn"></input> 
					<input type="button" name="cancleProduct" class="cancletBtn" value="등록취소" onclick="location.href='productManagement.pc'"></input>
				</form>
				<!-- 					<span><a href="insertProduct.pc">등록</a></span> -->

			</div>
			<!-- end of maincontent-->
		</div>
		<!--end of main-->

		<!--footer-->
		<div class="Footer">
			<p>Copyright &copy; 주식회사 불사조 All Rights Reserved</p>
		</div>
		<!--end of footer-->
	</div>
	<!-- end of container -->

	<!-- 아코디언 js 코드 -->
	<script>
		function ToggleAccordion(sideMenu) {
			var content = sideMenu.nextElementSibling;
			if (content.style.display === "block") {
				content.style.display = "none";
			} else {
				content.style.display = "block";
			}
		}
	</script>
	<!-- checkbox 하나만 선택. -->
	<script>
	
	const selectBox = document.getElementById('pcategorySelect');
	const registerBtn = document.getElementById('registerBtn');
	
	selectBox.addEventListener('change', function() {

		const selectedValue = selectBox.value;
		
		console.log('선택된 값 : ', selectedValue);
	});
	
	registerBtn.addEventListener('change', function() {
		console.log('상품 등록 버튼이 클릭되었습니다.')
	});
   /*  function checkOnlyOne(element){
        
        // pcategory의 값을 가지는 element들을 전부 다 가져와서 나열해준다.
        const checkBoxes = document.getElementsByName("pcategory");
        
        // 앞에 선택된 체크박스들이 있으면 해제한다.
        // 체크 여부: checked
        /* element.checked = false; */
        //checkBoxes.forEach((cb)=>{
            //cb.checked = false;
       // })
        
        // 원래 진짜 선택하려고 했던 체크박스는 체크가 될 수 있게 한다.
        //element.checked = true;
        
   // } */
</script>
</body>
</html>