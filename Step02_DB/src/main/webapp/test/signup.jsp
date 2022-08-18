<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //한글깨지지 않도록
   request.setCharacterEncoding("utf-8");

   /*
      폼 전송되는 모든 내용을 추출해서 아래에 정보를 출력한다.
   */
   
   //입력한 email, comment, job, concern, gender 파라미터 모두 읽어오기
   String email=request.getParameter("email");
   String comment=request.getParameter("comment");
   String job=request.getParameter("job");
   String[] concern=request.getParameterValues("concern");
   String gender=request.getParameter("gender");
   if(concern==null) {
	    concern = new String[] {""};
	}
   //String[] 을 List<String>으로 변환하기
   //변환하면 .contains() 메소드를 활용할 수 있다.
   List<String> list=Arrays.asList(concern);
   
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
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
<div class="container">
   <h1>전송된 정보는 아래와 같습니다.</h1>
   <div class="mb-3">
      <label class="form-label" for="email">이메일</label>
      <input class="form-control" type="text" name="email" id="email" value="<%=email%>" disabled/>
   </div>
   <div class="mb-3">
      <label class="form-label" for="comment">할말</label>
      <textarea class="form-control" name="comment" id="comment" disabled><%=comment%></textarea>
   </div>
   <div class="mb-3">
      <label class="form-label" for="job">직업</label>
      <select class="form-select" name="job" id="job" disabled>
         <option>선택</option>
         <option value="programmer"<%=job.equals("programmer")?"selected":""%>>프로그래머</option>
         <option value="teacher"<%=job.equals("teacher")?"selected":""%>>선생님</option>
         <option value="doctor"<%=job.equals("doctor")?"selected":""%>>의사</option>
         <option value="etc"<%=job.equals("etc")?"selected":""%>>기타</option>
      </select>
   </div>
   <div class="mb-3">
      <fieldset>
         <legend>관심사 체크</legend>
         <label class="form-check-label">
            <input class="form-check-input" type="checkbox" name="concern" value="reading" <%=list.contains("reading")?"checked":""%> disabled/> 
            독서
         </label>
         <label class="form-check-label">
            <input class="form-check-input" type="checkbox" name="concern" value="game" <%=list.contains("game")?"checked":""%> disabled/> 
            게임
         </label>
         <label class="form-check-label">
            <input class="form-check-input" type="checkbox" name="concern" value="cooking" <%=list.contains("cooking")?"checked":""%> disabled/> 
            요리
         </label>
      </fieldset>
   </div>
   <div class="mb-3">
      <fieldset>
         <legend>성별 체크</legend>
         <label class="form-check-label">
            <input class="form-check-input" type="radio" name="gender" value="man"<%=gender.equals("man")?"checked":""%> disabled/>
            남자
         </label>
         <label class="form-check-label">
            <input class="form-check-input" type="radio" name="gender" value="woman"<%=gender.equals("woman")?"checked":""%> disabled/>
            여자
         </label>
      </fieldset>
   </div>
</div>
</body>
</html>