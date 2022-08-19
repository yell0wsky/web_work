<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 글의 제목, 내용을 읽어온다. 
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//2. 세션에서 글 작성자를 읽어온다.
	String writer=(String)session.getAttribute("id");
	//3. 읽어온 모든 정보를 CafeDto 에 담는다.
	CafeDto dto=new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	//4. CafeDao 를 이용해서 DB 에 저장하고
	boolean isSuccess=CafeDao.getInstance().insert(dto);
	//5. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("새글이 추가 되었습니다.");
			location.href="${pageContext.request.contextPath }/cafe/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("글 작성 실패!");
			location.href="insertform.jsp";
		</script>	
	<%} %>
</body>
</html>






