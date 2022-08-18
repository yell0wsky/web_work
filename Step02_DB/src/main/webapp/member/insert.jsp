<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String addr = request.getParameter("addr");
MemberDto dto = new MemberDto();
dto.setName(name);
dto.setAddr(addr);

boolean isSuccess = MemberDao.getInstance().insert(dto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>확인</h1>
		<%if(isSuccess){ %>
			<p class="alert alert-success">
			<strong><%=name%></strong> 의 정보를 추가했습니다.</p>
			<a class="alert-link" href="list.jsp">확인</a>
		<%}else{ %>
			<p class="alert alert-danger">회원 추가에 실패했습니다.</p>
		<%} %>
		<a class="alert-link" href="insertform.jsp">다시작성</a>
	</div>
</body>
</html>