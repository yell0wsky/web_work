<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope 에 저장된 아이디를 이용해서 
	String id=(String)session.getAttribute("id");
	//수정할 회원의 정보를 얻어온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
<style>
	/* 이미지 업로드 폼을 숨긴다 */
	#imageForm{
		display: none;
	}
	#profileImage{
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>가입정보 수정 폼 입니다.</h1>
		
		<a id="profileLink" href="javascript:">
			<%if(dto.getProfile() == null){%>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
			<%}else{ %>
				<img id="profileImage" src="${pageContext.request.contextPath }<%=dto.getProfile()%>">
			<%} %>
		</a>
		<form action="update.jsp" method="post">
			<input type="hidden" name="profile" 
				value="<%=dto.getProfile()==null ? "empty" : dto.getProfile()%>"/>
			<div>
				<label for="id">아이디</label>
				<input type="text" id="id" value="<%=dto.getId() %>" disabled/>
			</div>
			<div>
				<label for="email">이메일</label>
				<input type="text" id="email" name="email" value="<%=dto.getEmail()%>"/>
			</div>
			<button type="submit">수정확인</button>
			<button type="reset">취소</button>
		</form>
		
		<form id="imageForm" action="profile_upload.jsp" method="post" enctype="multipart/form-data">
			프로필 사진
			<input type="file" id="image" name="image" accept=".jpg, .png, .gif"/>
			<button type="submit">업로드</button>
		</form>
	</div>
	<!-- gura_util.js 로딩 -->
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	<script>

		//프로필 이미지 링크를 클릭하면 
		document.querySelector("#profileLink").addEventListener("click", function(){
			// input type="file" 을 강제 클릭 시킨다. 
			document.querySelector("#image").click();
		});		
		
		//프로필 이미지를 선택하면(바뀌면) 실행할 함수 등록
		document.querySelector("#image").addEventListener("change", function(){
			//ajax 전송할 폼의 참조값 얻어오기
			const form=document.querySelector("#imageForm");
			//gura_util.js 에 있는 함수를 이용해서 ajax 전송하기 
			ajaxFormPromise(form)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
				document.querySelector("input[name=profile]").value=data.imagePath;
				let img=`<img id="profileImage" 
					src="${pageContext.request.contextPath }\${data.imagePath}">`;
				document.querySelector("#profileLink").innerHTML=img;
			});
		});
	</script>
</body>
</html>



















