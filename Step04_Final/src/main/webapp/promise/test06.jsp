<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test06.jsp</title>
</head>
<body>
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
		
		new Promise(function(resolve){
			//첫번째 작업을 한다.
			work("달리기", resolve);
		})
		.then(function(){
			return new Promise(function(resolve){
				work("쉬기", resolve);
			});
		})
		.then(function(){
			return new Promise(function(resolve){
				work("잠자기", resolve);
			});
		})
		.then(function(){
			console.log("모든 작업을 순서대로 잘 처리 했습니다.");
		});
	</script>
</body>
</html>












