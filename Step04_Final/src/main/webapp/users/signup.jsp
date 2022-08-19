<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 아이디, 비밀번호, 이메일 추출
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	//2. DB 에 저장
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	boolean isSuccess=UsersDao.getInstance().insert(dto);
	//3. 결과 응답하기
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
	<h1>알림</h1>
	<%if(isSuccess){ %>
		<p>
			<strong><%=id %></strong>님 가입 되었습니다.
			<a href="loginform.jsp">로그인 하러 가기</a>
		</p>
	<%}else{ %>
		<p>
			가입이 실패 했습니다.
			<a href="signup_form.jsp">다시 가입하러 가기</a>
		</p>
	<%} %>
</body>
</html>



