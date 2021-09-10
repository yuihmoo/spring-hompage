<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yyj
  Date: 2021-09-09
  Time: 오전 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="hold">
    <div class="header">
        <div class="container">
            <ul class="nav">
                <c:if test="${empty member}">
                    <li><a href="/member/joinForm">JOIN</a></li>
                    <li><a href="/member/loginForm">LOGIN</a></li>
                </c:if>
                <c:if test="${!empty member}">
                    <li><a href="/">홈</a></li>
                    <li><a href="/member/modifyForm">회원정보</a></li>
                    <li><a href="/member/logout">로그아웃</a></li>
                    <li><a href="/member/removeForm">회원탈퇴</a></li>
                    <li><a href="/member/board/listPage">게시판</a></li>
                    <li><a href="/member/board/writeForm">글쓰기</a></li>
                    <li style="font-weight: bold;">ID : ${member.memId}</li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
