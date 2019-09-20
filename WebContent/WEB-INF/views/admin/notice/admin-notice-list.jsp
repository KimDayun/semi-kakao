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
			<c:set var="menu" value="notice" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">공지사항</h1>
				<form action="listDelete.kakao">
					<input type="hidden" value="${pno }" name="pno"/>
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="admin-check"></th>
								<th class="text-center">번호</th>
								<th class="text-center">분류</th>
								<th class="text-center">제목</th>
								<th class="text-center">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty notices }">
									<c:forEach var="notice" items="${notices }">
										<tr>
											<td class="text-center"><input type="checkbox" name="noticeNo" value="${notice.no }"></td>
											<td class="text-center">${notice.no }</td>
											<td class="text-center">${notice.category }</td>
											<td class="text-center"><a href="detail.kakao?pno=${pno }&no=${notice.no }">${notice.title }</a></td>
											<td class="text-center"><fmt:formatDate
													value="${notice.createDate }" pattern="yyyy-MM-dd" /></td>
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
						<button type="submit" href="" class="btn btn-default" >삭제</button> 
						<a href="form.kakao?pno=${pno }" class="btn btn-default">등록</a>
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
	<script type="text/javascript">
		
	</script>
</body>
</html>