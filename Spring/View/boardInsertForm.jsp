<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 페이지 지시자  -->
<%
	//ArrayList<BoardVO>list = (ArrayList<BoardVO>)session.getAttribute("list");
List<BoardVO> list = (List<BoardVO>) session.getAttribute("list"); // jstl 사용시 불러올 필요 없다!
%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Spring MVC BOARD</h2>
		<div class="panel panel-primary">
			<div class="panel-heading">Board Form</div>
			<div class="panel-body">
				<form class="form-horizontal" action="boardInsert.do" method="post">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목 : </label><!-- label 태그 : for에 적어둔 값이 있는 id를 찾아간다  -->
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name = "title" placeholder="Enter title">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="writer" name = "writer" placeholder="Enter writer">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="contents">내용:</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="10" name = "contents" id = "contents"></textarea>							
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<button type = "reset" class = "btn btn-primary btn-sm">취소</button>
								<button type = "submit" class = "btn btn-info">저장</button>
							</div>
						</div>
					</div>
				</form>


			</div>

			<div class="panal-body">빅데이터 1차 (한국인)</div>

		</div>
	</div>




</body>
</html>

