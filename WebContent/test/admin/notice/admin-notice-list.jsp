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

</head>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
			<h1 class="admin-buttom">공지사항</h1>
				<form>
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

							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" value=""></td>
								<td class="text-center">1</td>
								<td class="text-center">상품</td>
								<td class="text-center"><a href="admin-notic-detail.jsp">공지사항입니다.</a></td>
								<td class="text-center">2019-05-19</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" /></td>
								<td class="text-center">1</td>
								<td class="text-center">상품</td>
								<td class="text-center"><a href="admin-notic-detail.jsp">공지사항입니다.</a></td>
								<td class="text-center">2019-05-19</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" /></td>
								<td class="text-center">1</td>
								<td class="text-center">상품</td>
								<td class="text-center"><a href="admin-notic-detail.jsp">공지사항입니다.</a></td>
								<td class="text-center">2019-05-19</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" /></td>
								<td class="text-center">1</td>
								<td class="text-center">상품</td>
								<td class="text-center"><a href="admin-notic-detail.jsp">공지사항입니다.</a></td>
								<td class="text-center">2019-05-19</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" /></td>
								<td class="text-center">1</td>
								<td class="text-center">상품</td>
								<td class="text-center"><a href="admin-notic-detail.jsp">공지사항입니다.</a></td>
								<td class="text-center">2019-05-19</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" /></td>
								<td class="text-center">1</td>
								<td class="text-center">상품</td>
								<td class="text-center"><a href="admin-notic-detail.jsp">공지사항입니다.</a></td>
								<td class="text-center">2019-05-19</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" /></td>
								<td class="text-center">1</td>
								<td class="text-center">상품</td>
								<td class="text-center"><a href="admin-notic-detail.jsp">공지사항입니다.</a></td>
								<td class="text-center">2019-05-19</td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="noticNo" /></td>
								<td class="text-center">1</td>
								<td class="text-center">상품</td>
								<td class="text-center"><a href="admin-notic-detail.jsp">공지사항입니다.</a></td>
								<td class="text-center">2019-05-19</td>
							</tr>
						</tbody>
					</table>

					<div class="text-right">
						<a href="" class="btn btn-default">수정</a> <a href=""
							class="btn btn-default">삭제</a> <a href="admin-notic-detail.jsp" class="btn btn-default">등록</a>
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