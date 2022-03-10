<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 페이지 지시자  -->
<%
//ArrayList<BoardVO>list = (ArrayList<BoardVO>)session.getAttribute("list");
List<BoardVO> list = (List<BoardVO>)session.getAttribute("list"); // jstl 사용시 불러올 필요 없다!
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
	    			<td><%= i + 1 %></td>
	    			<td><%= list.get(i).getTitle() %></td>
	    			<td><%= list.get(i).getCount() %></td>
	    			<td><%= list.get(i).getWriter() %></td>
	    			<td><%= list.get(i).getIndate() %></td>
	    			</tr>
	    		<%} %> --%>
	    			
	    			<c:set var = "i" value = "1" /> <!-- 게시판 번호를 위한 변수 설정  -->
	    			
		    		<c:forEach var ="board" items = "${requestScope.list}" varStatus="i"> <!--varStatus : 숫자 반복하는 기능(여러가지 기능이 있다, 찾아볼것)  -->
		    			<tr>
		    			<td>${i.count}</td>
		    			<td><a href = "boardContent.do?idx=${board.idx}">${board.title}</a></td>
		    			<td>${board.count}</td>
		    			<td>${board.writer}</td>
		    			<td>${board.indate}</td>
		    			</tr>
		    			<%--<c:set var ="i" value = "${i+1}"/>  --%>
		    		</c:forEach>
	    	</table>
	    	<a href = 'boardInsertForm.do'><button class = "btn btn-primary">글쓰기</button></a>
	    	<!-- 바로 jsp로 가지 못한다! -> 보안때문에 -> 프론트컨트롤러를 통해 컨트롤러를 한번 거쳐야된다!  -->
	    </div>
	    <div class="panal-body">빅데이터 1차 (한국인)</div>
	  </div>
	</div>
	
	
	

</body>
</html>

