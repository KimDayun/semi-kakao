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
	.fixed-table-body {
 		 overflow-x: auto;
	}
</style>
</head>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<c:set var="menu" value="order" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<form class="form-inline" action="list.kakao" id="list-form">
				<input type="hidden" name="pno" id="page-no"> 
				<div class="container">
					<div class=row>
						<div class="col-xs-6">
							<h1 class="admin-buttom">주문관리</h1>
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
									<option value="ibgm" ${param.sort eq 'ibgm' ? "selected" : "" }>입금확인 최신순</option>
									<option value="baejun" ${param.sort eq 'baejun' ? "selected" : "" }>배송 준비중 최신순</option>
									<option value="baejung" ${param.sort eq 'baejung' ? "selected" : "" }>배송중 최신순</option>
									<option value="baewan" ${param.sort eq 'baewan' ? "selected" : "" }>배송완료 최신순</option>
								</select>
							</div>
						</div>
					</div>
					<div style=""></div>
					<table class="table table-hover" style="width: 100%; overflow-x:auto">
						<thead>
							<tr>
								<th class="admin-check"></th>
								<th class="text-center">주문번호</th>
								<th class="text-center">주문자</th>
								<th class="text-center">주문상태</th>
								<th class="text-center">주문일</th>
								<th class="text-center">사용포인트</th>
								<th class="text-center">최종가격</th>
								<th class="text-center">배송송장</th>
							
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty orders }">
									<c:forEach var="order" items="${orders }">
										<tr>
											<td class="text-center"><input type="checkbox" value="${order.no }" id="orderNoArray" name="orderNos" class="checkSelect"></td>
											<td class="text-center"><a href="detail.kakao?pno=${param.pno}&no=${order.no}">${order.no }</a></td>
											<td class="text-center">${order.member.name }</td>
											<td class="text-center"><span id="order-status-${order.no }">${order.status }</span></td>
											<td class="text-center"><fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd"/> </td>
											<td class="text-center">${order.usePoint }</td>
											<td class="text-center">${order.finalPrice }</td>
											<c:choose>
												<c:when test="${not empty order.invoiceNumber }">
													<td class="text-center"><input type="text" value="${order.invoiceNumber }" readonly>
													<button type="button" class="btn btn-default" style="background-color: #ccc" disabled>적용</button></td>
												</c:when>
												<c:otherwise>
													<td class="text-center">
															<input type="text" id="invoiceNum${order.no }">
															<input type="button" class="btn btn-default" id="inButton${order.no}" onclick="addInvoice('invoiceNum${order.no }', '${order.no}', '${param.pno }');" value="적용">											
													</td>
												</c:otherwise>
											</c:choose>
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
						<button type="button" class="btn btn-default" onclick="changStatus('${param.pno}');">주문상태 변경</button>
					</div>
					
					<div class="text-center">
						 <select class="form-control" name="opt" >
							<option value="orderNum" ${param.opt eq 'orderNum' ? 'selected' : '' }> 주문번호</option>
							<option value="id" ${param.opt eq 'id' ? 'selected' : '' }> 아이디</option>
							<option value="name" ${param.opt eq 'name' ? 'selected' : '' }> 이름</option>
						</select>
						<input type="text" class="form-control" name="keyword" value="${param.keyword }">
						<button type="button" class="btn btn-default" onclick="sendform(1);">검색</button> 
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
										<li class="active"><a href="#" onclick="goPage(event, ${num})">${num }</a>
									</c:when>
									<c:otherwise>
										<li><a href="#" onclick="goPage(event, ${num})">${num }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${not pagination.last }">
									<li><a href="#" onclick="goPage(event, ${pagination.page + 1})">&raquo;</a></li>
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
		
		/* 배송송장 입력 펑션 */
		function addInvoice(id, orderNo, pno) {
			var invoice = document.getElementById(id).value;
			var orderNum = orderNo;
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					
					document.getElementById(id).value = result.invoiceNumber;
					document.getElementById("inButton"+orderNo).setAttribute("disabled", "disabled");
					document.getElementById("inButton"+orderNo).style.backgroundColor="#ccc";
				}
			}
			xhr.open("GET", "listInvoiceNumAdd.kakao?pno=" + pno + "&no=" + orderNo+"&invoice="+invoice);
			xhr.send();
		}
		
		function chageSubmit(str){
			document.getElementById("list-form").setAttribute("action", str);
		}
		
		
		/* 주문상태 변경 */
		function changStatus(pno) {
			
			var orderNo = [];
			var orderCount = 0;
			var checkbox = $(".checkSelect")
			
			for(i=0;i<checkbox.length;i++){
				if(checkbox[i].checked == true){
					orderNo[orderCount] = checkbox[i].value;
					orderCount++;
					console.log(orderCount);
					console.log(orderNo[i]);
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					console.log(result);
					var map = result.status;
					
				for(i=0;i<map.length;i++){
					document.getElementById("order-status-"+map[i].orNo).textContent = map[i].orStatus;
					}
					if(result.alert === "Y"){
						alert("송장입력이 필요한 주문이 있습니다.");
					}
					$(".checkSelect").prop('checked', false) ;

				}
				/* var checkboxs = document.getElementsByName("orderNos");
				for (var j=0; j<checkboxs.length; j++) {
					
					checkboxs[j].checked = false;
				} */
			}
			xhr.open("GET", "listOrderStatusUpdate.kakao?pno=" + pno + "&no=" + orderNo);
			xhr.send();
		}
	</script>
</html>