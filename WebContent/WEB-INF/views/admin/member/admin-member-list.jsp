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
		<c:set var="menu" value="member" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">회원관리</h1>
				<form action="listDelete.kakao">
				<input type="hidden" name="pno" value="${pno }">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="admin-check"></th>
								<th class="text-center">회원번호</th>
								<th class="text-center">아이디</th>
								<th class="text-center">이름</th>
								<th class="text-center">포인트</th>
								<th class="text-center">구매건수</th>
								<th class="text-center">구매금액</th>
								<th class="text-center">회원가입일</th>
								<th class="text-center">탈퇴여부</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty members}">
								<c:forEach var = "member" items="${members }">
									<tr>
										<td class="text-center"><input type="checkbox" name="memberNo" value="${member.no }"></td>
										<td class="text-center">${member.no }</td>
										<td class="text-center"><a href="detail.kakao?pno=${pno}&no=${member.no }">${member.id }</a></td>
										<td class="text-center">${member.name }</td>
										<td class="text-center">${member.point }</td>
										<td class="text-center">${member.orderCount }</td>
										<td class="text-center">${member.totalBuyPrice }</td>
										<td class="text-center"><fmt:formatDate value="${member.createDate }" pattern="yyyy-MM-dd"/> </td>
										<td class="text-center">${member.usedYn }</td>
									</tr>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<td colspan="9" class="text-center">조회된 회원이 없습니다.</td>
							</c:otherwise>
						</c:choose>
							

						</tbody>
					</table>

					<div class="text-right">
						<button type="submit" class="btn btn-default">사용여부변경</button>
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
						<li class="${pno == a ? "active":""}"><a href="list.kakao?pno=${a }">${a }</a></li>
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