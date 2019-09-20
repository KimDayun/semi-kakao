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
		<c:if test="${result eq 'fail'}">
			<div class="alert alert-danger">
				<span>이름 혹은 이메일이 올바르지 않습니다.</span>
			</div>
		</c:if>
		<div class="row">
			<div class="well">
				<form class="form-horizontal" method="post"
					action="findidpwdbyemail.kakao">
					<c:if test="${find eq 'id' }">
						<input type="hidden" name="find" value="id" />
					</c:if>
					<c:if test="${find eq 'pwd' }">
						<input type="hidden" name="find" value="pwd" />
					</c:if>
					<c:if test="${param.result eq 'fail'}">
						<div class="alert alert-danger">이름 혹은 이메일이 올바르지 않습니다.</div>
					</c:if>
					<div class="form-group">
						<label class="col-xs-2 control-label">이름</label>
						<div class="col-xs-8">
							<input type="text" class="form-control" name="username" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 control-label">이메일</label>
						<div class="col-xs-8">
							<input type="text" class="form-control" name="useremail" />
						</div>
					</div>
					<input type="submit" class="btn btn-primary" style="width: 10%;"
						value="확인" />
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>