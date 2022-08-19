<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터로 전달되는 글 번호를 읽어온다. 
	int num=Integer.parseInt(request.getParameter("num"));
	//글 번호를 이용해서 글 하나의 정보를 읽어온다. 
	CafeDto dto=CafeDao.getInstance().getData(num);
	//로그인된 아이디
	String id=(String)session.getAttribute("id");
	//조회수 올리기
	CafeDao.getInstance().addViewCount(num);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<style>
	img{
		max-width: 100%;
	}
</style>
</head>
<body>
<div class="container">
	<h1>글 상세 보기</h1>
	<table class="table table-bordered">
		<colgroup>
			<col class="col-6"/>
			<col class="col-6"/>
		</colgroup>
		<tr>
			<th>글번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getViewCount() %></td>
		</tr>
		<tr>
			<td colspan="2">
				<div><%=dto.getContent() %></div>
			</td>
		</tr>
	</table>
	<%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
	<%if(dto.getWriter().equals(id)){ %>
		<a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
		<a href="javascript:" onclick="deleteConfirm()">삭제</a>
		<script>
			function deleteConfirm(){
				const isDelete=confirm("이 글을 삭제 하겠습니까?");
				if(isDelete){
					location.href="private/delete.jsp?num=<%=dto.getNum()%>";
				}
			}
		</script>
	<%} %>
</div>
</body>
</html>













