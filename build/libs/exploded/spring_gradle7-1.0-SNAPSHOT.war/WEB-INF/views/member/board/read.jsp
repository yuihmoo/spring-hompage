<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: yyj
  Date: 2021-08-27
  Time: 오전 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<c:forEach var="row" items="${boards}">
<head>
    <title>YJ HOMEPAGE : ${row.title}</title>
</head>
<body>
    <!doctype>
    <html>
    <head>
        <meta charset="utf-8">
        <style>
            body{
                background-color: #e2e2e5;
            }
            .container{
                display: flex;
                flex-direction: column;
            }
            header{
                border-bottom:1px solid gray;
                padding-left:20px;
                text-align: center;
            }
            footer{
                border-top:1px solid gray;
                padding:20px;
                text-align: center;
            }
            .content{
                display:flex;
            }
            .content nav{
                border-right:1px solid gray;
            }
            .content aside{
                border-left:1px solid gray;
            }
            nav, aside{
                flex-basis: 150px;
                flex-shrink: 0;
            }
            main{
                padding:10px;
            }
            body {
                font-family: "Century Gothic", 'Lato', sans-serif;
            }

            a {
                text-decoration: none;
            }

            .et-hero-tabs,
            .et-slide {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 98vh;
                position: relative;
                background: #eee;
                text-align: center;
                padding: 0 2em;
            h1 {
                font-size: 3rem;
                margin: 0;
                letter-spacing: 3rem;
            }
            h3 {
                font-size: 1rem;
                letter-spacing: 0.3rem;
                opacity: 0.6;
            }
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
            &--top {
                 position: fixed;
                 top: 0;
             }
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
            &:hover {
                 color:white;
                 background: rgba(102,177,241,0.8);
                 transition: all 0.5s ease;
             }
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
                .et-hero-tabs,
                .et-slide {
                h1 {
                    font-size: 3rem;
                }
                h3 {
                    font-size: 1rem;
                }
            }
            .et-hero-tab {
                font-size: 1rem;
            }
        </style>
    </head>
    <body>
    <div class="container">
        <header>
            <h1>${row.title}</h1>
        </header>
        <section class="content">
            <nav>
                <ul>
                    작성자 : ${row.memId}
                </ul>
            </nav>
            <main>
                ${row.content}
            </main>
        </section>
        <footer>
            <div class="et-hero-tabs-container">
                <a class="et-hero-tab" hidden href="/member/board/modifyForm?num=${row.num}">수정</a>
                <a class="et-hero-tab" hidden href="/member/board/delete?num=${row.num}">삭제</a>
                <a class="et-hero-tab" href="/">MAIN</a>
                <a class="et-hero-tab" href="/member/board/list">목록</a>
                <span class="et-hero-tab-slider"></span>
            </div>
        </footer>
    </div>
    </body>
    </html>
</c:forEach>
</body>
</html>
