<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>회원정보 수정 완료</title>
</head>
<body>
	<h1> 회원정보 수정 완료 </h1>
	
	<%--
	<h3> Before Modify </h3>
	${memBef}
	ID : ${memBef.memId} <br />
	PW : ${memBef.memPw} <br />
	Mail : ${memBef.memMail} <br />
	--%>
	<h3> 회원정보 변경 후 </h3>
	아이디 : ${memAft.memId} <br />
	비밀번호 : ${memAft.memPw} <br />
	메일 : ${memAft.memMail} <br />
	
	<P>  회원님의 정보가 변경된 시각은 ${serverTime} 입니다. </P>
	
	<a href="${cp}/"> MAIN </a>
</body>
</html>
