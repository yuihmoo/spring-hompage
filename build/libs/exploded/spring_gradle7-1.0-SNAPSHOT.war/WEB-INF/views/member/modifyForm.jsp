<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원정보 수정</title>
	<link rel="stylesheet" type="text/css" href="/css/modifyForm.css?version=1.0.7">
</head>
<jsp:include page="board/header.jsp"></jsp:include>
<body>
<h1>회원정보 수정</h1>
<form:form action="/member/modify" method="post" modelAttribute="member">
	<form:hidden path="memId" value="${member.memId}"/>
	<div class="user-info">
		<h3>아이디 : ${member.memId}</h3>
		<h4>새 비밀번호 : <form:password path="memPw"/></h4>
		<h4>이메일 : <form:input path="memMail" value="${member.memMail}"/></h4>
		<input type="submit" value="수정"/>
	</div>
</form:form>
</body>
</html>