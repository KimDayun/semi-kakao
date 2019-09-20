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
<style type="text/css">
	.admin-line-height {
		padding-top: 18px
	}
</style>
</head>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<c:set var="menu" value="qna" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<form class="form-inline" action="list.kakao" id="list-form">
				<input type="hidden" name="pno" id="page-no"> <input
					type="hidden" name="pageNo" value="${param.pno }">
				<div class="container">
					<div class=row>
						<div class="col-xs-6">
							<h1 class="admin-buttom">문의현황</h1>
						</div>
						<div class="col-xs-6 text-right admin-line-height">
							<div>
								<select class="form-control" name="size" onchange="sendform(1);">
									<option value="10" ${param.size eq 10 ? "selected" : "" }> 10개씩</option>
									<option value="20" ${param.size eq 20 ? "selected" : "" }> 20개씩</option>
									<option value="50" ${param.size eq 50 ? "selected" : "" }> 50개씩</option>
									<option value="100" ${param.size eq 100 ? "selected" : "" }> 100개씩</option>
								</select>
								<select class="form-control pull-right" style="width: 150px"name="sort" onchange="sendform(1);">
									<option value="ALLNEW" ${param.sort eq 'ALLNEW' ? "selected" : "" }>전체 최신순</option>
									<option value="ALLOLD" ${param.sort eq 'ALLOLD' ? "selected" : "" }>전체 오래된순</option>
									<option value="NNEW" ${param.sort eq 'NNEW' ? "selected" : "" }>미답변 최신순</option>
									<option value="NOLD" ${param.sort eq 'NOLD' ? "selected" : "" }>미답변 오래된순</option>
									<option value="YNEW" ${param.sort eq 'YNEW' ? "selected" : "" }>답변된 최신순</option>
									<option value="YOLD" ${param.sort eq 'YOLD' ? "selected" : "" }>답변된 오래된순</option>
								</select>
							</div>
						</div>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<!-- <th class="admin-check"></th> -->
								<th class="text-center">문의번호</th>
								<th class="text-center">분류</th>
								<th class="text-center">제목</th>
								<th class="text-center">질문자</th>
								<th class="text-center">등록일</th>
								<th class="text-center">답변여부</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty qnas }">
									<c:forEach var="qna" items="${qnas }">
							<tr>
								<%-- <td class="text-center"><input type="checkbox" name="qnaNo" value="${qna.no }"></td> --%>
								<td class="text-center">${qna.no }</td>
								<td class="text-center">${qna.category }</td>
								<td class="text-center"><a href="detail.kakao?pno=${param.pno }&no=${qna.no}">${qna.title }</a></td>
								<td class="text-center">${qna.member.name }</td>
								<td class="text-center"><fmt:formatDate value="${qna.createDate }" pattern="yyyy-MM-dd"/>  </td>
								<td class="text-center">${qna.statusYn }</td>
							</tr>
							</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" class="text-center">조회된 글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<!--
					<div class="text-right">
						<a href="" class="btn btn-default">삭제</a>
					</div>
					-->
					<div class="text-center">
						<select class="form-control" name="opt" >
							<option value="title" ${param.opt eq 'title' ? 'selected' : '' }> 제목</option>
							<option value="content" ${param.opt eq 'content' ? 'selected' : '' }> 내용</option>
						</select>
						<input type="text" class="form-control" name="keyword" value="${param.keyword }">
						<button type="button" class="btn btn-default" onclick="sendform(1);">검색</button>
					</div>
					<div class="text-center">
						<ul class="pagination">
							<c:choose>
								<c:when test="${not pagination.first }">
									<li><a href=""onclick="goPage(event, ${pagination.page - 1})">&laquo;</a></li>
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
									<li><a href="#"
										onclick="goPage(event, ${pagination.page + 1})">&raquo;</a></li>
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
		function sendform(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("list-form").submit();
		}
		
		function goPage(event, pno) {
			event.preventDefault();	// a 태그 기본동작 발생 방지
			sendform(pno);
		}
	</script>
</html>