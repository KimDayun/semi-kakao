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
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<c:set var="menu" value="store" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">매장등록</h1>
				<form action="deleteStore.kakao">
					<input type="hidden" value="${param.pno }" name="pno"/>
					<table class="table table-hover">
						<colgroup>
							<col width="1%">
							<col width="4%">
							<col width="15%">
							<col width="5%">
							<col width="40%">
							<col width="10%">
							<col width="20%">
							<col width="5%">
						</colgroup>
						<thead>
							<tr>
								<th class="admin-check"></th>
								<th class="text-center">매장번호</th>
								<th class="text-center">매장명</th>
								<th class="text-center">도시</th>
								<th class="text-center">주소</th>
								<th class="text-center">전화번호</th>
								<th class="text-center">영업시간</th>
								<th class="text-center">영업여부</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty stores }">
									<c:forEach var="store" items="${stores }">
										<tr>
											<td class="text-center"><input type="checkbox" name="storeCheck" value="${store.no }"></td>
											<td class="text-center">${store.no }</td>
											<td class="text-center"><a href="detail.kakao?pno=${param.pno }&no=${store.no }">${store.name }</a></td>
											<td class="text-center">${store.city}</td>
											<td class="text-left">${store.address}</td>
											<td class="text-center">${store.phone}</td>
											<td class="text-center">${store.businessHours}</td>
											<td class="text-center">${store.displayYn}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center">조회된 글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>


						</tbody>
					</table>

					<div class="text-right">
						<input type="submit" class="btn btn-default" value="삭제" />
						<a href="form.kakao?pno=${param.pno }" class="btn btn-default">등록</a>
					</div>
				</form>
				<div class="text-center">
					<ul class="pagination">
						<c:choose>
							<c:when test="${pno == 1 }">
								<li><a href="">&laquo;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="list.kakao?pno=${pno-1 }">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="a" begin="${pageBegin}" end="${pageEnd > totalPage ? totalPage : pageEnd}">
							<%-- <li class="${pno == a ? "active":""}"><a href="list.kakao?pno=${a }">${a }</a></li> --%>
							<li class="active"><a href="list.kakao?pno=1">1</a></li>
						</c:forEach>
						<c:choose>
							<c:when test="${pno == totalPage }">
								<li><a href="">&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="list.kakao?pno=${pno+1 }">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>