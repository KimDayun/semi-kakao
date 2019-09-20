<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../bootstrap-3.3.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/kakao-admin.css">
    <script src="../../bootstrap-3.3.2-dist/js/jquery.min.js"></script>
    <script src="../../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">문의현황</h1>
				<div class="well">
					<form>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>번호</label>
								</div>
								<div class="col-xs-11">1</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>제목</label>
								</div>
								<div class="col-xs-11">
									이거 왜이런가요?
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>등록일</label>
								</div>
								<div class="col-xs-3">
									2019-05-20
								</div>
								<div class="col-xs-1">
									<label>답변여부</label>
								</div>
								<div class="col-xs-3">
									N
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>내용</label>
								</div>
								<div class="col-xs-11">
									<textarea class="form-control" rows="10" name="question" readonly>상품이 너무 안좋네요</textarea>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>답변</label>
								</div>
								<div class="col-xs-11">
									<textarea class="form-control" rows="10" name="answer"></textarea>
								</div>
							</div>
						</div>
						<div class="text-right">
							<input type="submit" class="btn btn-warning" value="등록">
							<a href="admin-qna-list.jsp" class="btn btn-default">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>