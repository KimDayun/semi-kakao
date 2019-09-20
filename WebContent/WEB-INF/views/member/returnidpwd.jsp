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

label {
	margin-top: 22px;
}
</style>
</head>

<body>
	<%@ include file="../common/navigation.jsp"%>
	<div class="container text-center">
		<div class="row">
			<div class="well">
	            <form class="form-horizontal" method="post" action="findidbyemail.kakao">
	                <div class="form-group">
	                	<c:if test="${find eq 'id' }">
		                    <span>당신의 아이디는 <strong>${id }</strong> 입니다.</span>
	                	</c:if>
	                	<c:if test="${find eq 'pwd' }">
		                    <span>당신의 새 비밀번호는 <strong>${pwd }</strong> 입니다.</span>
	                	</c:if>
	                </div>
	                <a href="loginform.kakao"><input type="button" class="btn btn-primary" style="width: 10%;" value="로그인하기" /></a>
	            </form>
	        </div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>