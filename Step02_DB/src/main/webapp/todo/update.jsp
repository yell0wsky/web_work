<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. 폼전송되는 수정할 할일의 번호와 내용을 읽어와서
   request.setCharacterEncoding("utf-8");
   int num=Integer.parseInt(request.getParameter("num"));
   String content=request.getParameter("content");
   //2. DB 에 수정 반영하고
   TodoDto dto=new TodoDto();
   dto.setNum(num);
   dto.setContent(content);
   boolean isSuccess=TodoDao.getInstance().update(dto);
   //3. 응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
   <%if(isSuccess){ %>
      <div class="modal" tabindex="-1" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">알림</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <p>할일을 성공적으로 수정 했습니다.</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-success" data-bs-dismiss="modal">확인</button>
            </div>
          </div>
        </div>
      </div>
      <script>
         //띄울 Modal 의 참조값(bootstrap 의 기능을 사용할수 있는) 얻어와서 
         const myModal = new bootstrap.Modal('#myModal');
         //Modal 을 함수를 호출해서 강제로 띄우기 
         myModal.show();
         
         //모달이 숨겨 졌을때 실행할 함수 등록하고 (모달이 숨겨지면 "hidden.bs.modal" 이벤트 발생)
         document.querySelector("#myModal")
         .addEventListener("hidden.bs.modal", function(){
            //모달이 숨겨지면 할일 목록 보기로 이동
            location.href="list.jsp";
         });
      </script>
   <%}else{ %>
      <h1>알림</h1>
      <p class="alert alert-danger">
         할일 수정 실패! <a class="alert-link" href="updateform.jsp?num=<%=num%>">다시 시도</a>
      </p>
   <%} %>
</div>
</body>
</html>