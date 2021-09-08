<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>MAIN</title>
<%--  <link rel="stylesheet" type="text/css" href="/css/main.css?version=1.1">--%>
  <style>

    html,
    body {
      margin: 0;
      padding: 0;
    }

    .section {
      width: 100%;
    }

    .container {
      position: relative;
      width: 1170px;
      margin: 0 auto;
      color: #444;
      font-size: 14px;
      font-weight: 300;
      font-family: Roboto, 'Open Sans', Arial, sans-serif;
      overflow: hidden;
    }

    .section .container {
      padding: 30px 0 50px 0;
    }

    .section.bg {
      background: #f7f7f7;
    }
    /*
      Header
    */

    .hold {
      height: 80px;
    }

    .header {
      line-height: 80px;
      width: 100%;
      transition: line-height 0.2s linear, box-shadow 0.2s linear;
      position: fixed;
      top: 0;
      left: 0;
      z-index: 100;
      background: rgba(245, 245, 245, 0.97);
    }

    .header.small {
      line-height: 50px;
      box-shadow: 0px 1px 3px 0px rgba(50, 50, 50, 0.8);
    }

    .header.small > .container > #logo {
      height: 40px;
    }

    #logo {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background: red;
      float: left;
      height: 40px;
      width: 170px;
      margin-left: 5px;
    }

    ul.nav {
      float: right;
      list-style: none;
      margin: 0;
      padding: 0;
    }

    ul.nav li {
      float: left;
      position: relative;
    }

    ul.nav li a {
      transition: color 0.2s linear;
      font-size: 18px;
    }

    ul.nav li:hover a {
      color: red;
    }

    ul.nav li a {
      padding: 21px;
      color: initial;
      text-decoration: initial;
    }
    /*
      Slider
    */

    .section .slider,
    .section .footer {
      background: #333;
    }

    .slidercontent {
      text-align: center;
    }

    .hero {
      font-family: 'Roboto Slab', sans-serif;
      color: white;
      font-weight: normal;
      letter-spacing: 1px;
    }

    h1.hero {
      font-size: 54px;
    }

    h2.hero {
      font-size: 30px;
      margin-bottom: 60px;
    }

    h1.hero:after {
      content: "";
      width: 300px;
      position: relative;
      border-bottom: 1px solid #aaa;
      text-align: center;
      margin: auto;
      margin-top: 15px;
    }

    .call {
      color: white;
      display: block;
      margin-bottom: 20px;
    }

    .call span {
      display: inline;
      border: 1px solid white;
      padding: 8px 13px;
      font-size: 20px;
      transition: background 0.15s linear;
    }

    .call span:hover {
      background: rgba(255, 255, 255, 0.1);
      cursor: pointer;
    }
    /*
      Columns
    */

    .col {
      float: left;
      padding: 0;
      margin: 0;
      position: relative;
    }

    .col.four {
      width: 23%;
      margin: 0 1%;
    }

    .col.three {
      width: 31.3%;
      margin: 0 1%;
    }

    .col.two {
      width: 40%;
      margin: 0 2.5%;
      padding: 0 2.5%;
    }

    .col.extrapad {
      padding-top: 20px;
      padding-bottom: 20px;
    }

    .col .service,
    .col .feature {
      font-size: 21px;
      font-weight: 300;
      font-family: 'Roboto Slab', sans-serif;
    }

    .col .service:after {
      content: "";
      width: 50px;
      position: relative;
      border-bottom: 1px solid #eee;
      display: block;
      text-align: center;
      margin: auto;
      margin-top: 15px;
    }

    .col .feature {
      font-size: 19px;
    }

    .col h1.side,
    .col p.side,
    .col span.side:first-of-type {
      margin-left: 50px;
      text-align: left;
    }

    .col .icon {
      border-radius: 50%;
      height: 85px;
      width: 85px;
      line-height: 85px;
      text-align: center;
      margin: 0 auto;
      transition: background 0.25s linear, color 0.25s linear;
    }

    .col .icon.side {
      position: absolute;
      padding: 0;
      margin: 0;
      top: -15px;
      height: 50px;
      width: 50px;
    }

    .col:hover > .icon {
      background: #F44336;
      color: white;
    }

    .col:hover > .icon.side {
      background: initial;
      color: initial;
    }

    .responsivegroup {
      display: none;
    }
    /*
      Column specifics
    */

    .col p,
    .col h1 {
      padding: 0 1%;
      text-align: center;
    }

    .group.margin {
      margin-bottom: 20px;
    }

    .col .imgholder {
      height: 300px;
      width: 100%;
      background: #333;
      transition: background 0.3s linear;
    }

    .col.bg {
      background: #FFF;
    }

    .col.pointer {
      cursor: pointer;
    }

    .col.bg:hover .imgholder {
      background: #555;
    }

    .col span.feature {
      font-size: 20px;
    }
    /*
      Text
    */

    .container > h1:not(.hero) {
      margin-bottom: 30px;
      text-align: center;
    }

    .container > h1:after {
      content: "";
      width: 30px;
      position: relative;
      border-bottom: 1px solid #aaa;
      display: block;
      text-align: center;
      margin: auto;
      margin-top: 15px;
    }

    h2 {
      font-family: 'Roboto Slab', sans-serif;
      text-align: center;
      font-weight: 400;
      font-size: 18px;
    }

    .left,
    .left > h1,
    .left > p {
      text-align: left;
    }

    .reset {
      text-align: left !important;
    }

    .reset:after {
      display: none !important;
    }
    /*
      Slider with Content
    */

    .white h1,
    .white h2,
    .white p,
    .white div,
    .white a {
      color: #fff;
    }
    /*
      Responsive
    */

    .group:after {
      content: "";
      display: table;
      clear: both;
    }

    @media all and (max-width: 768px) {
      .container {
        width: 95%;
      }
      .col.four {
        width: 48%;
        margin: 1%;
      }
      .col.three {
        display: block;
        width: 95%;
        padding: 0;
        margin: 0 auto;
        float: none;
      }
      .header {
        height: auto;
        background: #eee;
      }
      #logo {
        position: initial;
        float: none;
        display: block;
        transform: none;
        margin: 10px auto 0 auto;
      }
      ul.nav {
        float: none;
        display: block;
        text-align: center;
        margin: 0 auto;
      }
      ul.nav li {
        float: initial;
        display: inline-block;
      }
      .responsivegroup {
        display: block;
      }
      .responsivegroup:after {
        content: "";
        display: table;
        clear: both;
      }
    }

    @media all and (min-width: 768px) {
      .container {
        width: 750px;
      }
    }

    @media all and (min-width: 992px) {
      .container {
        width: 970px;
      }
    }

    @media all and (min-width: 1200px) {
      .container {
        width: 1170px;
      }
    }

    @media all and (max-width:450px) {
      .col, .col.four, .col.three, .col.two {
        display: block;
        width: 95%;
        padding: 0;
        margin: 0 auto;
        float: none;
      }
      .col.extrapad {
        padding: 1%;
        margin-bottom: 10px;
      }
      .group {
        display: none;
      }
    }
    }
  </style>
