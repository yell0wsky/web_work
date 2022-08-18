<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 ( ?num=x ) 전달되는 삭제할 할일 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 삭제
	boolean isSuccess=TodoDao.getInstance().delete(num);
	//3. 응답
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/delete.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
	<script>
	<%if(isSuccess){ %>
		alert("삭제 했습니다.");
		location.href="list.jsp";
	<%}else{ %>
		alert("삭제 실패!");
		location.href="list.jsp";
	<%}%>
	</script>
</body>
</html>