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
    <link rel="stylesheet" type="text/css" href="/css/modifyForm.css?version=1.0.0">
    <title>YJ HOMEPAGE</title>
    <script>
        window.onload = function () {
            ck = CKEDITOR.replace("editor");
        };

        function getContent() {
            const data = CKEDITOR.instances.editor.getData();
            return data;
        }
        function sendPost(action, params) {

            const form = document.createElement('form');
            form.setAttribute('method', 'post');
            form.setAttribute('action', "/member/board/write");
            document.charset = "utf-8";


            const titleHiddenField = document.createElement('input');
            titleHiddenField.setAttribute('type', 'hidden');
            titleHiddenField.setAttribute('name', 'title' );
            const titleValue = document.getElementById("board-title").value;
            titleHiddenField.setAttribute('value', titleValue );

            const contentHiddenField = document.createElement('input');
            contentHiddenField.setAttribute('type', 'hidden');
            contentHiddenField.setAttribute('name', 'content' );
            const contentValue = getContent();
            contentHiddenField.setAttribute('value', contentValue );

            form.appendChild(titleHiddenField);
            form.appendChild(contentHiddenField);
            document.body.appendChild(form);
            form.submit();
            console.log(getContent())
        }
    </script>
</head>
<body>
<form>
<div class="container">
    <header>
        <h1>제목 : <input type="text" value="${board.get("title")}" name="title"/></h1>
    </header>
    <section class="content">
        <nav>
            <ul>
                번호 : <input type="text" value="${board.get("num")}" readonly name="num"/>
            </ul>
            <ul>
                작성자 : <input type="text" value="${board.get("memId")}" readonly name="memId"/>
            </ul>
        </nav>
        <main>
            <script src="${pageContext.request.contextPath}/util/ckeditor/ckeditor.js"></script>
            <p>내 용</p>
            <textarea name="board-content" id="editor">${board.get("content")}</textarea>
        </main>
    </section>
    <footer>
        <div class="et-hero-tabs-container">
            <a class="et-hero-tab" href="/member/board/list">글 목록</a>
            <input class="et-hero-tab" type="submit" value="수정 완료" formmethod="post" formaction="/member/board/modify">
            <a class="et-hero-tab" href="/">MAIN</a>
            <span class="et-hero-tab-slider"></span>
        </div>
    </footer>
</div>
</form>
</body>
</html>