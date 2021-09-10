<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>MAIN</title>
  <link rel="stylesheet" type="text/css" href="/css/main.css?version=1.1">
</head>
<body>
<div class="hold">
  <div class="header">
    <div class="container">
      <jsp:include page="board/header.jsp"></jsp:include>
    </div>
  </div>
</div>
<div class="section">
  <div class="slider">
    <div class="container slidercontent">
      <h1 class="hero">용재의 홈페이지</h1>
      <h2 class="hero">Spring FrameWork 를 사용한 홈페이지 입니다.</h2>
      <div class="call"><span>GitHub</span></div>
    </div>
  </div>
</div>
<div class="section">
  <div class="container">
    <div class="col four">
      <h1 class="icon">[]</h1>
      <h1 class="service">Wow</h1>
      <p>Wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col four">
      <h1 class="icon">[]</h1>
      <h1 class="service">Wow</h1>
      <p>Wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="responsivegroup"></div>
    <div class="col four">
      <h1 class="icon">[]</h1>
      <h1 class="service">Wow</h1>
      <p>Wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col four">
      <h1 class="icon">[]</h1>
      <h1 class="service">Wow</h1>
      <p>Wow wow wow wow wow wow wow</p>
    </div>
    <div class="group"></div>
  </div>
</div>
<div class="section bg">
  <div class="container">
    <h1>Wow wow</h1>
    <h2>Wow wow wow!</h2>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow</p>
    </div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow wow</p>
    </div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow wow</p>
    </div>
    <div class="group margin"></div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow</p>
    </div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow wow</p>
    </div>
    <div class="col three bg nopad pointer">
      <div class="imgholder"></div>
      <h1 class="feature">Wow</h1>
      <p>Wow wow wow</p>
    </div>
    <div class="group"></div>
  </div>
</div>
<div class="section">
  <div class="container">
    <h1 class="reset">Terrible.</h1>
  </div>
</div>
<div class="section">
  <div class="footer">
    <div class="container white">
      <div class="col four left">
        <h1>What?</h1>
        <p>So that's it. This started out as 20 minutes of making fun of modern web dev. Then it turned into a few hours of it.</p>
        <p>I hope you've enjoyed looking at every modern website ever.</p>
        <p>I don't actually hate this style as long as the content is meaningful. In fact, I think this type of design is pretty cool and effective.</p>
      </div>
      <div class="col four left">
        <h1>How?</h1>
        <p>CSS3 and HTML. JS for header shrinking; optional. Site works perfectly with JS disabled (another gripe of mine with modern web dev).</p>
        <p>Only external libraries are GFonts.</p>
        <p>Moderately responsive, should work on anything modern.</p>
      </div>
      <div class="col four left">
        <h1>Why?</h1>
        <p>Many popular HTML themes have thousands of lines of HTML, thousands of lines of CSS and several JS plugins on every page amounting to tens of thousands of lines of JavaScript.</p>
        <p>I fail to see a valid reason for this, particularly the horrendous line counts that are usually due to unused features or badly designed code.</p>
      </div>
      <div class="col four left">
        <h1>Who?</h1>
        <p>I'm Andrew.</p>
        <p>You can get in touch with me through <a href="http://atunnecliffe.com">http://atunnecliffe.com</a> or <a href="mailto:andrew@atunnecliffe.com">emailing me</a>.</p>
      </div>
      <div class="group"></div>
    </div>
  </div>
</div>
</body>
</html>
<%--<c:if test="${empty member}">--%>
<%--<section class="et-hero-tabs">--%>
<%--  <h1>용재의 홈페이지</h1>--%>
<%--  <h3>아래의 탭을 클릭하여 서비스를 이용하세요.</h3>--%>
<%--  <div class="et-hero-tabs-container">--%>
<%--    <a class="et-hero-tab" href="/member/joinForm">JOIN</a>--%>
<%--    <a class="et-hero-tab" href="/member/loginForm">LOGIN</a>--%>
<%--    <span class="et-hero-tab-slider"></span>--%>
<%--  </div>--%>
<%--</section>--%>
<%--</c:if>--%>

<%--<c:if test="${!empty member}">--%>
<%--<section class="et-hero-tabs">--%>
<%--  <h1>${member.memId}님 환영합니다.</h1>--%>
<%--  <h3>현재 로그인 시간은 ${serverTime} 입니다.</h3>--%>
<%--  <div class="et-hero-tabs-container">--%>
<%--    <a class="et-hero-tab" href="/member/modifyForm">회원정보</a>--%>
<%--    <a class="et-hero-tab" href="/member/logout">로그아웃</a>--%>
<%--    <a class="et-hero-tab" href="/member/removeForm">회원탈퇴</a>--%>
<%--    <a class="et-hero-tab" href="/member/board/listPage">게시판</a>--%>
<%--    <a class="et-hero-tab" href="/member/board/writeForm">글쓰기</a>--%>
<%--    <span class="et-hero-tab-slider"></span>--%>
<%--  </div>--%>
<%--</section>--%>
<%--</c:if>--%>
