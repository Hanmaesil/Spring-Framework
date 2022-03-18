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
	    <div class="panel-heading">Join</div>
	    <div class="panel-body">
	    	
	    	<form action = "joinInsert.do" method="post">
	    	<table style = "width : 500px; margin : auto; text-align : center;" class="table table-hover table-bordered"><!-- margin : auto >> 자동으로 가운데로 간다  -->
	    		<tr>
	    			<td>아이디</td>
	    			<td>
	    				<input id = "id" style ="width : 200px; float :left;" class = "form-control" type = "text" name = "id" placeholder="Enter ID">
	    				<button id = "idCheck" type ="button" class = "btn btn-info btn-sm">아이디 중복확인</button>
	    				<br><br>
	    				<p id = "resultIdCheck" style = "text-align : left;"></p>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>비밀번호</td> <!-- readonly="readonly" ->> 읽기전용(id가 중복이어도 회원가입하는 사람을 막기위해서!)  -->
	    			<td><input readonly="readonly" id = "pw" class = "form-control" type = "password" name = "pw" placeholder="Enter PW"></td>
	    		</tr>
	    		<tr>
	    			<td>닉네임</td>
	    			<td><input readonly="readonly" id = "nick" class = "form-control" type = "text" name = "nick" placeholder="Enter NICK"></td>
	    		</tr>
	    		<tr>
	    			<td>전화번호</td>
	    			<td><input readonly="readonly" id = "tel" class = "form-control" type = "tel" name = "tel" placeholder="Enter TEL"></td>
	    		</tr>
	    		<tr>
	    			<td colspan = "2">
	    				<button class = "btn btn-primary btn-sm" type="submit">회원가입</button>
	    			</td>
	    		</tr>
	    	</table>
	    	</form>
	    	
	    </div>
	    <div class="panal-body">빅데이터 1차 (한국인)</div>
	  </div>
	</div>
	
	
	<script type="text/javascript">
		//문제! 중복체크 버튼을 눌렀을 때 console 에 버튼눌림이라는 글자를 출력하시오(jQuery사용)
		
		$("#idCheck").on("click", function(){
			console.log("버튼눌림")
			var id = $("#id").val();
			$.ajax({
				url : "idCheck.do",
				type : "post",
				dataType : "JSON",
				data : {"id": id},
				success : resultJson,
				error : function(e){
					console.log(e);
				}
			});
			
			
			
		});
		
		function resultJson(data){
			console.log(data);
			
			if(data.id == undefined){
				$("#resultIdCheck").text("사용가능한 아이디 입니다")
				$("#resultIdCheck").css('color', 'blue')
				$("#pw").removeAttr("readonly") //속성을 지우는 명령문
				$("#nick").removeAttr("readonly")
				$("#tel").removeAttr("readonly")
			}else{
				$("#resultIdCheck").text("사용 불가능한 아이디 입니다")
				$("#resultIdCheck").css('color', 'red')
				$("#pw").attr("readonly", true) //속성을 추가하는 명령문
				$("#nick").attr("readonly", true) 
				$("#tel").attr("readonly", true) 
			}
			
		}
		
		// 읽기전용 창을 클릭했을 때 알림창 뜨게하기
		$(".form-control").on('click', function(){
			
			var text = this.getAttribute("readonly"); // this 는  클릭한 대상의 요소를 가져온다(자바스크립트 언어이다)
			console.log(text);
			
			if(text == 'readonly'){
				alert("중복체크를 먼저 해주세요.")	
			}
			
		})
	
	
	
	
	
	
	
	
	</script>
	
	
	

</body>
</html>

