<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/upload_form2.jsp</title>
</head>
<body>
	<h1>이미지 업로드 예제</h1>
	<form action="upload2.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="msg" placeholder="메세지 입력..."/>
		<br />
		<input type="file" name="myFile" id="myFile" accept=".jpg, .png, .gif"/>
		<br />
		<button type="submit">업로드</button>
	</form>
</body>
</html>