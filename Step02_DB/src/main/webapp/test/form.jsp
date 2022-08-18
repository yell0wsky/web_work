<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/form.jsp</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<style>
   form legend{
      font-size: 1rem;
   }
</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 animate__animated animate__fadeInUp">
				<h1>테스트 폼 입니다.</h1>
				<form action="signup.jsp" method="post">
					<div class="form-floating mb-3">
						<input class="form-control" type="text" name="email" id="email"
							placeholder="email adress"> <label for="email">이메일을
							입력하세요.</label>
					</div>
					<div class="form-floating mb-3">
						<textarea class="form-control" name="comment" id="comment"
							placeholder="Leave a comment here"></textarea>
						<label for="comment">할말을 입력하세요.</label>
					</div>
					<div class="form-floating mb-3">
						<select class="form-select" name="job" id="job">
							<option value="">선택</option>
							<option value="programmer">프로그래머</option>
							<option value="teacher">선생님</option>
							<option value="doctor">의사</option>
							<option value="etc">기타</option>
						</select> <label for="job">직업을 선택하세요</label>
					</div>
					<div class=mb-3>
						<fieldset>
							<legend>관심사 체크</legend>
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="concern"
								value="reading" checked/> 독서
							</label> <label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="concern"
								value="game" /> 게임
							</label> <label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="concern"
								value="cooking" /> 요리
							</label>
						</fieldset>
					</div>
					<div class=mb-3>
						<fieldset>
							<legend>성별 체크</legend>
							<label class="form-check-label"> <input
								class="form-check-input" type="radio" name="gender" value="man" checked/>
								남자
							</label> <label class="form-check-label"> <input
								class="form-check-input" type="radio" name="gender"
								value="woman" /> 여자
							</label>
						</fieldset>
					</div>
					<button id="submitBtn" class="btn btn-primary" type="submit">전송</button>
				</form>
			</div>
		</div>
	</div>
	<script>
	//특정 요소에 이벤트가 발생했을때 실행할 함수 등록
	document.querySelector(#submitBtn).addEventListener("mouseover", function(){
		//원하는 애니메이션 클래스를 추가해서 애니메이션을 동작 시킨다.
		this.classList.add("animate__animated");
		this.classList.add("animated__flash);
	});
	//특정 요소에 애니메이션이 끝나는 이벤트가 발생했을때 실행할 함수 등록
	document.querySelector(#submitBtn).addEventListener("animationend", function(){
		//추가했던 클래스를 제거해야지만 다음번에 클래스를 추가했을 때 또 애니메이션이 동작한다.
		this.classList.remove("animate__animated");
		this.classList.remove("animated__flash");
	})
	</script>
</body>
</html>