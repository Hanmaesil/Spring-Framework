<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 페이지 지시자  -->
<%
//ArrayList<BoardVO>list = (ArrayList<BoardVO>)session.getAttribute("list");
//List<BoardVO> list = (List<BoardVO>)session.getAttribute("list"); // jstl 사용시 불러올 필요 없다!
%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
	<div class="container">
	  <h2>Spring MVC BOARD</h2>
	  <div class="panel panel-primary">
	    <div class="panel-heading">Board List</div>
	    <div class="panel-body">
	    	
	    	<% BoardVO vo = (BoardVO)request.getAttribute("vo"); // model에 담긴 값은 리퀘스트에 저장된다!!!!! %>
	    	<!-- el식을 사용하면 그냥 이름으로 바로 꺼내오니까 더 쉬움!  -->
	    	<form action = "boardUpdate.do" method="post">
	    	<input type = "hidden" name ="idx" value = "${vo.idx}"> <!-- db업데이트를 위해 idx를 히든으로 보낸다!  -->
	    	<table class="table table-hover table-bordered"><!-- 클래스 여러개 주려면 띄어쓰기 하면 된다  -->
	    		<tr>
	    			<td>번호</td>
	    			<td><%= vo.getIdx() %></td>
	    		</tr>
	    		<tr>
	    			<td>제목</td>
	    			<td><input type = "text" class = "form-control" name = "title" value = "${vo.title}"></td>
	    		</tr>
	    		<tr>
	    			<td>조회수</td>
	    			<td>${vo.count }</td>
	   			</tr>
	   			<tr>
	    			<td>작성자</td>
	    			<td>${vo.writer}</td>
	   			</tr>
	   			<tr>
	    			<td>작성일</td>
	    			<td>${vo.indate }</td>
	    		</tr>
	   			<tr>
	    			<td>내용</td>
	    			<td><textarea class = "form-control" rows ="5" name = "contents">${vo.contents}</textarea></td>
	    		</tr>
	    		<tr>
	    			<td colspan = "2">
	    				<button class = "btn btn-primary btn-sm" type="submit">수정</button>
	    				<a href = "boardDelete.do?idx=${vo.idx}"><button type ="button" class = "btn btn-warning btn-sm">삭제</button></a>
	    				<a href = "boardList.do"><button type = "button" class = "btn btn-info btn-sm">목록</button></a> <!--타입에 버튼으로 줘야지 일반 버튼으로 인식해서 작동한다!  -->
	    			</td>
	    		</tr>
	    	</table>
	    	</form>
	    	
	    </div>
	    <div class="panal-body">빅데이터 1차 (한국인)</div>
	  </div>
	</div>
	
	
	

</body>
</html>

