<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, height=device-height, initial-scale=1">
    <title>게시물 등록</title>
    <link rel="stylesheet" type="text/css" href="/css/writeForm.css?version=1.6.7">
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
            form.setAttribute('action', "/member/board/modify?num=${board.get("num")}");
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
            contentHiddenField.setAttribute('value', contentValue )

            form.appendChild(titleHiddenField);
            form.appendChild(contentHiddenField);
            document.body.appendChild(form);
            form.submit();
            console.log(getContent())
        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1 id="page-title">게시물 작성</h1>
<div class="section">
    <div class="slider">
        <div class="container slidercontent">
            <div id="board-write">
                <div id="memId" name="memId">작성자 : ${board.get("memid")}</div>
                <div id="num" name="num">게시물 번호 : ${board.get("num")}</div>
                <br/>
                <div>제목 : <input type="text" id="board-title" name="title" value="${board.get("title")}"></div>
                <script src="${pageContext.request.contextPath}/util/ckeditor/ckeditor.js"></script>
                <p>내 용</p>
                <textarea name="content" id="editor">${board.get("content")}</textarea>
            </div>
            <div>
                <input type="button" value="완료" onclick="sendPost()">
                <span></span>
            </div>
        </div>
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
                <p>So that's it. This started out as 20 minutes of making fun of modern web dev. Then it turned into a
                    few hours of it.</p>
                <p>I hope you've enjoyed looking at every modern website ever.</p>
                <p>I don't actually hate this style as long as the content is meaningful. In fact, I think this type of
                    design is pretty cool and effective.</p>
            </div>
            <div class="col four left">
                <h1>How?</h1>
                <p>CSS3 and HTML. JS for header shrinking; optional. Site works perfectly with JS disabled (another
                    gripe of mine with modern web dev).</p>
                <p>Only external libraries are GFonts.</p>
                <p>Moderately responsive, should work on anything modern.</p>
            </div>
            <div class="col four left">
                <h1>Why?</h1>
                <p>Many popular HTML themes have thousands of lines of HTML, thousands of lines of CSS and several JS
                    plugins on every page amounting to tens of thousands of lines of JavaScript.</p>
                <p>I fail to see a valid reason for this, particularly the horrendous line counts that are usually due
                    to unused features or badly designed code.</p>
            </div>
            <div class="col four left">
                <h1>Who?</h1>
                <p>I'm Andrew.</p>
                <p>You can get in touch with me through <a href="http://atunnecliffe.com">http://atunnecliffe.com</a> or
                    <a href="mailto:andrew@atunnecliffe.com">emailing me</a>.</p>
            </div>
            <div class="group"></div>
        </div>
    </div>
</div>
</body>
</html>