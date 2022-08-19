<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/popup_page2.jsp</title>
<style>
	body{
		background-color: yellow;
	}
</style>
</head>
<body>
<h3>팝업된 페이지 입니다.</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam eos eius nemo ducimus quam totam dignissimos qui aperiam distinctio maxime dolore maiores optio ad. Quaerat itaque quod architecto sint voluptatum.</p>
<form action="popup_save.jsp" method="post">
	<label>
		<input type="checkbox" name="canPopup" value="no" />
		1 분 동안 팝업 띄우지 않기
	</label>
	<button type="submit">닫기</button>
</form>
<br />
<input type="text" id="msg" placeholder="부모창에 전달할 문자열 입력..."/>
<button id="sendBtn">전달</button>
<script>
	document.querySelector("#sendBtn").addEventListener("click", function(){
		//입력한 문자열을 읽어와서 
		let msg=document.querySelector("#msg").value;
		//부모창의 javascript 함수를 호출하면서 전달한다.
		window.opener.sendMsg(msg);
	});
</script>
</body>
</html>










