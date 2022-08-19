<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/hello.jsp</title>
</head>
<body>

	<c:forEach var="i" begin="0" end="9" step="1">
		<p>안녕 ${i }</p>
	</c:forEach>
	
	<%for(int i=0; i<=9 ; i++){ %>
		<p>안녕 <%=i %></p>
	<%} %>
</body>
</html>








