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
	    <div class="panel-heading">Board List
	    
	    <!-- 로그인 했을 때는 버튼을 로그아웃으로 로그인 안했을 때는 로그인으로 해주세요! -->
	    <c:choose>
	    	<c:when test="${empty info}"><!-- not empty info ->> 로그인했을때!  -->
	    		 <a href ="login.do"><button class = "btn btn-info btn-sm" style = "float : right">로그인</button></a>
	    	</c:when>
	    	<c:otherwise>
	    		<br>
	    		<span>로그인중인 닉네임 : ${info.nick}</span>
	    		 <a href ="logout.do"><button class = "btn btn-info btn-sm" style = "float : right">로그아웃</button></a>
	    		 <c:if test="${info.id eq 'admin' }">
	    		 	<button style = "width : 120px" type = "button" id = "memberList" class = "btn btn-info btn-sm">회원정보 보기</button>
	    		 </c:if>
	    	</c:otherwise>
	    </c:choose>
	   <div id = "resultMemberList" style = "display : none;"><!-- style = "display : none;" >> 초기에 안에 내용이 있더라도 안보이게 하는 태그  -->
	   
	   
	   </div>
	   
	   
	    </div>
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
	
	<script type="text/javascript">
	
		$("#memberList").on("click",function(){
			
			console.log("회원정보 목록 클릭");
			//자바스크립트에서 중괄호는 객체를 넣는 곳!
			$.ajax({
				url : "memberList.do", // /memberList 로 적으면 web이 사라져서 404뜸!
				type : "post",
				dataType : "JSON",
				success : resultJson,
				error : function(e){ // 에러가 발생하면 e에 에러 정보가 담긴다
					console.log(e);
				}
				
			});
			
			
		});
		
		
		function resultJson(data){ //서버에서 받아온 JSON데이터가 data에 저장된다
			console.log(data);
			//회원정보를 resultMemberList div안에 table형식으로 넣어주세요
			
			//회원정보 목록 닫기
			var btnText = $("#memberList").text(); //글자가져오기
			
			if(btnText == '회원정보 보기'){
				$("#memberList").text('닫기');
				
				var html = "<table class = 'table table-hover table-dordered'>";
				html += "<tr><td>번호</td><td>아이디</td><td>비밀번호</td>";
				html += "<td>닉네임</td><td>전화번호</td></tr>";
				
				
				$.each(data, function(index, obj){ //제이쿼리 반복문 //index는 포문의  i같은 역할 //obj는 data의 자료들을 하나씩 받아온다(obj는 이름일 뿐 다른걸로 해도 된다)
					html += "<tr>";
					html += "<td>" + (index + 1) + "</td>";
					html += "<td>" + obj.id + "</td>";
					html += "<td>" + obj.pw + "</td>";
					html += "<td>" + obj.nick + "</td>";
					html += "<td>" + obj.tel + "</td>";
					html += "</tr>";
					
				}); 
				html += "</table>";
				
				$("#resultMemberList").html(html);
				
				$("#resultMemberList").slideDown(2000); //괄호안에 ms 단위로 숫자를 적으면 시간이 적용됨
			}else{
				$("#memberList").text('회원정보 보기');
				
				$("#resultMemberList").slideUp();
			}
			
			
			
		}
			
			
			
			
			
			
			
			
			
			
			/*var html = "";
		
			html += "<table>";
			for( let i = 0; i < data.length; i++ ){
				html += "<tr><td>" + data[i].id + "</td>";
				html += "<td>" + data[i].pw + "</td>"
				html += "<td>" + data[i].nick + "</td>"
				html += "<td>" + data[i].tel + "</td></tr>"
			}
			html += "</table>";
			
			$("#resultMemberList").html(html);
		
		};*/
		
		/* $("#resultMemberList").append(
		"<table>" +
		for( let i = 0; i < data.length; i++ ){
			let data = data[i]
			"<tr><td>" + data.id + "</td>"
			+"<td>" + data.pw + "</td>"
			+"<td>" + data.nick + "</td>"
			+"<td>" + data.tel + "</td></tr>"
		};
		+"</table>"
		


) */
	
	
	
	</script>
	
	
	

</body>
</html>