</head>
<body>
<div class="hold">
  <div class="header">
    <div class="container">
      <div id="logo">
      </div>
      <ul class="nav">
        <li><a href="#">Wow</a></li>
        <li><a href="#">Wow</a></li>
        <li><a href="#">Wow</a></li>
        <li><a href="#">Wow</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="section">
  <div class="slider">
    <div class="container slidercontent">
      <h1 class="hero">Wow</h1>
      <h2 class="hero">Wow.Wow.Wow</h2>
      <div class="call"><span>Wow</span></div>
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
    <h1>Wow? Wow wow wow wow!</h1>
    <h2>Wow</h2>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="group margin"></div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow</p>
    </div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col three">
      <h1 class="icon side">[]</h1>
      <h1 class="feature side">Wow</h1>
      <p class="side">Wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="group margin"></div>
  </div>
</div>
<div class="section bg">
  <div class="container">
    <h1>Wow</h1>
    <h2>Wow wow wow wow</h2>
    <div class="col two bg margin extrapad">
      <h1 class="icon side">[]</h1>
      <span class="feature side">Wow</span><span class="side"> - Wow wow wow</span>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col two bg margin extrapad">
      <h1 class="icon side">[]</h1>
      <span class="feature side">Wow wow</span><span class="side"> - Wow wow</span>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="group margin"></div>
    <div class="col two bg margin extrapad">
      <h1 class="icon side">[]</h1>
      <span class="feature side">Wow wow</span><span class="side"> - Wow</span>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col two bg margin extrapad">
      <h1 class="icon side">[]</h1>
      <span class="feature side">Wow</span><span class="side"> - Wow wow</span>
      <p class="side">Wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="group"></div>
  </div>
</div>
<div class="section">
  <div class="container">
    <div class="col two">
      <h1 class="icon">[]</h1>
      <h1 class="service">Wow</h1>
      <p>Wow wow wow wow wow wow wow wow wow wow wow wow wow</p>
    </div>
    <div class="col two">
      <h1 class="icon">[]</h1>
      <h1 class="service">Wow</h1>
      <p>Wow wow wow wow wow wow wow wow wow</p>
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
