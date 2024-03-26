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
<title>Static Navigation - SB Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body>
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
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse">
									상품목록 </a>

								<!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a> -->
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
								<a class="nav-link" href="memberInfo.mc">공지사항</a> <a
									class="nav-link" href="memberInfo.mc">자주묻는 질문</a> <a
									class="nav-link" href="memberInfo.mc">리뷰</a> <a
									class="nav-link" href="memberInfo.mc">질문 게시판</a>
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
		<!-- 본문 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">회원관리 페이지</h1>

					<!-- 신규회원, 블랙회원, 현재회원 -->
					<div class="d-flex justify-content-between me-3  memberc">
						<div class="card mt-5 ms-5 col-lg-3 text-center ">
							<div class="card-body border-bottom  ">신규회원</div>
							<p class="text-primary pt-2">${newUserCount}명</p>
						</div>


						<div class="card mt-5 ms-5 col-lg-3 text-center">
							<div class="card-body border-bottom ">블랙회원</div>
							<p class="text-primary pt-2">${blackUserCount}명</p>
						</div>


						<div class="card mt-5 ms-5 col-lg-3 text-center">
							<div class="card-body border-bottom  ">현재회원</div>
							<p class="text-primary pt-2">${allUserCount}명</p>
						</div>
					</div>
					<!-- //신규회원, 블랙회원, 현재회원 -->
					<!-- 회원 리스트 -->
					<h3 class="mt-5">회원 목록</h3>
					<hr>
					<div class="container-fluid px-4">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> DataTable Example
							</div>
							<div class="card-body">
								<table id="datatablesSimple" class="text-center pt-3">
									<thead>
										<tr>
											<th>이름</th>
											<th>아이디</th>
											<th>전화번호</th>
											<th>가입일</th>
											<th>등급</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="v" items="${memberList}">
											<tr >
												<td class="mt-3">${v.getName()}</td>
												<td>${v.getId()}</td>
												<td>${v.getPhone()}</td>
												<td>${v.getDate()}</td>
												<td>${v.getGrade()}</td>

												<td>
													<div class="updateDelete">
														<button type="button" class="btn btn-primary"
															onclick="location.href='memberEditView.mc?id=${v.getId()}'">수정</button>
														<button type="button" class="btn btn-danger ms-3"
															onclick="location.href='memberDelete.mc?id=${v.getId()}'">삭제</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //회원 리스트 -->
				</div>
			</main>
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
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
