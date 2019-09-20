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
.admin-line-height {
	padding-top: 18px
}
.container-top {
	padding-top: 60px;
.box-top {
	padding-top: 20px;
	}	
}
</style>
</head>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<c:set var="menu" value="product" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<form class="form-inline" action="list.kakao" id="list-form">
				<input type="hidden" name="pno" id="page-no"> <input
					type="hidden" name="pageNo" value="${param.pno }">
			<div class="container">
				<div class="col-xs-6">
					<h1 class="admin-buttom">상품현황</h1>
				</div>
					<div class="col-xs-6 text-right admin-line-height">
							<div>
								<select class="form-control" name="size" onchange="sendform(1);">
									<option value="10" ${param.size eq 10 ? "selected" : "" }> 10개씩</option>
									<option value="20" ${param.size eq 20 ? "selected" : "" }> 20개씩</option>
								</select>
								<select class="form-control pull-right" style="width: 150px"name="sort" onchange="sendform(1);">
									<option value="ALLNEW" ${param.sort eq 'ALLNEW' ? "selected" : "" }>전체 최신순</option>
									<option value="ALLOLD" ${param.sort eq 'ALLOLD' ? "selected" : "" }>전체 오래된순</option>
								</select>
							</div>
						</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="admin-check"></th>
								<th class="text-center">번호</th>
								<th class="text-center">대분류</th>
								<th class="text-center">소분류</th>
								<th class="text-center">캐릭터</th>
								<th class="text-center">상품명</th>
								<th class="text-center">가격</th>
								<th class="text-center">재고</th>
								<th class="text-center">해외배송</th>
								<th class="text-center">판매여부</th>
								<th class="text-center">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty products }">
									<c:forEach var="product" items="${products }">
										<tr>
											<td class="text-center"><input type="checkbox"
												name="productNo" value="${product.no }"></td>
											<td class="text-center">${product.no }</td>
											<td class="text-center">${product.cateName }</td>
											<td class="text-center">${product.subCateName }</td> 
											<td class="text-center">${product.character }</td>
											<td class="text-center"><a href="detail.kakao?pno=${param.pno }&no=${product.no }">${product.name }</a></td>
											<td class="text-center">${product.price }</td>
											<td class="text-center">${product.stock }</td>
											<td class="text-center">${product.globalYn }</td>
											<td class="text-center">${product.sellYn }</td>
											<td class="text-center"><fmt:formatDate
													value="${product.createDate }" pattern="yyyy-MM-dd" /></td>
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
					<div class="row">
					<div class="text-center">
						 <select class="form-control" name="opt" >
							<option value="ProTitle" ${param.opt eq 'ProTitle' ? 'selected' : '' }> 상품이름</option>
							<option value="ProContent" ${param.opt eq 'ProContent' ? 'selected' : '' }> 내용</option>
						</select>
						<input type="text" class="form-control" name="keyword" value="${param.keyword }">
						<button type="button" class="btn btn-default" onclick="sendform(1);">검색</button> 
					</div>
					<div class="text-right">
						<input type="submit" onclick="chageSubmit('listUpdate.kakao');" value="판매여부 변경" class="btn btn-default"> <a
							href="form.kakao?pno=${param.pno }" class="btn btn-default">등록</a>
					</div>
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
						
							<c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
								<c:choose>
									<c:when test="${num eq pagination.page }">
										<li class="active"><a href="#" onclick="goPage(event, ${num})">${num }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#" onclick="goPage(event, ${num})">${num }</a></li>
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
	<script type="text/javascript">
		function sendform(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("list-form").submit();
		}
		
		function goPage(event, pno) {
			event.preventDefault();	// a 태그 기본동작 발생 방지
			sendform(pno);
		}
		
		function chageSubmit(str){
			document.getElementById("list-form").setAttribute("action", str);
		}
	</script>
</body>
</html>