<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. get 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB에서 해당 회원의 정보를 삭제한다.
	boolean isSuccess=MemberDao.getInstance().delete(num);
	//3. 응답한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
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