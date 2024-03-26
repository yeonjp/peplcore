<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty member}">
		<a href="signInView.mc">로그인</a>
		<a href="signUpView.mc">회원가입</a>
	</c:if>
	<c:if test="${not empty member}">
		<a href="logout.mc">로그아웃</a>
	</c:if>
	<c:if test="${not empty member and role eq '관리자'}">
		<a href="admin.mc">관리자 페이지</a>
	</c:if>
</body>
</html>