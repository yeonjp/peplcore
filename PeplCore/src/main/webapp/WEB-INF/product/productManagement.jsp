<%@page import="com.peplcore.blogic.product.ProductDTO"%>
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
.insertBtn {
	background-color: #04AA6D;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
	margin-left: 800px;
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

.insertBtn1, .deleteBtn, .showBtn{
	background-color: #04AA6D;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
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
				<a href="#">ADMINISTRATOR</a>
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
						onclick="ToggleAccordion(this)">회원 관리</div>
					<div class="accordion-content">
						<!--display:none-->
						<p>
							<a href="#">회원 관리</a>
						</p>
					</div>
				</li>
				<!-- 상품 관리 -->
				<li>
					<div class="accordion-header" onclick="ToggleAccordion(this)">
						상품 관리
					</div> <!--display:none-->
					<div class="accordion-content">
						<p>
							<a href="productManagement.pc">상품 목록</a>
						</p>
					</div>
				</li>
				<!-- 게시글 관리 -->
				<li>
					<div class="accordion-header" onclick="ToggleAccordion(this)">
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
			<div class="maincontent">
				<div class="mainNav">
				
					<form action="insertProductView.pc" method="post">
						<ul>
							<li><h3>상품 관리 목록</h3></li>
							<li><input type="submit" name="insertProduct" class="insertBtn" value="상품등록"></input></li>
						</ul>
					</form>
					
				</div>
				<hr />
				<table>
					<tr>
						<th>상품 번호</th>
						<th>상품 분류</th>
						<th>상품 이름</th>
						<th>상품 수량</th>
						<th>상품 품절 여부</th>
						<th>상품 사이즈</th>
						<th>상품 설명</th>
						<th>상품 원가</th>
						<th>상품 판매가</th>
						<th colspan="3">관리</th>
					</tr>
					<c:forEach items="${productList}" var="product">
						<tr>
							<td>${product.getPseq()}</td>
							<td>${product.getPcategory()}</td>
							<td>${product.getPname()}</td>
							<td>${product.getPnum()}</td>
							<td>${product.getPoutStock()}</td>
							<td>${product.getPsize()}</td>
							<td>${product.getPdescription()}</td>
							<td>${product.getPcost()}</td>
							<td>${product.getPselling()}</td>
							
							<td><a href="updateProductView.pc?pseq=${product.getPseq()}">상품수정</a></td>
							<td><a href="deleteProduct.pc?pseq=${product.getPseq() }">상품삭제</a></td>
<!-- 							<td><input type="button" name="deleteProduct" class="deleteBtn" value="상품삭제" onclick="location.href='deleteProduct.pc'"></td> -->
							<td><a href="getOneProduct.pc?pseq=${product.getPseq()}">상품보기</a></td>
<!-- 							<td><input type="button" name="showProduct" class="showBtn" value="상품보기" onclick="location.href='getOneProduct.pc'"></td> -->
						</tr>
					</c:forEach>
				</table>
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
</body>
</html>