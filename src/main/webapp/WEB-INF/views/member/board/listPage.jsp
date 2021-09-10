<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <title>게시판 목록</title>
    <link rel="stylesheet" type="text/css" href="/css/listPage.css?version=1.2.9">
</head>
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
<jsp:include page="header.jsp"></jsp:include>
<h1 id="page-title">게시판 목록</h1>
<div class="section">
    <div class="slider">
        <div class="container slidercontent">
            <div id="board-list">
                <div id="board-properties">
                    <div class="table-wrapper">
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
                        <table class="table" id="table">
                            <thead>
                            <tr class="table-head">
                                <th class="table-cell align-right">번호</th>
                                <th class="table-cell align-left">제목</th>
                                <th class="table-cell align-left">작성자</th>
                                <th class="table-cell align-left">작성일</th>
                                <th class="table-cell align-right">조회수</th>
                                <th class="table-cell align-left">최근 수정일</th>
                            </tr>
                            </thead>
                            <tbody>
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
                            </tbody>
                        </table>
                        <div class="btn-group-pagination">
<%--                        <input type="text" id="searchOption" name="searchOption" width="3rem" onsubmit="">--%>
                        <ul class="pagination">
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
                        </div>
                        <!-- /#no-results -->
                    </div>
                    <!-- /.table-wrapper -->
                </div>
                <!-- /.table-app -->
            </div>
        </div>
    </div>
</div>
</body>
</html>
<%--<body>
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
</div>--%>
