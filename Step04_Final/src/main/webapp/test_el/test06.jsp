<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cook=new Cookie("savedId", "kimgura");
	cook.setMaxAge(60);
	response.addCookie(cook);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test06.jsp</title>
</head>
<body>
	<h1>쿠키에 저장된 내용도 EL 로 추출할수 있다.</h1>
	<p>savedId 라는 키값으로 60초 동안 유지되는 쿠키를 응답했습니다.</p>
	<a href="test07.jsp">쿠키값 확인하기</a>
</body>
</html>