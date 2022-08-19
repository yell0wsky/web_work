<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%
	//sample 데이터
	request.setAttribute("size", 123456789);
	request.setAttribute("price", 2500000);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test05.jsp</title>
</head>
<body>
	<p>
		파일의 크기는 
		<fmt:formatNumber value="123456789" pattern="#,###"/>
		byte 입니다.
	</p>
	<p>
		파일의 크기는 
		<fmt:formatNumber value="${size }" pattern="#,###"/>
		byte 입니다.
	</p>
	<p>
		가격은
		<fmt:formatNumber value="2500000" type="currency"/>
		입니다.
	</p>
	<p>
		가격은
		<fmt:formatNumber value="${price }" type="currency"/>
		입니다.
	</p>
	<p>
		가격은
		<fmt:formatNumber value="${price }" type="currency" currencySymbol="$"/>
		입니다.
	</p>
</body>
</html>










