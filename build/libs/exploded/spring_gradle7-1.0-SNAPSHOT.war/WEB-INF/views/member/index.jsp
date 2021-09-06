<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>MAIN</title>
<%--  <link rel="stylesheet" type="text/css" href="/css/main.css?version=1.1">--%>
  <style>
    body {
      font-family: "Century Gothic", 'Lato', sans-serif;
    }

    a {
      text-decoration: none;
    }

    .et-hero-tabs {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 98vh;
      position: relative;
      background-image: url("/images/alfons.jpg");
      background-size: cover;
      background-position-y: -250px;
      text-align: center;
      padding: 0 2em;
    }
    h1 {
      font-size: 3rem;
      /*color: #e2e2e5;*/
    }
    h3 {
      font-size: 1rem;
      letter-spacing: 0.3rem;
      opacity: 0.6;
      font-weight: bold;
      /*color: #c2c2c5;*/
    }

    .et-hero-tabs-container {
      display: flex;
      flex-direction: row;
      position: absolute;
      bottom: 0;
      width: 100%;
      height: 70px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      background: #fff;
      z-index: 10;
    }

    .et-hero-tab {
      display: flex;
      justify-content: center;
      align-items: center;
      flex: 1;
      color: #000;
      letter-spacing: 0.1rem;
      transition: all 0.5s ease;
      font-size: 0.8rem;
    }

    .et-hero-tab-slider {
      position: absolute;
      bottom: 0;
      width: 0;
      height: 6px;
      background: #66B1F1;
      transition: left 0.3s ease;
    }

    @media (min-width: 800px) {
      .et-hero-tabs{
      }
      h1 {
        font-size: 3rem;
      }
      h3 {
        font-size: 1rem;
      }
    }
    .et-hero-tab {
      font-size: 1rem;
      font-family: "Century Gothic", 'Lato', sans-serif;
      font-weight: bold;
    }
  </style>
</head>
<body>
<c:if test="${empty member}">
<section class="et-hero-tabs">
  <h1>용재의 홈페이지</h1>
  <h3>아래의 탭을 클릭하여 서비스를 이용하세요.</h3>
  <div class="et-hero-tabs-container">
    <a class="et-hero-tab" href="/member/joinForm">JOIN</a>
    <a class="et-hero-tab" href="/member/loginForm">LOGIN</a>
    <span class="et-hero-tab-slider"></span>
  </div>
</section>
</c:if>

<c:if test="${!empty member}">
<section class="et-hero-tabs">
  <h1>${member.memId}님 환영합니다.</h1>
  <h3>현재 로그인 시간은 ${serverTime} 입니다.</h3>
  <div class="et-hero-tabs-container">
    <a class="et-hero-tab" href="/member/modifyForm">회원정보</a>
    <a class="et-hero-tab" href="/member/logout">로그아웃</a>
    <a class="et-hero-tab" href="/member/removeForm">회원탈퇴</a>
    <a class="et-hero-tab" href="/member/board/listPage">게시판</a>
    <a class="et-hero-tab" href="/member/board/writeForm">글쓰기</a>
    <span class="et-hero-tab-slider"></span>
  </div>
</section>
</c:if>
</body>
</html>