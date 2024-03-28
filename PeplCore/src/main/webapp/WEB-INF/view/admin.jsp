<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-1 mt-4 ms-3" href="index.jsp"><img
			src="./images/logo.png" width="150px" height="70px" alt="logo">
		</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li>
				<!-- 로그아웃 -->
				<button type="button" class="btn btn=primary text-white"
					onclick="location.href='logout.mc'">로그아웃</button>
			</li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!--   <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div> -->
						<a class="nav-link collapsed mt-5" href="#"
							data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
							aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 회원관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>

						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="memberInfo.mc">회원 목록</a>
							</nav>
						</div>
						<!-- //회원관리 -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 상품관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link" href="productManagement.pc">상품목록</a>
							</nav>
						</div>
						<!-- //상품관리 -->
						<!-- 게시글 관리 -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayout" aria-expanded="false"
							aria-controls="collapseLayout">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 게시글관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>

						<div class="collapse" id="collapseLayout"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="getAllNotice.bc">공지사항</a> <a
									class="nav-link" href="getAllFAQList.bc">자주묻는 질문</a>
							</nav>
						</div>
						<!-- //게시글 관리 -->
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<!-- 관리자 페이지 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">관리자 페이지</h1>
					<hr class="mb-5">
					<!-- 신규회원 -->
					<h2 class="mb-3">신규회원 목록</h2>
					<div class="card-body">
						<table id="datatablesSimple" class="text-center pt-3">
							<thead>
								<tr>
									<th>이름</th>
									<th>아이디</th>
									<th>전화번호</th>
									<th>가입일</th>
									<th>등급</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="v" items="${newMemberList}">
									<tr>
										<td class="mt-3">${v.getName()}</td>
										<td>${v.getId()}</td>
										<td>${v.getPhone()}</td>
										<td>${v.getDate()}</td>
										<td>${v.getGrade()}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- //신규회원 -->
					<!-- 신규 리뷰 삭제 예정-->
					<h2 class="mt-4 mb-2">신규 리뷰</h2>
					<div class="card-body">
						<table class="table border text-center" class="text-center pt-3">
							<tr>
								<th>리뷰 번호</th>
								<th>상품 사진</th>
								<th>상품명</th>
								<th>사용자 ID</th>
								<th>리뷰 제목</th>
								<th>리뷰 내용</th>
								<th>리뷰 작성 날짜</th>
								<th colspan="2">관리</th>
							</tr>
							<tr>
								<td>10</td>
								<td><img class="acc1" src="./images/acc.jpg" width="70px"
									height="70px"></td>
								<td>목걸이 1</td>
								<td>zelda17175</td>
								<td>예뻐요~</td>
								<td>원하던 스타일이에요</td>

								<td>2024.03.27</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>
							<tr>
								<td>9</td>
								<td><img class="acc1" src="./images/blue_shirts.jpg"
									width="70px" height="70px"></td>
								<td>하늘색 셔츠</td>
								<td>link0090</td>
								<td>작아요</td>
								<td>사이즈가 작음</td>

								<td>2024.03.17</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>
							<tr>
								<td>8</td>
								<td><img class="acc1" src="./images/cap.jpg" width="70px"
									height="70px"></td>
								<td>파랑색 모자</td>
								<td>Callie_S2</td>
								<td>멋있어요</td>
								<td>흔하지 않은 디자인이어서 좋아요~~</td>

								<td>2024.03.17</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>
							<tr>
								<td>7</td>
								<td><img class="acc1" src="./images/denim.jpg" width="70px"
									height="70px"></td>
								<td>청자켓</td>
								<td>Marie_S2</td>
								<td>따수버요</td>
								<td>ㅈㄱㄴ</td>

								<td>2024.03.10</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>
							<tr>
								<td>6</td>
								<td><img class="acc1" src="./images/glassess.jpg"
									width="70px" height="70px"></td>
								<td>안경</td>
								<td>kelsit7749</td>
								<td>잘보여요</td>
								<td>멀리까지 잘 보여요</td>

								<td>2024.03.08</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>
							<tr>
								<td>5</td>
								<td><img class="acc1" src="./images/hat2.jpg" width="70px"
									height="70px"></td>
								<td>비니</td>
								<td>maria_sM0009</td>
								<td>수버요</td>
								<td>근데 따가움요</td>

								<td>2024.03.07</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>
							<tr>
								<td>4</td>
								<td><img class="acc1" src="./images/leather.jpg"
									width="70px" height="70px"></td>
								<td>자켓</td>
								<td>mario_El3</td>
								<td>이뻐요</td>
								<td>관리하기 힘들어요</td>

								<td>2024.03.05</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>
							<tr>
								<td>3</td>
								<td><img class="acc1" src="./images/pants.jpg" width="70px"
									height="70px"></td>
								<td>청바지</td>
								<td>garaPikachu_0327</td>
								<td>굿</td>
								<td>다른 색상도 살게요 굿~</td>

								<td>2024.03.05</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>
							<tr>
								<td>2</td>
								<td><img class="acc1" src="./images/sand_shoes.jpg"
									width="70px" height="70px"></td>
								<td>베이지 신발</td>
								<td>mangmengmi_umi</td>
								<td>이뻐요</td>
								<td>폭신폭신하니 오래 신기 좋아요 굿~</td>

								<td>2024.03.01</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>
							<tr>
								<td>1</td>
								<td><img class="acc1" src="./images/shirts.jpg"
									width="70px" height="70px"></td>
								<td>흰 셔츠</td>
								<td>mario_El3</td>
								<td>이뻐요</td>
								<td>예쁘네여</td>

								<td>2024.03.01</td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>
								<td><a href="#" class="btn btn-success">댓글</a></td>
							</tr>

						</table>
					</div>
					<!-- //신규 리뷰 -->
				</div>
			</main>
			<!-- //관리자 페이지 -->
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
