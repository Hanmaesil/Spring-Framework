<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<BoardVO>list = (ArrayList<BoardVO>)session.getAttribute("list");

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
	    	<table class="table table-hover table-bordered"><!-- 클래스 여러개 주려면 띄어쓰기 하면 된다  -->
	    		<tr class = "info">
	    			<td>번호</td>
	    			<td>제목</td>
	    			<td>조회수</td>
	    			<td>작성자</td>
	    			<td>작성일</td>
	    		</tr>
	    	<%-- 	<%for(int i = 0; i < list.size(); i++){ %>
	    			<tr>
	    			<td><%= list.get(i).getIdx() %></td>
	    			<td><%= list.get(i).getTitle() %></td>
	    			<td><%= list.get(i).getCount() %></td>
	    			<td><%= list.get(i).getWriter() %></td>
	    			<td><%= list.get(i).getIndate() %></td>
	    			</tr>
	    		<%} %> --%>
	    		
		    		<c:forEach var ="board" items = "${list}" begin = "0" step ="2">
		    			<tr>
		    			<td>${board.idx}</td>
		    			<td>${board.title}</td>
		    			<td>${board.count}</td>
		    			<td>${board.writer}</td>
		    			<td>${board.indate}</td>
		    			</tr>
		    		</c:forEach>
		    		
	    		
	    	</table>
	    </div>
	    <div class="panal-body">빅데이터 1차 (한국인)</div>
	  </div>
	</div>
	
	
	

</body>
</html>

