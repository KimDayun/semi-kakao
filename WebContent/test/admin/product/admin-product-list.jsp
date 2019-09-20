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
	href="../../bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/kakao-admin.css">
<script src="../../bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="../../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<style>
.container-top {
	padding-top: 60px;
}
</style>
</head>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">문의현황</h1>
				<form>
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
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" value=""></td>
								<td class="text-center">1</td>
								<td class="text-center">리빙</td>
								<td class="text-center">쿠션</td>
								<td class="text-center">라이언</td>
								<td class="text-center"><a href="admin-product-detail.jsp">라이언
										푹신푹신 베개</a></td>
								<td class="text-center">30000원</td>
								<td class="text-center">1000개</td>
								<td class="text-center">Y</td>
								<td class="text-center">Y</td>
								<td class="text-center">2019-05-17</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" value=""></td>
								<td class="text-center">1</td>
								<td class="text-center">리빙</td>
								<td class="text-center">쿠션</td>
								<td class="text-center">라이언</td>
								<td class="text-center"><a href="admin-product-detail.jsp">라이언
										푹신푹신 베개</a></td>
								<td class="text-center">30000원</td>
								<td class="text-center">1000개</td>
								<td class="text-center">Y</td>
								<td class="text-center">Y</td>
								<td class="text-center">2019-05-17</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" value=""></td>
								<td class="text-center">1</td>
								<td class="text-center">리빙</td>
								<td class="text-center">쿠션</td>
								<td class="text-center">라이언</td>
								<td class="text-center"><a href="admin-product-detail.jsp">라이언
										푹신푹신 베개</a></td>
								<td class="text-center">30000원</td>
								<td class="text-center">1000개</td>
								<td class="text-center">Y</td>
								<td class="text-center">Y</td>
								<td class="text-center">2019-05-17</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" value=""></td>
								<td class="text-center">1</td>
								<td class="text-center">리빙</td>
								<td class="text-center">쿠션</td>
								<td class="text-center">라이언</td>
								<td class="text-center"><a href="admin-product-detail.jsp">라이언
										푹신푹신 베개</a></td>
								<td class="text-center">30000원</td>
								<td class="text-center">1000개</td>
								<td class="text-center">Y</td>
								<td class="text-center">Y</td>
								<td class="text-center">2019-05-17</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" value=""></td>
								<td class="text-center">1</td>
								<td class="text-center">리빙</td>
								<td class="text-center">쿠션</td>
								<td class="text-center">라이언</td>
								<td class="text-center"><a href="admin-product-detail.jsp">라이언
										푹신푹신 베개</a></td>
								<td class="text-center">30000원</td>
								<td class="text-center">1000개</td>
								<td class="text-center">Y</td>
								<td class="text-center">Y</td>
								<td class="text-center">2019-05-17</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" value=""></td>
								<td class="text-center">1</td>
								<td class="text-center">리빙</td>
								<td class="text-center">쿠션</td>
								<td class="text-center">라이언</td>
								<td class="text-center"><a href="admin-product-detail.jsp">라이언
										푹신푹신 베개</a></td>
								<td class="text-center">30000원</td>
								<td class="text-center">1000개</td>
								<td class="text-center">Y</td>
								<td class="text-center">Y</td>
								<td class="text-center">2019-05-17</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" value=""></td>
								<td class="text-center">1</td>
								<td class="text-center">리빙</td>
								<td class="text-center">쿠션</td>
								<td class="text-center">라이언</td>
								<td class="text-center"><a href="admin-product-detail.jsp">라이언
										푹신푹신 베개</a></td>
								<td class="text-center">30000원</td>
								<td class="text-center">1000개</td>
								<td class="text-center">Y</td>
								<td class="text-center">Y</td>
								<td class="text-center">2019-05-17</td>
							</tr>
						</tbody>
					</table>

					<div class="text-right">
						<a href="" class="btn btn-default">수정</a> <a href=""
							class="btn btn-default">삭제</a> <a href="" class="btn btn-default">등록</a>
					</div>
				</form>
				<div class="text-center">

					<ul class="pagination">
						<li><a href="">&laquo;</a></li>
						<li class="active"><a href="">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">4</a></li>
						<li><a href="">5</a></li>
						<li><a href="">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>