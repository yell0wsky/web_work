<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

	<nav class="navbar navbar-light bg-light navbar-expand-lg">
		<div class="container-fluid">
		    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
		      	<img src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
		      	MonkeyStrap
		    </a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
		    	data-bs-target="#navbarNav">
   				<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNav">
      			<ul class="navbar-nav me-auto">
      				<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'file' ? 'active' : '' }" href="${pageContext.request.contextPath}/file/list.jsp">자료실</a>
	        		</li>
	        		<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'cafe' ? 'active' : '' }" href="${pageContext.request.contextPath}/cafe/list.jsp">카페</a>
	        		</li>
	     			<li class="nav-item">
	          			<a class="nav-link ${param.thisPage eq 'gallery' ? 'active' : '' }" href="${pageContext.request.contextPath}/gallery/list.jsp">겔러리</a>
	        		</li>
      			</ul>
      			<c:choose>
      				<c:when test="${empty id }">
	      				<a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
	      				<a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
      				</c:when>
      				<c:otherwise>
	      				<span class="navbar-text me-2">
	      					<a href="${pageContext.request.contextPath}/users/private/info.jsp">${id }</a> 로그인중...
	      				</span>
	      				<a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
      				</c:otherwise>
      			</c:choose>
    		</div>
		</div>
	</nav>
	
	
	
	
	
	
	
	
	
	
	