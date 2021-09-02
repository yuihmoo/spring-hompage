
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

    .et-hero-tab {
        display: flex;
        justify-content: center;
        align-items: center;
        flex: 1;
        color: #000000;
        letter-spacing: 0.1rem;
        transition: all 0.5s ease;
        font-size: 1.2rem;
        padding-top: 40px
    }
    .et-hero-tab-slider {
        position: absolute;
        bottom: 0;
        width: 0;
        height: 6px;
        background: #66B1F1;
        transition: left 0.3s ease;
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
            <th>최근 수정일</th>
            <th>조회수</th>
        <c:forEach var="row" items="${boards}">
            <tr>
                <td>${row.num}</td>
                <td>${row.memId}</td>
                <td><a href="<c:url value="/member/board/read?num=${row.num}&hit=${row.hit}"/>"/>${row.title}</td>
                <td><fmt:formatDate value="${row.write_date}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td><fmt:formatDate value="${row.update_write_date}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${row.hit}</td>
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
    <script type="text/javascript">
        var checked = document.getElementById("box${row.num}");
        function update() {
            var form = document.createElement("form");
            form.setAttribute("method", "Post");
            form.setAttribute("action", "/member/board/modifyForm?num=${checked}");
            form.submit();
        }
    </script>
</form>
</html>