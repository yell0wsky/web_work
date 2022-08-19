<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/test01.jsp</title>
</head>
<body>
	<h1>JSTL (Jsp Standard Tag Library)</h1>
	<c:forEach var="i" begin="1" end="5">
		<p>안녕 ${i }</p>
	</c:forEach>
</body>
</html>







