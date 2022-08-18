<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 할일을 읽어와서
	request.setCharacterEncoding("utf-8");
	String content=request.getParameter("content");
	//2. DB 에 저장하고
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	boolean isSuccess=TodoDao.getInstance().insert(dto);
	//3. 응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>확인</h1>
	<%if(isSuccess){ %>
		<p class="alert alert-success">
		<strong><%=content%></strong>를 추가 했습니다.
		<a href="list.jsp">목록보기</a>
		</p>
	<%}else{ %>
		<p class="alert alert-danger">
			할일 추가 실패!
		<a class="alert-link" href="insertform.jsp">다시 시도</a>
		</p>
	<%} %>
</div>
</body>
</html>




