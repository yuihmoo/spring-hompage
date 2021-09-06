<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <title>게시판예제-페이징</title>
</head>


<div layout:fragment="content">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                게시판 페이징 적용
                <small>advanced tables</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Tables</a></li>
                <li class="active">Data tables</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">게시판 + 페이징</h3>

                            <div class="box-tools">
                                <div class="input-group input-group-sm" style="width: 150px;">
                                    <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-bordered">
                                <tr>
                                    <th style="width: 10px">BNO</th>
                                    <th>TITLE</th>
                                    <th style="width: 200px">WRITER</th>
                                    <th style="width: 200px">REGDATE</th>
                                    <th style="width: 40px">VIEWCNT</th>
                                </tr>

                                <tr th:each="board : ${list}">
                                    <td th:text="${board.num}">BNO</td>
                                    <td><a th:href="@{/member/board/read(num=${board.num},page=${pageMaker.cri.page},perPageNum=${pageMaker.cri.perPageNum})}" th:text="${board.title}">TITLE</a></td>
                                    <td th:text="${board.writeDate}">WRITER</td>
                                    <td th:text="${dates.format(board.updateWriteDate, 'yyyy-MM-dd HH:mm')}">REGDATE</td>
                                    <td th:text="${board.content}">VIEWCNT</td>
                                </tr>

                            </table>
                        </div>
                        <!-- /.box-body -->

                        <!-- 게시판 하단의 페이징 버튼 -->
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right">

                                <li th:if="${pageMaker.prev} == true">
                                    <a th:href="@{/member/board/listPage(page=${pageMaker.startPage}-1,perPageNum=${pageMaker.cri.perPageNum})}">&laquo;</a>
                                </li>

                                <li th:each="idx,iterStat : ${#numbers.sequence(pageMaker.startPage,pageMaker.endPage)}"  th:classappend="${pageMaker.cri.page} == ${num} ? active : null">
                                    <a th:href="@{/member/board/listPage(page=${num},perPageNum=${pageMaker.cri.perPageNum})}" th:text="${num}"></a>
                                </li>

                                <li th:if="${pageMaker.next} == true and ${pageMaker.endPage > 0}">
                                    <a th:href="@{/member/board/listPage(page=${pageMaker.endPage}+1,perPageNum=${pageMaker.cri.perPageNum})}">&raquo;</a>
                                </li>

                            </ul>

                        </div>
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</div>
</html>