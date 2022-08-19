<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_el/test07.jsp</title>
</head>
<body>
	<p> savedId 라는 키값으로 쿠키가 저장되었는지 여부 : ${not empty cookie.savedId }</p>
	<p> savedId 라는 키값으로 저장된 값 : ${cookie.savedId.value }</p>
</body>
</html>