<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	
	<h1>회원 탈퇴</h1>
	
	<form:form action="/member/remove" method="post" modelAttribute="member">
		<input type="hidden" name="memId" value="${member.memId}">
		<table>
			<tr>
				<td>아이디</td>
				<td>${member.memId}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><form:password path="memPw" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Remove" ></td>
			</tr>
		</table>
	</form:form>
	
	<a href="/">MAIN</a>
</body>
</html>