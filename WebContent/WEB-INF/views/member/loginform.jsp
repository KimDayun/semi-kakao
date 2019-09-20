<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>KAKAO FRIENDS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<style>
.container {
	width: 720px;
}

div {
	margin: 20px;
}
</style>
</head>

<body>
	<%@ include file="../common/navigation.jsp"%>
	<div class="container text-center">
		<c:if test="${not empty param.result && param.result eq 'fail'}">
			<div class="alert alert-danger">
				<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
			</div>
		</c:if>
		<c:if test="${not empty param.result && param.result eq 'deny'}">
			<div class="alert alert-danger">
				<strong>서비스 거부</strong> 로그인 후 사용가능합니다.
			</div>
		</c:if>
		<div class="row">
			<form method="post" action="login.kakao" onsubmit="checkField(event);">
				<div class="input-group">
					<span class="input-group-addon glyphicon glyphicon-user" id="basic-addon1"></span>
					<input type="text" id="user-id" name="userid" class="form-control" placeholder="아이디" aria-describedby="basic-addon1">
				</div>
				<div class="input-group">
					<span class="input-group-addon glyphicon glyphicon-lock" id="basic-addon1"></span>
					<input type="password" id="user-pwd" name="userpwd" class="form-control" placeholder="비밀번호(영문 숫자를 사용한 8자 이상)" aria-describedby="basic-addon1">
				</div>
				<div style="float: right;">
					<a href="findidpwd.kakao?find=id"><span>아이디 찾기</span></a> /
					<a href="findidpwd.kakao?find=pwd"><span>비밀번호 찾기</span></a><br>
				</div>
				<div>
					<input class="btn btn-primary" type="submit" value="로그인">
				</div>
			</form>
			<div>
				<a href="joinform.kakao"><input class="btn btn-default" type="submit" name="" value="회원가입"></a>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function checkField(e) {
			// 특정 태그에서 특정 이벤트 발생 시 수행되는 기본동작의 발현을 방해한다.
			var userid = document.getElementById("user-id").value;
			var userpwd = document.getElementById("user-pwd").value;
			
			if(userid == "") {
				alert("아이디는 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			
			if(userpwd == "") {
				alert("비밀번호는 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
		}
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>