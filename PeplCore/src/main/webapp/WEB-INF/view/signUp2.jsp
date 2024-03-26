<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/carousel.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./js/address.js"></script>
<script type="text/javascript" src="./js/idPassCheck.js"></script>

</head>
<body>
	<div class="container marketing" id="marketing2">
		<!-- Three columns of text below the carousel -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h2></h2>
				<div class="table-responsive">
					<h2 class="text-center">회원가입</h2>
					<form action="insertMember.mc" method="post" name="member">
						<table class="table table-boardered">
							<tr>
								<th>아이디</th>
								<td style="display: flex"><input type="text"
									class="form-control col-md-6" name="id" id="id" placeholder="id를 넣으세요">
									<button type="button" class="btn" id="overlapCheck"
										onclick="registerFunction()">중복체크</button> <br> <span
									id="idText"></span></td>
							</tr>
							<tr>
								<th>패스워드</th>
								<td><input type="password" class="form-control"
									name="pass1" id="pass1" placeholder="비밀번호 입력"></td>
							</tr>

							<tr>
								<th>패스워드확인</th>
								<td><input type="password" class="form-control"
									name="pass2" id="pass2" onkeyup="passwordCheckFunction()"><br> <span id="passwordText"></span></td>
							</tr>

							<tr>
								<th>이름</th>
								<td><input type="text" class="form-control" name="name"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" class="form-control" name="email"></td>
							</tr>

							<tr>
								<th>주민등록 번호</th>
								<td><input type="text" class="form-control" name="ssn"></td>
							</tr>
							<tr>
								<th class="tTitle"><label for="phone">휴대폰번호</label></th>
								<td class="tCont"><input type="text" class="input1 iphone"
									name="phone" id="phone" required="required"></td>
							</tr>
							<tr>
								<th><label>우편번호</label></th>
								<td>
									<button type="button" id="zipbtn">우편번호</button> <input
									type="text" class="form-control" name="zipcode" id="post">
								</td>
							</tr>


							<tr>
								<th><label>주소</label></th>
								<td><input type="text" class="form-control" name="address1"
									id="address1" readonly="readonly"></td>
							</tr>
							<tr>
								<th><label>상세주소</label></th>
								<td><input type="text" class="form-control" name="address2"
									id="address2"></td>
							</tr>

							<tr>
								<th>통신사</th>
								<td><select name="newsAgency">
										<option>LGU+</option>
										<option>SKT</option>
										<option>KT</option>
										<option>알뜰폰</option>
								</select></td>
							</tr>
							<tr>
								<th>성별</th>
								<td><input type="radio" class="form-control" name="gender"
									value="남">남 <input type="radio" class="form-control"
									name="gender" value="여">여</td>
							</tr>
							<tr>
								<th>국적</th>
								<td><input type="radio" class="form-control"
									name="countrySelect" value="외국인">외국인 <input
									type="radio" class="form-control" name="countrySelect"
									value="내국인">내국인</td>
							</tr>


							<tr>
								<td colspan="2" class="text-center"><input type="submit"
									class="btn btn-primary" value="회원가입"> <input
									type="button" class="btn btn-danger"
									onclick="location.href='reset.mc'" value="취소"></td>
							</tr>


						</table>
					</form>

				</div>
			</div>

		</div>
	</div>
	<%
	String messageContent = null;
	String messageType = null;

	if (session.getAttribute("messageContent") != null) {
		messageContent = (String) session.getAttribute("messageContent");
	}
	if (session.getAttribute("messageType") != null) {
		messageType = (String) session.getAttribute("messageType");

	}

	if (messageContent != null) {
	%>

	<h3><%=messageType%></h3>
	<h3><%=messageContent%></h3>

	<%
	session.removeAttribute("messageType");
	session.removeAttribute("messageContent");
	}
	%>
</body>
</html>