<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/WEB-INF/views/monkey.jsp</title>
</head>
<body>
	<%
		String nick=(String)session.getAttribute("nick");
	%>
	<p> <strong><%=nick %></strong> 이라는 닉네임을 기억 하겠습니다. </p>
	<p>60 초 동안 아무런 요청을 하지 않거나 웹브라우저를 닫으면 자동 삭제 됩니다.</p>
	<a href="../index.jsp">인덱스로 이동하기</a>
</body>
</html>