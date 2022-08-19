<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//로그인된 아이디가 있는지 확인해서 
	String id=(String)session.getAttribute("id");
%>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/study.jsp</title>
</head>
<body>
	<h1>공부 페이지 입니다.</h1>
	<p> <%=id%>님 신나게 공부해요~</p>
	<a href="${pageContext.request.contextPath }/">인덱스로 돌아가기</a>
</body>
</body>
</html>