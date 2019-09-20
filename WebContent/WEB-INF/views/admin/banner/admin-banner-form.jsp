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
					<form method="post" action="add.kakao" enctype="multipart/form-data" onsubmit="checkValue(event)">
						<input type="hidden" value="${param.pno }" name="pno">
						<div class="form-group">
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-jagan admin-line-height">배너타이틀</label>
								</div>
								<div class="col-xs-11">
									<input type="text" class="form-control" name="bannerTitle" id="bannerTitle"/>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-jagan admin-line-height">서브타이틀</label>
								</div>
								<div class="col-xs-11">
									<input type="text" class="form-control" name="bannerSubTitle" id="bannerSubTitle"/>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-jagan admin-line-height">상&nbsp;품</label>
								</div>
								<div class="col-xs-4">
									<!-- <input type="text" class="form-control" name="productNo"/> -->
									<select class="form-control" name="productNo" id="productNo">
										<option value="">-----------------------------선택-----------------------------</option>
										<c:forEach var="pro" items="${products }">
											<option value="${pro.no }">${pro.no } - ${pro.name }</option>
										</c:forEach>
									</select>
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
								    <input type="checkbox" name="bannerDispalyYn" value="Y"/>
								</div>
								<div class="col-xs-1 admin-padding">
									<label >노출순서</label>
								</div>
								<div class="col-xs-1">
									<input type="text" class="form-control admin-margin-buttom" name="bannerPriority" id="bannerPriority"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>이&nbsp;&nbsp;미&nbsp;&nbsp;지</label>
								</div>
								<div class="col-xs-11">
								    <input type="file" name="bannerFile" id="bannerFile"/>
                                    
								</div>
							</div>
						</div>
						
						<div class="text-right">
							<input type="submit" class="btn btn-warning" value="등록"/>
							<a href="list.kakao?pno=${param.pno}" class="btn btn-default">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function checkValue(event){
			
			var titleBn = document.getElementById("bannerTitle").value;
			if(titleBn == ""){
				alert("배너타이틀을 입력해주세요");
				event.preventDefault();
				return false;
			}
			
			var subTitleBn = document.getElementById("bannerSubTitle").value;
			if(subTitleBn == ""){
				alert("서브타이틀을 입력해주세요")
				event.preventDefault();
				return false;
			}
			var proBn = document.getElementById("productNo").value;
			if(proBn == ""){
				alert("상품을 정해주세요")
				event.preventDefault();
				return false;
			}
			var priorityBn = document.getElementById("bannerPriority").value;
			if(priorityBn == ""){
				alert("노출순서를 입력해주세요")
				event.preventDefault();
				return false;
			}
			var fileBn = document.getElementById("bannerFile").value;
			if(fileBn == ""){
				alert("이미지를 넣어주세요")
				event.preventDefault();
				return false;
			}
		}
	</script>
</body>
</html>