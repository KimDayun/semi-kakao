<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/kakao/test/css/kakao-admin.css">
<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<style>
	.admin-line-height1{line-height: 37px;}
	.admin-line-height2{line-height: 40px;}
</style>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
		<c:set var="menu" value="notice"/>
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">공지사항</h1>
				<div class="well">
					<form method="post" action="update.kakao" onsubmit="checkValue(event)">
						<div class="form-group">
						<input type=hidden value="${pno }" name="pno"/>
							<div class="row" >
								<div class="col-xs-1">
									<label>번호</label>
								</div>
								<div class="col-xs-11">${notice.no }</div>
								<input type = "hidden" value="${notice.no }" name="no"/>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-line-height1">제목</label>
								</div>
								<div class="col-xs-11">
									<input type="text" class="form-control" name="title" value="${notice.title }" id="title"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-line-height2">분류</label>
								</div>
								<div class="col-xs-3">
									<select class="form-control" name="category" id="category" >
										<option value="${notice.category }" >${notice.category }</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>내용</label>
								</div>
								<div class="col-xs-11">
									<textarea class="form-control" rows="10" name="contents" id="contents">${notice.contents }</textarea>
								</div>
							</div>
						</div>
						<div class="text-right">
							<input type="submit" class="btn btn-warning" value="수정">
							<%-- <a href="update.kakao?no=${notice.no }" class="btn btn-default">수정</a> --%>
							<a href="list.kakao?pno=${pno }" class="btn btn-default">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function checkValue(event){
			
			var titleNt = document.getElementById("title").value;
			console.log(titleNt);
			if(titleNt == ""){
				alert("제목을 입력해주세요");
				event.preventDefault();
				return false;
			}
			
			var categoryNt = document.getElementById("category").value;
			if(categoryNt == ""){
				alert("카테고리를 정해주세요")
				event.preventDefault();
				return false;
			}
			var contentsNT = document.getElementById("contents").value;
			if(contentsNT == ""){
				alert("내용을 정해주세요")
				event.preventDefault();
				return false;
			}
		}
	</script>
</body>
</html>