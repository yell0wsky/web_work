<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test01.jsp</title>
</head>
<body>
	<h1>비동기 테스트</h1>
	<script>
	
		//가상의 주어진 작업을 처리 하는 함수 (주어진 작업을 처리하는데  random 한 시간이 걸린다고 가정하자)
		function work(job, callback){
			
			//0 ~ 5000 사이의 랜덤한 숫자 얻어내기
			let ranTime=Math.random()*5000;
			
			// 첫번째 인자로 전달된 함수를 random 한 이후에 호출하기 
			setTimeout(function(){
				console.log(job+" 을(를) 수행 했습니다.");
				callback();
			}, ranTime);
			
		}
		
		/*
		work("달리기", function(){
			work("쉬기", function(){
				work("잠자기", function(){
					
				});
			});
		});
		*/

		//1. Promise 객체를 생성해서 참조값을 p1 에 담기
		let p1=new Promise(function(resolve){
			/*
				함수의 인자로 전달되는 resolve는 함수이다.
				resolve 는 작업을 완료 했을때 호출 해야하는 함수
				resolve 함수가 호출되면 .then() 안에 있는 함수가 자동 호출된다.
			*/
			resolve();
		});
		
		p1.then(function(){
			console.log("then 안에 있는 함수가 호출되었습니다.");
		});
		
	</script>
</body>
</html>













