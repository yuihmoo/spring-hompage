<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <title>게시판 목록</title>
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
        outline-style: auto;
    }
    td{
        padding: 16px;
        border: 1px #000000;
        outline-style: none;
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
        background-image: url("/images/frame.jpg");
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
        position: page;
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
    ul, li {
        list-style-type: none; float: left; padding-left: 1rem;
    }
    a:link { text-decoration:none; color:#2a9a9f;}

    a:visited { text-decoration:none;color:#000000;}

    a:active {text-decoration:none; color:#e83611; }

    a:hover { text-decoration:none; color:#EDA900;}
</style>
<script>
    function selChange() {
        const sel = document.getElementById('perPageNum').value;
        location.href="/member/board/listPage?page=${pageMaker.startPage}&perPageNum="+sel+"&sortOption=${cri.sortOption}";
    }
    function sortChange() {
        const sel = document.getElementById('sortOption').value;
        location.href="/member/board/listPage?page=${pageMaker.startPage}&perPageNum=${cri.perPageNum}&sortOption="+sel;
    }
</script>
<body>
<section class="et-hero-tabs">
    <table>
        <h1>게시판</h1>
        <th>번호</th>
        <th>제목</th>
        <th>아이디</th>
        <th>작성일</th>
        <th>조회수</th>
        <th>최근 수정일</th>
        <c:forEach var="row" items="${list}">
            <tr>
                <td>${row.num}</td>
                <td><a href="<c:url value="/member/board/read?num=${row.num}&hit=${row.hit}"/>"/>${row.title}</td>
                <td>${row.memId}</td>
                <td><fmt:formatDate value="${row.writeDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${row.hit}</td>
                <td><fmt:formatDate value="${row.updateWriteDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>
    <input type="text" id="searchOption" name="searchOption" width="3rem" onsubmit="">
    <div id="per-Page-Button" style="float: right">
        <div>
            <select id="perPageNum" name="perPageNum" onchange="selChange()">
                <option value="10"
                        <c:if test="${cri.perPageNum == 10}">selected</c:if>>10줄 보기
                </option>
                <option value="15"
                        <c:if test="${cri.perPageNum == 15}">selected</c:if>>15줄 보기
                </option>
                <option value="20"
                        <c:if test="${cri.perPageNum == 20}">selected</c:if>>20줄 보기
                </option>
            </select>
        </div>
    </div>
    <div id="sort-Option-Button" style="float: right">
        <div>
            <select id="sortOption" name="sortOption" onchange="sortChange()">
                <option value="num"
                        <c:if test="${cri.sortOption == 'num'}">selected</c:if>>번호 순
                </option>
                <option value="updateWriteDate"
                        <c:if test="${cri.sortOption == 'updateWriteDate'}">selected</c:if>>최근 수정일 순
                </option>
                <option value="hit"
                        <c:if test="${cri.sortOption == 'hit'}">selected</c:if>>조회 순
                </option>
            </select>
        </div>
    </div>
    <ul class="btn-group-pagination">
        <li>
            <a href='<c:url value="/member/board/listPage?page=${1}&perPageNum=${cri.perPageNum}&sortOption=${cri.sortOption}"/>'>처음</a>
        </li>
        <c:if test="${pageMaker.prev == true }">
            <li>
                <a href='<c:url value="/member/board/listPage?page=${pageMaker.startPage-1 }&perPageNum=${cri.perPageNum}&sortOption=${cri.sortOption}"/>'>이전</a>
            </li>
        </c:if>
        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
            <li>
                <a href='<c:url value="/member/board/listPage?page=${pageNum}&perPageNum=${cri.perPageNum}&sortOption=${cri.sortOption}"/>'>[${pageNum}]</a>
            </li>
        </c:forEach>
        <c:if test="${pageMaker.next == true && pageMaker.endPage >0}">
            <li>
                <a href='<c:url value="/member/board/listPage?page=${pageMaker.endPage+1 }&perPageNum=${cri.perPageNum}&sortOption=${cri.sortOption}"/>'>다음</a>
            </li>
        </c:if>
        <li>
            <a href='<c:url value="/member/board/listPage?page=${pageMaker.tempEndPage}&perPageNum=${cri.perPageNum}&sortOption=${cri.sortOption}"/>'>끝</a>
        </li>
    </ul>
</section>
<div class="et-hero-tabs-container">
    <a class="et-hero-tab" href="/">MAIN</a>
    <a class="et-hero-tab" href="/member/board/writeForm">글쓰기</a>
    <span class="et-hero-tab-slider"></span>
</div>
</body>
</html>