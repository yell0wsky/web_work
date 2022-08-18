<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//1. 수정할 할일 번호 읽어오기 
int num = Integer.parseInt(request.getParameter("num"));
//2. DB 에서 해당 할일의 정보를 얻어와서
TodoDto dto = TodoDao.getInstance().getData(num);
//3. 할일 수정 폼을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="todo" name="thisPage" />
	</jsp:include>
	<div class="container">
		<nav class="mt-2">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath }/index.jsp">Home</a></li>
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
				</li>
				<li class="breadcrumb-item active">할일 추가 페이지</li>
			</ol>
		</nav>
		<h1>할일 수정 양식</h1>
		<form action="update.jsp" method="post">
			<input type="hidden" name="num" value="<%=num%>" />
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label" for="num">번호</label>
				<div class="col-sm-10">
					<input type="text" id="num" value="<%=num%>" readonly
						class="form-control-plaintext" />
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label" for="content">내용</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="content" id="content"
						value="<%=dto.getContent()%>" />
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label" for="regdate">등록일</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="regdate"
						value="<%=dto.getRegdate()%>" disabled />
				</div>
			</div>
			<button class="btn btn-primary btn-sm" type="submit">수정확인</button>
			<button class="btn btn-danger btn-sm" type="reset">취소</button>
		</form>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>

















