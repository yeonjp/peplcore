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
<title>Register - SB Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./js/address.js"></script>
<script type="text/javascript" src="./js/idPassCheck.js"></script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">회원 가입</h3>
								</div>
								<div class="card-body">
									<!-- form 시작 -->
									<form action="insertMember.mc" name="member" method="post">
										<!-- id입력 중복체크 -->
										<div class="row mb-3">
											<div class="col-md-9">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="id" name="id" type="text"
														placeholder="Enter your first name" /> <label
														for="inputFirstName">id입력</label>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-floating">
													<button type="button" class="btn btn-primary col-md-7 mt-2"
														id="overlapCheck" onclick="registerFunction()">중복체크</button>
												</div>
											</div>
											<span id="idText" class="ms-3"></span>
										</div>
										<!-- //id입력 중복체크 -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="pass1" name="pass1"
														type="password" placeholder="Create a password" /> <label
														for="inputPassword">비밀번호</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="pass2" type="password"
														name="pass2" placeholder="Confirm password"
														onkeyup="passwordCheckFunction()" /> <label
														for="inputPasswordConfirm">비밀번호 확인</label>
												</div>
											</div>
											<span id="passwordText" class="text-center mt-1"></span>
										</div>
										<!-- //비밀번호 비밀번호 확인 -->
										<div class="form-floating mb-3">
											<input class="form-control" id="name" name="name" type="text"
												placeholder="name@example.com" /> <label for="inputEmail">이름</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="email" name="email"
												type="email" placeholder="name@example.com" /> <label
												for="inputEmail">이메일</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="ssn" name="ssn" type="text"
												placeholder="name@example.com" /> <label for="inputEmail">주민등록
												번호</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="phone" name="phone" type="tel"
												placeholder="name@example.com" /> <label for="inputEmail">핸드폰
												번호</label>
										</div>
										<div class="form-floating mb-3">
											<button type="button" class="btn btn-primary mb-1"
												id="zipbtn">우편번호</button>
											<input class="form-control" id="post" name="zipcode"
												type="text" placeholder="name@example.com" />
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="address1" name="address1"
												type="text" placeholder="name@example.com" /> <label
												for="inputEmail">주소</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="address2" name="address2"
												type="text" placeholder="name@example.com" /> <label
												for="inputEmail">상세주소</label>
										</div>
										<div class="form-floating d-flex mb-3">
											<div class="border news col-md-2 text-center me-3 text-white">통신사</div>
											<select name="newsAgency" class="col-md-2 text-center">
												<option>LGU+</option>
												<option>SKT</option>
												<option>KT</option>
												<option>알뜰폰</option>
											</select>
										</div>
										<div class="form-floating d-flex mb-3">
											<div class="border news col-md-2 text-center me-3 text-white">성별</div>
											<select name="gender" class="col-md-2 text-center">
												<option>남자</option>
												<option>여자</option>
											</select>
										</div>
										<div class="form-floating d-flex mb-3">
											<div class="border news col-md-2 text-center me-3 text-white">국적</div>
											<select name="countrySelect" class="col-md-2 text-center">
												<option>내국인</option>
												<option>외국인</option>
											</select>
										</div>
										<!--  가입완료 -->
										<div class="mt-4 mb-0">
											<div class="d-grid">
												<input type="submit" class="btn btn-primary btn-block"
													value="가입완료">
											</div>
										</div>
										<!-- 가입 완료 -->
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="signInView.mc">회원이신가요? 로그인하러 가기</a>
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
