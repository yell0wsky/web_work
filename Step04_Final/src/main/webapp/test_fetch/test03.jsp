<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_fetch/test03.jsp</title>
</head>
<body>
	<h1>gura_util.js 를 활용해서 폼전송</h1>
	<form action="insert.jsp" method="post" id="myForm">
		<input type="text" name="name" placeholder="이름..."/>
		<input type="text" name="addr" placeholder="주소..."/>
		<button type="submit">추가</button>
	</form>
	<br />
	<button id="sendBtn">전송하기</button>
	<br />
	<input type="text" name="name" placeholder="이름..." id="inputName"/>
	<button id="sendBtn2">전송</button>
	
	<!-- 외부 javascript 로딩 -->
	<script src="js/gura_util.js"></script>
	<script>
	
		document.querySelector("#sendBtn2").addEventListener("click", ()=>{
			//input 요소의 참조값
			const input=document.querySelector("#inputName");
			ajaxInputPromise("insert.jsp", input)
			.then(res => res.json())
			.then((data)=>{
				console.log(data);
			});
		});
	
		document.querySelector("#myForm").addEventListener("submit", (e)=>{
			//폼 전송 막기 
			e.preventDefault();
			//ajax 전송할 폼의 참조값
			const form=document.querySelector("#myForm");
			
			ajaxFormPromise(form)
			.then((res)=>{
				return res.json();
			})
			.then((data)=>{
				console.log(data);
			});
			
		});
		
		document.querySelector("#sendBtn").addEventListener("click", ()=>{
			//서버에 전송할 정보가 object 안에 있을때
			//const data={name:"원숭이", addr:"동물원"};
			//서버에 전송할 정보가 query string 안에 있을때
			const data="name=원숭이&addr=동물원";
			
			ajaxPromise("insert.jsp", "post", data)
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












