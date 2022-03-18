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
	    <div class="panel-heading">Login</div>
	    <div class="panel-body">
	    	
	    	<form action = "loginSelect.do" method="post">
	    	<table style = "width : 500px; margin : auto; text-align : center;" class="table table-hover table-bordered"><!-- margin : auto >> 자동으로 가운데로 간다  -->
	    		<tr>
	    			<td>아이디</td>
	    			<td>
	    				<input id = "id"  class = "form-control" type = "text" name = "id" placeholder="Enter ID">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>비밀번호</td>
	    			<td><input class = "form-control" type = "password" name = "pw" placeholder="Enter PW"></td>
	    		</tr>
	    		
	    		<tr>
	    			<td colspan = "2">
	    				<button class = "btn btn-primary btn-sm" type="submit">로그인</button>
	    				<br>
	    				<a href = "join.do">아직 회원이 아니시라면 여기를 눌러주세요!</a> <!--타입에 버튼으로 줘야지 일반 버튼으로 인식해서 작동한다!  -->
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

