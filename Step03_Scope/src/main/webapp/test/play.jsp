<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/play.jsp</title>
</head>
<body>
	<%
	
		//HttpSession 객체에 "nick" 이라는 키값으로 저장된 값이 있는지 읽어와 본다.
		String nick=(String)session.getAttribute("nick");
	%>
	<h1>play.jsp 페이지 입니다.</h1>
	<%if(nick==null){ %>
		<p>session 영역(scope) 에 "nick" 이라는 키값으로 저장된 값이 없습니다.</p>
	<%}else{ %>
		<p>
			<strong><%=nick %></strong> 님 놀러 오였네요? 신나게 놀다 가세요!
			<a href="logout.jsp">세션에 저장된 nick 삭제(로그아웃)</a>
		</p>
	<%} %>
</body>
</html>









