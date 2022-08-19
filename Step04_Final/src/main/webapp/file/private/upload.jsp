<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// /test/upload.jsp 파일을 참고해서 아래의 작업을 자알~~ 해 보세요 
	
	//1. 폼 전송되는 파일을 webapp/upload 폴더에 저장한다.
	String realPath=application.getRealPath("/upload");
	//해당 경로를 access 할수 있는 파일 객체 생성
	File f=new File(realPath);
	if(!f.exists()){ //만일  폴더가 존재 하지 않으면
		f.mkdir(); //upload 폴더 만들기 
	}
	MultipartRequest mr=new MultipartRequest(request,
			realPath,     //업로드된 파일을 저장할 경로 
			1024*1024*50, //최대 업로드 사이즈
			"utf-8",      //한글 파일명 깨지지 않도록 
			new DefaultFileRenamePolicy());
	//2. 폼 전송되는 title 을 읽어온다.
	String title=mr.getParameter("title");
	//3. 파일의 작성자(업로더)는 HttpSession 객체에서 읽어온다.
	String writer=(String)session.getAttribute("id");
	//4. 추가로 원본파일명, 저장된파일명, 파일사이즈도 얻어내서 FileDto 객체에 담아서 
	String orgFileName=mr.getOriginalFileName("myFile");
	String saveFileName=mr.getFilesystemName("myFile");
	long fileSize=mr.getFile("myFile").length();
	//업로드된 파일의 정보를 FileDto 에 담고
	FileDto dto=new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);
	//5. FileDao 객체를 이용해서 DB 에 저장하고 
	boolean isSuccess=FileDao.getInstance().insert(dto);
	//6. 응답한다. 
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p>
			<%=writer %> 님이 업로드한 <%=orgFileName %> 파일을 저장했습니다.
			<a href="${pageContext.request.contextPath }/file/list.jsp">목록보기</a>
		</p>
	<%}else{ %>
		<p>
			업로드 실패!
			<a href="upload_form.jsp">다시 시도</a>
		</p>
	<%} %>
</body>
</html>


