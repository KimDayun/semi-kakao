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
    <link rel="stylesheet" href="/kakao/test/admin/css/kakao-admin.css">
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    </head>
	<style>
  	 	 .admin-line-height{line-height: 40px;}
  	 	 .admin-margin-buttom{margin-bottom: 10px;}
  	 	 .admin-jagan{letter-spacing:-1.2px;}
  	 	 .admin-padding{padding-top: 10px;}
	</style>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
		<c:set var="menu" value="banner" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">배너관리</h1>
				<div class="well">
					<form>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>번&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;호</label>
								</div>
								<div class="col-xs-11">${banner.no }</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-jagan admin-line-height">배너타이틀</label>
								</div>
								<div class="col-xs-11">
									<input type="text" class="form-control" name="title" value="${banner.title }" readonly/>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-jagan admin-line-height">서브타이틀</label>
								</div>
								<div class="col-xs-11">
									<input type="text" class="form-control" name="title" value="${banner.subTitle }" readonly/>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-jagan admin-line-height">상&nbsp;품</label>
								</div>
								<div class="col-xs-4">
									<%-- <input type="text" class="form-control" name="title" value="${banner.product.no }" readonly/> --%>
									<select class="form-control" name="productNo" disabled>
										<c:forEach var="pro" items="${products }">
											<option value="${pro.no }" ${pro.no == banner.product.no ? 'selected' : '' }>${pro.no } - ${pro.name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-xs-1">
									<label class="admin-jagan admin-line-height">상품이름</label>
								</div>
								<div class="col-xs-3">
									<input type="text" class="form-control" name="title" value="${banner.productName }" readonly/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									
								</div>
								<div class="col-xs-1 admin-padding">
                                    <label>표시여부</label>
								</div>
								<div class="col-xs-1 admin-padding">
								    <input type="checkbox" name="dispalyYn" value=${banner.displayYn } ${banner.displayYn eq "Y" ? "checked" : ""}/>
								</div>
								<div class="col-xs-1 admin-padding">
									<label >노출순서</label>
								</div>
								<div class="col-xs-1">
									<input type="text" class="form-control admin-margin-buttom" name="priority" value="${banner.priority }" readonly/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>이&nbsp;&nbsp;미&nbsp;&nbsp;지</label>
								</div>
								<div class="col-xs-11">
								    <a href="/kakao/test/image/${banner.imgName }" target="_blank">${banner.imgName }</a>
                                    
								</div>
							</div>
						</div>
						<div class="text-right">
							<a href="updateForm.kakao?pno=${param.pno}&no=${banner.no}" class="btn btn-warning">수정</a>
							<a href="delete.kakao?pno=${param.pno}&no=${banner.no}" class="btn btn-default">삭제</a>
							<a href="list.kakao?pno=${param.pno}" class="btn btn-default">취소</a>
						</div>
					</form>
				</div>
			
			</div>
		</div>
	</div>
</body>
</html>