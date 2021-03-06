
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시판</title>
</head>
<style>
    body, h1 {
        font-family: "Century Gothic", 'Lato', sans-serif;
        color: #000000;
    }
    .et-hero-tabs{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 98vh;
        position: relative;
        text-align: center;
        padding: 0 2em;
        border: 1px #2D2F36;
        background-image: url("/images/alfons.jpg");
        background-size: cover;
        /*background-position-y: -140px;*/
    }
    th{
        padding: 32px;
        border: 1px #000000;
    }
    td{
        padding: 16px;
        border: 1px #000000;
    }
    a{
        color: #000000;
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
<form method="post" action="/member/board/read">
    <body>
    <section class="et-hero-tabs">
        <table>
            <h1>게시판</h1>
            <th>번호</th>
            <th>아이디</th>
            <th>제목</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>최근 수정일</th>
            <th>수정자</th>
        <c:forEach var="row" items="${list}">
            <tr>
                <td>${row.num}</td>
                <td>${row.memId}</td>
                <td><a href="<c:url value="/member/board/read?num=${row.num}&hit=${row.hit}"/>"/>${row.title}</td>
                <td><fmt:formatDate value="${row.writeDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${row.hit}</td>
                <td><fmt:formatDate value="${row.updateWriteDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${row.updateId}</td>
            </tr>
            </c:forEach>
    </table>
        <div class="et-hero-tabs-container">
            <a class="et-hero-tab" href="/">MAIN</a>
            <a class="et-hero-tab" href="/member/board/writeForm">글쓰기</a>
            <span class="et-hero-tab-slider"></span>
        </div>
    </section>
    </body>
</form>
</html>