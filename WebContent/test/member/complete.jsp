<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="../bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
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
	<div class="container">
		<div class="jumbotron">
			<h1>회원가입이 완료되었습니다.</h1>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>