<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파일을 저장할 서버에서의 실제 경로 구성하기
	String realPath=application.getRealPath("/upload");
	//2. 아래의 MultipartRequest 객체가 예외 없이 잘 생성되면 webapp/upload 폴더에 파일이 자동으로 저장된다.
	MultipartRequest mr=new MultipartRequest(request,
			realPath,     //업로드된 파일을 저장할 경로 
			1024*1024*50, //최대 업로드 사이즈
			"utf-8",      //한글 파일명 깨지지 않도록 
			new DefaultFileRenamePolicy());
	
	//3. MultipartRequest 객체의 메소드를 이용해서 폼전송된 내용을 추출해야 한다.
	String msg=mr.getParameter("msg");
	String orgFileName=mr.getOriginalFileName("myFile");//원본 파일명
	String saveFileName=mr.getFilesystemName("myFile");//저장된 파일명
	long fileSize=mr.getFile("myFile").length();//파일의 크기 	
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/upload2.jsp</title>
</head>
<body>
	<p>
		upload 폴더의 실제 경로 : <strong><%=realPath %></strong>
	</p>
	<p>
		할말 : <strong><%=msg %></strong>
	</p>
	<p>
		원본 파일명 : <strong><%=orgFileName %></strong>
	</p>
	<p>
		저장된 파일명: <strong><%=saveFileName %></strong>
	</p>
	<p>
		파일의 크기 : <strong><%=fileSize %></strong> byte
	</p>
	<img src="${pageContext.request.contextPath }/upload/<%=saveFileName%>"/>
</body>
</html>













