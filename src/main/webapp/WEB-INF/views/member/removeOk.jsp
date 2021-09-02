<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>회원 탈퇴 완료</title>
</head>
<body>
	<h1> 회원 탈퇴 완료 </h1>
	
	ID : ${member.memId}<br />
	
	<P>  회원님의 탈퇴 시각은 ${serverTime} 입니다. </P>
	
	<a href="/"> MAIN </a>
</body>
</html>