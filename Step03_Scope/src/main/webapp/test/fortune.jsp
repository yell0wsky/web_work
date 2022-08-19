<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/fortune.jsp</title>
</head>
<body>
	<%
		// fortuneTody 라는 키값으로 담긴 String type 얻어내기 
		String fortune=(String)request.getAttribute("fortuneToday");
	%>
	<p>오늘의 운세: <strong><%=fortune %></strong></p>
</body>
</html>





