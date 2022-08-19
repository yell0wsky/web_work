<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_fetch/test02.jsp</title>
</head>
<body>
	<h1>폼 테스트</h1>
	<form action="insert.jsp" method="post" id="myForm">
		<input type="text" name="name" placeholder="이름..."/>
		<input type="text" name="addr" placeholder="주소..."/>
		<button type="submit">추가</button>
	</form>
	
	<h1>폼 테스트2</h1>
	<form action="insert.jsp" method="get" id="myForm2">
		<input type="text" name="name" placeholder="이름..."/>
		<input type="text" name="addr" placeholder="주소..."/>
		<button type="submit">추가</button>
	</form>
	
	<script>
		document.querySelector("#myForm").addEventListener("submit", (e)=>{
			//폼 제출 막기(페이지 전환 막기)
			e.preventDefault();
			
			//폼에 입력한 내용을 전송할 query 문자열로 만들기
			const form=document.querySelector("#myForm"); //폼의 참조값
			const qs=new URLSearchParams(new FormData(form)).toString(); //query string
			
			//페이지 전환 없이 post 방식으로 insert.jsp 페이지로 전송하기 
			fetch("insert.jsp", {
				method:"POST",
				headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
				body:qs
			})
			.then((res)=>{
				return res.json();
			})
			.then((data)=>{
				console.log(data);
			});
			
		});
		
		document.querySelector("#myForm2").addEventListener("submit", (e)=>{
			//폼 제출 막기(페이지 전환 막기)
			e.preventDefault();
			
			//폼에 입력한 내용을 전송할 query 문자열로 만들기
			const form=document.querySelector("#myForm"); //폼의 참조값
			const qs=new URLSearchParams(new FormData(form)).toString(); //query string
			
			//페이지 전환 없이 get 방식으로 insert.jsp 페이지로 전송하기 
			fetch("insert.jsp?"+qs)
			.then((res)=>{
				return res.json();
			})
			.then((data)=>{
				console.log(data);
			});
			
		});
	</script>
</body>
</html>










