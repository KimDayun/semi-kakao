<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/kakao/test/css/kakao-admin.css">
<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
		<c:set var="menu" value="qna" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">문의현황</h1>
				<div class="well">
					<form method="post" action="addReply.kakao">
						<input type="hidden" value=${qna.no } name="qnaNo">
						<input type="hidden" value=${param.pno } name="qnaPno">
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>번호</label>
								</div>
								<div class="col-xs-11">${qna.no }</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>제목</label>
								</div>
								<div class="col-xs-7">
									${qna.title }
								</div>
								<div class="col-xs-1">
									<label>분류</label>
								</div>
								<div class="col-xs-3">
									${qna.category }
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>등록일</label>
								</div>
								<div class="col-xs-3">
									<fmt:formatDate value="${qna.createDate }" pattern="yyyy년MM월dd일  HH:mm:ss"/>
								</div>
								<div class="col-xs-1">
									<label>질문자</label>
								</div>
								<div class="col-xs-3">
									${qna.member.name }
								</div>
								<div class="col-xs-1">
									<label>답변여부</label>
								</div>
								<div class="col-xs-3">
									${qna.statusYn }
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>내용</label>
								</div>
								<div class="col-xs-11">
									<textarea class="form-control" rows="10" name="question" readonly>${qna.contents }</textarea>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>답변</label>
								</div>
								<div class="col-xs-11">
									<textarea class="form-control" rows="10" name="answer">${reply.contents }</textarea>
								</div>
							</div>
						</div>
						<div class="text-right">
							<input type="submit" class="btn btn-warning" value="등록">
							<a href="list.kakao?pno=${param.pno }" class="btn btn-default">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>