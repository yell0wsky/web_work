
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
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
	<%--
	포함시킬 jsp 페이지의 위치를 page 요소의 값으로 넣어준다
	/ 는 바로 webapp 폴더가 된다.
	이렇게 포함시키면 index.jsp 페이지와 navbar.jsp 페이지가 공동으로 클라이언트

 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage" />
	</jsp:include>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<%--
      절대경로를 표시할때 컨텍스트 경로가 필요하긴 하지만 
      컨텍스트 경로는 나중에 실제로 프로젝트가 끝나고 배포되는 시점에 변경되거나 제거될 예정이다.
      따라서 코딩할때 컨텍스트 경로를 실제로 코딩해 놓으면 나중에 제거하거나 변경할때 어려움이 예상된다.
      해결책은 jsp 페이지에서 context 경로가 필요하면 아래의 EL 을 이용해서 출력하면 된다.
    --%>
		<p>
			컨텍스트 경로(프로젝트명) : <strong>${pageContext.request.contextPath }</strong>
		</p>
		<ul>
			<li><a href="${pageContext.request.contextPath}/test/form.jsp">회원등록</a></li>
		</ul>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="true">
			<!-- 케러셀 하단의 표시바 -->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath }/images/top01.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath }/images/top02.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath }/images/top03.jpg"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<!-- 케러셀 좌우 버튼 -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<%--
	협동 작업을 통해서 응답할 jsp 페이지가 어디에 있는지 page 속성의 값으로 지정을 해주면
	이 부분은 해당 jsp 페이지가 응답을 하게 된다. 
 --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>














