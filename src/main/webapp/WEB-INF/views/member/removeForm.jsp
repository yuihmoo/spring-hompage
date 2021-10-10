<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 탈퇴</title>
	<link rel="stylesheet" type="text/css" href="/css/removeForm.css?version=1.0.0">
</head>
<jsp:include page="board/header.jsp"></jsp:include>
<body>
<h1>회원 탈퇴</h1>
<form:form action="/member/remove" method="post" modelAttribute="member">
	<div class="remove-check">
		<h3>아이디 : ${member.memId}</h3>
		<h4>비밀번호 : <form:password path="memPw"/></h4>
		<input type="submit" value="탈퇴"/>
	</div>
</form:form>
</body>
</html>