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
<style>
.text-center {
	vertical-align: middle !important;
}

.admin-line-height {
	padding-top: 18px
}
</style>
</head>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<c:set var="menu" value="banner" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<form class="form-inline" action="list.kakao" id="list-form">
			<input type="hidden" name="pno" id="page-no">
			<input type="hidden" name="pageNo" value="${param.pno }">
				<div class="container">
					<div class=row>
						<div class="col-xs-6">
							<h1 class="admin-buttom">배너관리</h1>
						</div>
						<div class="col-xs-6 text-right admin-line-height">
							<div>
								<select class="form-control" name="size" onchange="sendform(1);">
									<option value="5" ${param.size eq 5 ? "selected" : "" }> 5개씩</option>
									<option value="10" ${param.size eq 10 ? "selected" : "" }> 10개씩</option>
									<option value="20" ${param.size eq 20 ? "selected" : "" }> 20개씩</option>
								</select>
								<select class="form-control pull-right" style="width: 150px"name="sort" onchange="sendform(1);">
									<option value="NEW" ${param.sort eq 'NEW' ? "selected" : "" }>최신순</option>
									<option value="OLD" ${param.sort eq 'OLD' ? "selected" : "" }>오래된순</option>
									<option value="PRIORITY"${param.sort eq 'PRIORITY' ? "selected" : "" }>우선순</option>
								</select>
							</div>
						</div>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="admin-check"></th>
								<th class="text-center">번호</th>
								<th class="text-center">배너타이틀</th>
								<th class="text-center">서브타이틀</th>
								<th class="text-center">상품명</th>
								<th class="text-center">표시여부</th>
								<th class="text-center">노출순서</th>
								<th class="text-center">이미지</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty banners }">
									<c:forEach var="banner" items="${banners }">
										<tr>
											<td class="text-center"><input type="checkbox" name="bannerNo" value="${banner.no }"></td>
											<td class="text-center">${banner.no }</td>
											<td class="text-center"><a href="detail.kakao?pno=${param.pno }&no=${banner.no}">${banner.title }</a></td>
											<td class="text-center">${banner.subTitle }</td>
											<td class="text-center">${banner.productName }</td>
											<td class="text-center">${banner.displayYn }</td>
											<td class="text-center">${banner.priority }</td>
											<td class="text-center"><img
												src="/kakao/test/image/${banner.imgName }" height="110"></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8" class="text-center">조회된 글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>


					<div class="text-right">
						<input type="submit" onclick="chageSubmit('listUpdate.kakao');" value="노출여부 변경" class="btn btn-default">
						<input type="submit" onclick="chageSubmit('listDelete.kakao');" value="삭제" class="btn btn-default">
						<a href="form.kakao?pno=${param.pno }" class="btn btn-warning">등록</a>
					</div>
					<div class="text-center">
						<ul class="pagination">
							<c:choose>
								<c:when test="${not pagination.first }">
									<li><a href="" onclick="goPage(event, ${pagination.page - 1})">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#">&laquo;</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="num" begin="${pagination.begin }"
								end="${pagination.end }">
								<c:choose>
									<c:when test="${num eq pagination.page }">
										<li class="active"><a href="#"
											onclick="goPage(event, ${num})">${num }</a>
									</c:when>
									<c:otherwise>
										<li><a href="#" onclick="goPage(event, ${num})">${num }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${not pagination.last }">
									<li><a href="" onclick="goPage(event, ${pagination.page + 1})">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<script type="text/javascript">
	function sendform(pno){
		document.getElementById("page-no").value = pno;
		document.getElementById("list-form").submit();
	}
	
	function goPage(event, pno){
		event.preventDefault();
		sendform(pno);
	}
	
	function chageSubmit(str){
		document.getElementById("list-form").setAttribute("action", str);
	}
	
</script>
</html>