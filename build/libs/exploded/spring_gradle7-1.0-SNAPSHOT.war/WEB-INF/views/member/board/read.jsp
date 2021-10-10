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
    <link rel="stylesheet" type="text/css" href="/css/read.css?version=1.2.1">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1 id="page-title">제목 : ${board.get("title")}</h1>
<div class="board-content">
    <p class="board-content-letter">${board.get("content")}</p>
</div>
</body>
</html>
