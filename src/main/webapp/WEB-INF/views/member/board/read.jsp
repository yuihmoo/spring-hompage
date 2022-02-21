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
<head>
    <title>${board.get("title")}</title>
    <link rel="stylesheet" type="text/css" href="/css/read.css?version=1.3.0">
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div class="container">
    <header>
        <h1>${board.get("title")}</h1>
    </header>
    <section class="board-content-letter">
        <nav>
            <ul>
                작성자 : ${board.get("memId")}
            </ul>
            <ul>
                작성일 : <br/>${board.get("writeDate")}
            </ul>
            <ul>
                최근 수정일 : <br/>${board.get("updateWriteDate")}
            </ul>
            <ul>
                조회수 : ${board.get("hit")}
            </ul>
        </nav>
        <main class="board-content">
            ${board.get("content")}
        </main>
    </section>
    <footer>
        <div>
            <a class="et-hero-tab" href="/member/board/modifyForm?num=${board.get("num")}">수정</a>
            <a class="et-hero-tab" href="/member/board/delete?num=${board.get("num")}">삭제</a>
            <a class="et-hero-tab" href="/">MAIN</a>
            <a class="et-hero-tab" href="/member/board/listPage">목록</a>
            <span class="et-hero-tab-slider"></span>
        </div>
    </footer>
</div>
</body>
</html>