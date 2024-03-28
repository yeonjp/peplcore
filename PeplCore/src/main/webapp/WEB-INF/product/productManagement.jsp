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
							<nav class="sb-sidenav-menu-nested nav">
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
									class="nav-link" href="memberInfo.mc">자주묻는 질문</a> 
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
					<h1 class="mt-4">상품관리 페이지</h1>


					<!-- 상픔 리스트 -->
					<div class="justify-content-between d-flex">
					<h3 class="mt-5">상품 목록</h3>
					<button type="button" class="btn btn-primary mt-5 me-5" onclick="location.href='insertProductView.pc'">상품등록</button>
					</div>
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
											<th>상품 번호</th>
											<th>상품 분류</th>
											<th>상품 이름</th>
											<th>상품 수량</th>
											<th>상품 품절 여부</th>
											<th>상품 사이즈</th>
											<th>상품 설명</th>
											<th>상품 원가</th>
											<th>상품 판매가</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
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

												<td>
													<div class="updateDelete">
														<button type="button" class="btn btn-primary"
															onclick="location.href='updateProductView.pc?pseq=${product.getPseq()}'">수정</button>
														<button type="button" class="btn btn-danger ms-3"
															onclick="location.href='deleteProduct.pc?pseq=${product.getPseq() }'">삭제</button>
														<button type="button" class="btn btn-success ms-3"
															onclick="location.href='getOneProduct.pc?pseq=${product.getPseq()}'">보기</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //상품 리스트 -->
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
