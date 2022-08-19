<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//글목록
	List<CafeDto> list=CafeDao.getInstance().getList();
	request.setAttribute("list", list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/vue/Step10_example.jsp</title>
</head>
<body>
	<h1>글목록 입니다.(서버 사이드 렌더링)</h1>
	<div id="app">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${requestScope.list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.writer }</td>
						<td>${tmp.title }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>









