<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// MemberDto 객체를 생성해서 회원 한명의 정보를 담고 
	MemberDto dto=new MemberDto();
	dto.setNum(1);
	dto.setName("김구라");
	dto.setAddr("노량진");
	
	// "dto" 라는 키값으로 request scope 에 담기
	request.setAttribute("dto", dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_el/test03.jsp</title>
</head>
<body>
	<%
		MemberDto result = (MemberDto)request.getAttribute("dto");
	%>
	<p> 번호 : <strong><%=result.getNum() %></strong></p>
	<p> 이름 : <strong><%=result.getName() %></strong></p>
	<p> 주소 : <strong><%=result.getAddr() %></strong></p>
	
	
	<%--
		dto 의 getter 메소드를 호출하는 표현식 대신에 
		dto 의 필드명만 적어도 알아서 getter 메소드가 호출된다.
	 --%>
	<p> 번호 : <strong>${dto.num }</strong></p>
	<p> 이름 : <strong>${dto.name }</strong></p>
	<p> 주소 : <strong>${dto.addr }</strong></p>
</body>
</html>












