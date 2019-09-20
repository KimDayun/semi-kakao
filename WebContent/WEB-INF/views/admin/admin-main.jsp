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
	href="/kakao/test//bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/kakao/test/admin/css/kakao-admin.css">
<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
/*
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	 
    	 
    	  
    	  var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					console.log(result);
					
					var items = [ ['월', '구매건수', '구매액']];
    	  			for (var i=0; i<result.length; i++) {
    	  				var item = result[i];
    	  				var arr = [item.month, item.orderCount, item.totalPrice];
    	  				items.push(arr);
    	  				console.log(arr);
    	  				console.log(i);
    	  			}
    	  				console.log(items);
			        var data = google.visualization.arrayToDataTable(items);
			        var options = {
			          title: '1주일 매출',
			          hAxis: {title: '일(日)',  titleTextStyle: {color: '#333'}},
			          vAxis: {minValue: 0}
			        };
			
			        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
			        chart.draw(data, options);
				}
			}
			xhr.open("GET", "orderInfo.kakao");
			xhr.send();
      }
     */
    </script>
    <style>
    	.admin-h3 {margin-top: 0px; margin-bottom: 25px;}
    	hr {width:1150px; border-top: 3px solid #eee !important;}
    	.admin-margin {margin-right: 5px !important;}
    	.div-size {height: 380px;}
    	
    </style>
</head>
<body>
	<%@ include file="common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<%@ include file="common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11" >
			<div class="container">
				<h1 class="admin-buttom">관리자 메인페이지</h1>
				<div class="row">
					<div class="col-xs-6 well div-size">
						<h3 class="admin-h3">금일 주문내역</h3>
						<form class="form-inline" action="list.kakao" id="list-form">
							<table class="table table-hover" style="width: 100%; overflow-x:auto">
							<thead>
								<tr>
									<th class="text-center">주문번호</th>
									<th class="text-center">주문자</th>
									<th class="text-center">아이디</th>
									<th class="text-center">사용포인트</th>
									<th class="text-center">최종가격</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${not empty orders }">
									<c:forEach var="order" items="${orders }">
										<tr>
											<td class="text-center"><a href="/kakao/admin/order/detail.kakao?pno=1&no=${order.no }">${order.no }</a></td>
											<td class="text-center">${order.member.name }</td>
											<td class="text-center">${order.member.id }</td>
											<td class="text-center">${order.usePoint }</td>
											<td class="text-center">${order.finalPrice }</td>
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
						</form>
					</div>
					<div class="col-xs-6 well div-size">
						<h3 class="admin-h3">금일 1:1 문의내역</h3>
						<form class="form-inline">
							<table class="table table-hover" style="width: 100%; overflow-x:auto">
								<thead>
									<tr>
										<th class="text-center">문의번호</th>
										<th class="text-center">분류</th>
										<th class="text-center">제목</th>
										<th class="text-center">질문자 아이디</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty qnas }">
											<c:forEach var="qna" items="${qnas }">
												<tr>
													<td class="text-center">${qna.no }</td>
													<td class="text-center">${qna.category }</td>
													<td class="text-center"><a href="/kakao/admin/qna/detail.kakao?pno=1&no=${qna.no }">${qna.title }</a></td>
													<td class="text-center">${qna.member.id }</td>
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
						</form>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-xs-12 well">
						<h3 class="admin-h3">이번달 주문 상세내역</h3>
						<form class="form-inline">
							<table class="table table-hover" style="width: 100%; overflow-x:auto">
								<thead>
									<tr>
										<th class="text-center">주문 건수</th>
										<th class="text-center">주문 금액</th>
										<th class="text-center">주문 상품수</th>
										<th class="text-center">가장 많은 주문상품</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty mainInfo }">
											<tr>
												<td class="text-center">${mainInfo.orderCount }</td>
												<td class="text-center"><fmt:formatNumber value="${mainInfo.totalPrice }" pattern="#,###.##" />원</td>
												<td class="text-center">${mainInfo.totalAmount }</td>
												<td class="text-center">
													<c:forEach var="name" items="${orderNames }">
														${name }　
													</c:forEach>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td class="text-center">0</td>
												<td class="text-center">0</td>
												<td class="text-center">0</td>
												<td class="text-center">없음</td>
											</tr>
										</c:otherwise>
									</c:choose> 
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>