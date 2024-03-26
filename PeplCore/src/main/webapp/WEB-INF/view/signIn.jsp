<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Login - SB Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
	<%
	//사용자 컴퓨터의 쿠키 저장소로 부터 쿠키 값을 읽어 드림, 몇개인지 모르기에 배열을 이용하여 쿠키값을 저장
	Cookie[] cookies = request.getCookies();
	String id = "";

	//쿠키값이 없을 수도 있기에 null처리를 해줌
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
		id = cookie.getValue();
		break;//원하는 데이터를 찾았기에 반복문을 빠져 나옴
			} //end of if-in
		} //end of for-each
	} //end of if
	%>
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
								</div>
								<div class="card-body">
									<form action="signIn.mc" method="post">
										<!-- 아이디 입력 -->
										<div class="form-floating mb-3">
											<input class="form-control" id="id" type="text" name="id"
												placeholder="name@example.com" autofocus="autofocus" value="<%=id%>"/> <label
												for="inputEmail">아이디입력</label>
										</div>
										<!-- 비밀번호 입력 -->
										<div class="form-floating mb-3">
											<input class="form-control" id="password" name="password"
												type="password" placeholder="Password" /> <label
												for="inputPassword">비밀번호입력</label>
										</div>
										<!-- 로그인 실패시 띄울 문구 -->
										<c:if test="${not empty signInCheck}">
											<div class="text-danger">${signInCheck }</div>
										</c:if>
										<!-- 아이디 저장 -->
										<div class="form-check mb-3">
											<input class="form-check-input" id="inputRememberPassword"
												type="checkbox" name="saveId" id="saveId" /> <label
												class="form-check-label" for="inputRememberPassword">아이디
												저장</label>
										</div>
										<!-- 아이디찾기/ 로그인 / 회원가입 -->
										<div class="d-flex align-items-center  mt-4 mb-0">
											<a class="small me-5" href="password.html">아이디 찾기</a> <input
												type="submit" value="로그인" class="btn btn-primary  ms-5">
										</div>
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="signUpView.mc">계정이없으신가요? 회원가입 하기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
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
</body>
</html>
