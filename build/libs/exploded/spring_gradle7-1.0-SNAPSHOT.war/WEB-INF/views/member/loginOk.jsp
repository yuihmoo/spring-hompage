<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>환영합니다!</title>
</head>
<body>
	<h1> 로그인 완료 </h1>
	
	아이디 : ${member.memId}님 반갑습니다.<br />
	정상적으로 로그인이 되었습니다.
	
	<P>  현재 로그인 시각은 ${serverTime} 입니다. </P>
	
	<a href="/"> MAIN </a>
</body>
</html>