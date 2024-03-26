<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/reset.css" rel="stylesheet" />
<link rel="stylesheet" href="./css/index.css" />
<link rel="stylesheet" href="./css/memberEdit.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

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
				<h3>회원정보 수정</h3>
				<hr>
				<div class="editMember">
					<form action="memberEdit.mc">
						<table class="editTable">
							<tr>
								<td>이름</td>
								<td><input type="text" name="name"
									value="${member.getName() }" readonly></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="id" value="${member.getId() }"
									readonly></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" name="phone"
									value="${member.getPhone() }" readonly></td>
							</tr>
							<tr>
								<td>가입일</td>
								<td><input type="text" name="date"
									value="${member.getDate() }" readonly></td>
							</tr>
							<tr>
								<td>등급</td>
								<td><select name="grade">
										<option value="${member.getGrade() }">${member.getGrade() }</option>
										<option value="브론즈">브론즈</option>
										<option value="실버">실버</option>
										<option value="골드">골드</option>
								</select></td>
							</tr>
							<tr>
								<td>권한</td>
								<td><select name="role">
										<option value="${member.getRole() }">${member.getRole() }</option>
										<option value="일반회원">일반회원</option>
										<option value="블랙회원">블랙회원</option>
										<option value="관리자">관리자</option>
								</select></td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="submit">수정</button>
									<button type="button" onclick="location.href='memberInfo.mc'">취소</button>
								</td>
							</tr>
						</table>
					</form>

				</div>
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
