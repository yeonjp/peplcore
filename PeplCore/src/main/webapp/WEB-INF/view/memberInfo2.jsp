<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ADMINISTRATOR</title>
<link href="./css/reset.css" rel="stylesheet" />
<link rel="stylesheet" href="./css/index.css" />
<link rel="stylesheet" href="./css/memberInfo.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src="./js/accordion.js"></script>
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
			<img class="mainlogo" src="./images/logo.png"
				alt="This is PeplCore logo" />
			<!--topNav-->
			<div class="topNav">
				<ul>
					<li><a href="reset.mc"> <i class="fa-solid fa-store fa-lg"></i>&nbsp;&nbsp;
					</a></li>
					<li><a href="logout.mc"><i
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
							<a href="memberInfo.mc">회원 관리</a>
						</p>
					</div>
				</li>
				<!-- 상품 관리 -->
				<li>
					<div class="accordion-header" onclick="ToggleAccordion(this)">
						상품 관리</div> <!--display:none-->
					<div class="accordion-content">
						<p>
							<a href="./productManagement.html">상품 목록</a>
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
			<!--maincontent-->
			<div class="maincontent">
				<h3>회원 수</h3>
				<div class="memberCount">
					<div class="members">
						<div class="memberSituation">신규회원</div>
						<div class="count">${newUserCount}</div>
					</div>
					<div class="members">
						<div class="memberSituation">블랙회원</div>
						<div class="count">${blackUserCount}</div>
					</div>
					<div class="members">
						<div class="memberSituation">현재회원</div>
						<div class="count">${allUserCount}</div>
					</div>
				</div>

				<h3>회원 목록</h3>
				<hr class="memberInfoHr" />

				<table>
					<tr>
						<th>이름</th>
						<th>ID</th>
						<th>전화번호</th>
						<th>가입일</th>
						<th>등급</th>
						<th>관리</th>
					</tr>
					<c:set var="currentDate" value="<%=new java.util.Date()%>" />
					<c:forEach var="v" items="${memberList}">
						<tr>
							<td>${v.getName()}</td>
							<td>${v.getId()}</td>
							<td>${v.getPhone()}</td>
							<td>${v.getDate()}</td>
							<td>${v.getGrade()}</td>

							<td>
								<div class="updateDelete">
									<a href="memberEditView.mc?id=${v.getId()}">수정</a>
								</div>
								<div class="updateDelete">
									<a href="memberDelete.mc?id=${v.getId()}">삭제</a>
								</div>
							</td>
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


</body>
</html>
