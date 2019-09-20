<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>KAKAO FRIENDS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<style>
.container, .row {
	margin-top: 0px;
	padding: 0px;
	width: 1080px;
}

.aligntext {
	margin-top: 20px;
	margin-bottom: 20px;
}

.coupon-box {
	border: 1px solid #ccc;
}

.no-border-line{
	border: 0px;
}
</style>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js""></script>
</head>

<body>
	<%@ include file="../common/navigation.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-10 aligntext">
				<h1>주문하기</h1>
				<p>Order & Shipping information</p>
			</div>
			<div class="col-sm-2">
				<img src="/kakao/test/image/order_character.png" style="width: 125px;">
			</div>
		</div>
		<hr>
		<div class="row">
			<p style="font-size: 25px; padding: 10px;">
				<strong>상품 리스트</strong>
			</p>
		</div>
		<form method="post" action="order.kakao" onsubmit="checkField(event);">
		<input type="hidden" name="status" value="${param.status }" id="order-status" />
			<div class="row">
			<c:forEach var="cart" items="${carts }">
			 <input type="hidden" name="pno" value="${cart.product.no }">
			 <input type="hidden" name="pamount" value="${cart.productAmount }">
			 <input type="hidden" name="totalPrice" id="total-price" value="${sum }">
				<div class="col-sm-6">
					<img src="/kakao/test/image/${cart.product.imgName }" style="float: left; width:20%; margin-right: 10px; margin-top: 12px;" />
					<div class="aligntext">
						<p style="font-size: 20px;">${cart.product.name }</p>
						<p>금액 : <span id="product-price-${cart.product.no }"><fmt:formatNumber value="${cart.price }" pattern="#,###.###" /></span> 원</p>
						<div style="float: right;">
							<%-- <p>수량 : ${cart.productAmount }개</p> --%>
							<p>수량 : <span id="final-amount-${cart.product.no }"><fmt:formatNumber value="${cart.productAmount }" pattern="#,###.###" /></span>개</p>
						</div>
						<p>옵션 : -</p>
					</div>
					<div style="float: right;">
						<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-default" id="minus-amount-${cart.product.no }" onclick="minusAmount(${cart.product.no});">-</button>
							<input type="button" class="btn btn-default" id="current-amount-${cart.product.no }" value="${cart.productAmount}" />
							<button type="button" class="btn btn-default" id="plus-amount-${cart.product.no }" onclick="plusAmount(${cart.product.no});">+</button>
						</div>
						<button type="button" class="btn btn-default" onclick="updateAmount(${cart.product.no})">변경</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-sm-6 col-sm-offset-6">
				<span>총 상품 금액 </span><span class="pull-right"><strong id="total-price-before"><fmt:formatNumber value="${sum }" pattern="#,###.###" /></strong>원</span>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-6">
				<p style="font-size: 25px; margin-bottom: 20px;">
					<strong>포인트 / 쿠폰 입력</strong>
				</p>
			</div>
		</div>
		<div class="row">
				<div class="col-sm-5 coupon-box">
					<br>
					<p>
						<strong>쿠폰</strong>
					</p>
					<span>사용이 가능한 쿠폰 : <strong>0 개</strong></span>
					<button class="btn btn-default pull-right">검색</button>
					<br>
					<br>
					<br>
					<p>
						<strong>포인트 / 쿠폰 입력</strong>
					</p>
					<table>
						<tr>
							<td style="padding-right: 20px;">현재 적립된 포인트</td>
							<td><strong>: <span id="memberPoint"><fmt:formatNumber value="${LOGINMEMBER.point }" pattern="#,###.###" /></span>P</strong></td>
						</tr>
						<tr>
							<td style="padding-right: 20px;">사용 가능 포인트</td>
							<td><strong>: <fmt:formatNumber value="${LOGINMEMBER.point }" pattern="#,###.###" />P</strong></td>
						</tr>
					</table>
					<br>
					<br>
						<input type="text" placeholder="포인트 입력" style="border: 0px;" id="inputPoint" name="usepoint" />
						<button type="button" class="btn btn-default pull-right" onclick="total();">적용</button>
						<hr style="width: 420px; border: 1px solid black;">
						<br>
						<p>
							<strong>할인금액</strong>
						</p>
						<br> <span>쿠폰<strong class="pull-right">0 원</strong></span>
						<hr style="width: 420px; border: 1px solid #ccc;">
						<span>포인트<strong class="pull-right"><span id="point">0</span> 원</strong></span> <br>
						<br>
						<br>
						<span>총 상품 금액<strong class="pull-right"><span id="totalPrice"><fmt:formatNumber value="${sum }" pattern="#,###.###" /></span>원</strong></span>
					<br>
					<br>
				</div>
	
				<div class="col-sm-6 col-sm-offset-1">
					<p style="font-size: 25px;"><strong>주문자 정보</strong></p>
					<select class="form-control input-lg" name="ordercountry">
						<option value="한국" selected="selected">한국</option>
						<option value="중국">중국</option>
						<option value="일본">일본</option>
						<option value="미국">미국</option>
					</select>
					<hr style="width: 500px; border: 1px solid #ccc;">
					<span style="color: red; margin-left: 5px;">* </span><input type="text" name="ordername" value="${member.name }" style="border: 0px;" placeholder="이름" />
					<hr style="width: 500px; border: 1px solid #ccc;">
					<span style="color: red; margin-left: 5px;">* </span><input type="text" name="orderemail" value="${member.email }" style="border: 0px;" placeholder="이메일" />
					<hr style="width: 500px; border: 1px solid #ccc;">
					<span style="color: red; margin-left: 5px;">* </span><input type="text" name="orderphone" value="${member.phone }" style="border: 0px;" placeholder="전화번호" />
					<hr style="width: 500px; border: 1px solid #ccc;">
					<br><br>
					<span style="font-size: 20px;"><strong>배송지 정보</strong>
						<!-- <span class="pull-right" style="font-size: 15px;">최근 배송지 <span class="glyphicon glyphicon-menu-right"></span></span> -->
					</span>
					<br><br>
					
					<table>
						<tr>
							<td style="padding-right: 150px;"><input type="radio" name="address" value="primary" checked onclick="primaryAddress();" />기본배송지</td>
							<td><input type="radio" name="address" value="new" onclick="newAddress();" />새로운 배송지</td>
						</tr>
					</table>
					<br>
					<select class="form-control input-lg" name="shipping-country">
						<option value="한국" selected="selected">한국</option>
						<option value="중국">중국</option>
						<option value="일본">일본</option>
						<option value="미국">미국</option>
					</select>
					<hr style="width: 500px; border: 1px solid #ccc;">
					<span style="color: red; margin-left: 5px;">* </span><input type="text" id="sname" name="shipping-name" style="border: 0px;" value="${LOGINMEMBER.name }" placeholder="이름" />
					<hr style="width: 500px; border: 1px solid #ccc;">
					<span style="color: red; margin-left: 5px;">* </span><input type="text" id="sphone" name="shipping-phone" style="border: 0px;" value="${LOGINMEMBER.phone }" placeholder="전화번호" />
					<hr style="width: 500px; border: 1px solid #ccc;">
					<span style="color: red; margin-left: 5px;">* </span><input type="text" id="spostalCode" name="shipping-postal-code" style="border: 0px;" value="${LOGINMEMBER.postalCode }" placeholder="우편번호" />
					<input type="button" onclick="execPostCode();" class="btn btn-default pull-right" value="우편번호" />
					<hr style="width: 500px; border: 1px solid #ccc;">
					<span style="color: red; margin-left: 5px;">* </span><textarea name="shipping-address" id="saddress" style="border: 0px;" placeholder="주소를 입력해주세요" rows="1" cols="59" maxlength="50">${LOGINMEMBER.address}</textarea>
					<hr style="width: 500px; border: 1px solid #ccc;">
					<span style="color: red; margin-left: 5px;">* </span><textarea name="shipping-detail-address" id="sdetailAddress" style="border: 0px;" placeholder="상세주소를 입력해주세요" rows="1" cols="59" maxlength="50">${LOGINMEMBER.detailAddress}</textarea>
					<hr style="width: 500px; border: 1px solid #ccc;">
					<span class="pull-right"><input type="checkbox" id="" name="h" value="" /> 기본 배송지로 저장</span>
					<br><br>
					<p><strong>배송메모 (0 / 50자)</strong></p>
					<textarea rows="1" cols="60" id="" name="" maxlength="50" placeholder="주소록 작성란이 아닙니다. 배송메모만 50자 이내로 작성해주세요." style="border: 0px;"></textarea>
					<hr style="width: 500px; border: 1px solid #ccc;">
					<br><br>
					<p style="font-size: 20px;"><strong>배송비 정보</strong></p>
					<br>
					<span>총 배송비<strong class="pull-right">0 원</strong></span>
					<br><br>
				</div>
				<hr style="border: 1px solid black;">
				<br><br>
				<div class="row">
					<div class="col-sm-6">
					<p style="font-size: 25px;"><strong>약관 동의</strong></p>
					<br><br>
					<span>아래 내용에 모두 동의합니다.<span class="glyphicon glyphicon-ok pull-right"></span></span>
					<hr style="width: 500px; border: 0.5px solid black;">
					<span>상품 주문 및 배송정보 수집에 동의합니다.<span style="color: #ffee00">(필수)</span><span class="glyphicon glyphicon-ok pull-right"></span></span>
					<hr style="width: 500px; border: 0.5px solid #ccc;">
					<span>주문할 상품설명에 명시된 내용과 사용조건을 확인하였으며,<br> 취소 환불규정에 동의합니다.<span style="color: #ffee00">(필수)</span><span class="glyphicon glyphicon-ok pull-right"></span></span>
					</div>
					<div class="col-sm-6">
					<p style="font-size: 25px;"><strong>결제 정보</strong></p>
					<br><br>
					<span>상품 금액<strong class="pull-right"><span id="pay-price"><fmt:formatNumber value="${sum }" pattern="#,###.###" /></span> 원</strong></span>
					<hr style="width: 500px; border: 0.5px solid #ccc;">
					<span>할인 금액 (추가내용 쿠폰 + 포인트)<strong class="pull-right"><span id="discount-point">0</span> 원</strong></span>
					<hr style="width: 500px; border: 0.5px solid #ccc;">
					<span>배송비<strong class="pull-right">0 원</strong></span>
					<br><br><br><br>
					<span>총 결제금액<strong class="pull-right"><span id="pay-total-price"><fmt:formatNumber value="${sum }" pattern="#,###.###" /></span> 원</strong></span>
					<br><br><br>
					</div>
					<hr style="border: 0.5px solid #ccc;">
					<br><br>
					<p style="font-size: 25px;"><strong>결제 수단</strong></p>
					<table>
						<tr>
							<td style="padding-right: 150px;"><input type="radio" id="" name="" value="" checked />kakao<strong>pay</strong></td>
							<td><input type="radio" id="" name="" value="" />신용카드</td>
							<input type="submit" class="btn btn-warning pull-right" style="width: 200px;" value="결제하기" />
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
	
	<script type="text/javascript">
		function total() {
			var inputPoint = document.getElementById("inputPoint").value;
			var memberPoint = document.getElementById("memberPoint").textContent.replace(/,/g, '');
			
			if(Number(inputPoint) > Number(memberPoint)) {
				alert("현재 포인트만큼 입력할 수 있습니다.");
				document.getElementById("inputPoint").value = "";
				return;
			}
			
			if(Number(inputPoint) < 0) {
				alert("0포인트 이상 입력 가능합니다.");
				document.getElementById("inputPoint").value = "";
				return;
			}
			
			var point = document.getElementById("point").textContent;
			var totalPriceBefore = document.getElementById("total-price-before").textContent.replace(/,/g, '');
			
			document.getElementById("point").textContent = new Number(inputPoint).toLocaleString();
			document.getElementById("discount-point").textContent = new Number(inputPoint).toLocaleString();
			
			var totalPriceFinal = totalPriceBefore - inputPoint;
			
			document.getElementById("totalPrice").textContent = new Number(totalPriceFinal).toLocaleString();
			document.getElementById("pay-total-price").textContent = new Number(totalPriceFinal).toLocaleString();
			document.getElementById("total-price").textContent = new Number(totalPriceFinal).toLocaleString();
		}
		
		function minusAmount(no) {
			var currentAmount = document.getElementById("current-amount-" + no).value;
			var totalPrice = parseInt(document.getElementById("product-price-" + no).textContent.replace(/,/g, ''));
			var price = totalPrice / currentAmount;
			// var totalPriceBefore = document.getElementById("total-price-before").textContent.replace(/,/g, '');
			
			if(currentAmount == 1) {
				alert("수량은 0으로 변경하실 수 없습니다.")
			} else {
				currentAmount = currentAmount - 1;
				document.getElementById("current-amount-" + no).value = currentAmount;
				document.getElementById("final-amount-" + no).textContent = currentAmount;
				
				document.getElementById("product-price-" + no).textContent = (price * currentAmount).toLocaleString();
				// document.getElementById("total-price-before").textContent = (totalPriceBefore - price).toLocaleString();
			}
		}
		
		function plusAmount(no){
			var currentAmount = document.getElementById("current-amount-" + no).value;
			var totalPrice = parseInt(document.getElementById("product-price-" + no).textContent.replace(/,/g, ''));
			var price = totalPrice / currentAmount;
			// var totalPriceBefore = document.getElementById("total-price-before").textContent.replace(/,/g, '');
			
			var result = Number(currentAmount) + Number(1);
			document.getElementById("current-amount-" + no).value = result;
			document.getElementById("final-amount-" + no).textContent = result;
			
			document.getElementById("product-price-" + no).textContent = (price * result).toLocaleString();
			// document.getElementById("total-price-before").textContent = (Number(totalPriceBefore) + Number(price)).toLocaleString();
		}
		
		function updateAmount(no) {
			var currentAmount = document.getElementById("current-amount-" + no).value;
			var totalPrice = parseInt(document.getElementById("product-price-" + no).textContent.replace(/,/g, ''));
			var status = document.getElementById("order-status").value;
			var price = totalPrice / currentAmount;
			
			console.log("status", status);
			console.log("no", no);
			console.log("currentAmount", currentAmount);
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					
					document.getElementById("product-price-" + no).textContent = (price * currentAmount).toLocaleString();
					document.getElementById("total-price-before").textContent = result.sum.toLocaleString();
					document.getElementById("totalPrice").textContent = result.sum.toLocaleString();
					document.getElementById("pay-price").textContent = result.sum.toLocaleString();
					document.getElementById("pay-total-price").textContent = result.sum.toLocaleString();
				}
			}
			xhr.open("GET", "updateamount.kakao?no=" + no + "&status="+status+"&amount=" + currentAmount);
			xhr.send();
		}
		
		function execPostCode() {
			new daum.Postcode({
				oncomplete: function(data) {
					$('[name=shipping-postal-code]').val(data.zonecode); // 우편번호 (5자리)
					$('[name=shipping-address]').val(data.address);
					$('[name=shipping-detail-address]').val(data.buildingName);
				}
            }).open();
        }
		
		function primaryAddress() {
				document.getElementById("sname").value = '${LOGINMEMBER.name}';
				document.getElementById("sphone").value = '${LOGINMEMBER.phone}';
				document.getElementById("spostalCode").value = '${LOGINMEMBER.postalCode}';
				document.getElementById("saddress").value = '${LOGINMEMBER.address}';
				document.getElementById("sdetailAddress").value = '${LOGINMEMBER.detailAddress}';
		}
		
		function newAddress() {
			document.getElementById("sname").value = "";
			document.getElementById("sname").setAttribute("placeholder", "이름을 입력해주세요.");

			document.getElementById("sphone").value = "";
			document.getElementById("sphone").setAttribute("placeholder", "전화번호를 입력해주세요.");

			document.getElementById("spostalCode").value = "";
			document.getElementById("spostalCode").setAttribute("placeholder", "우편번호를 입력해주세요.");

			document.getElementById("saddress").value ="";
			document.getElementById("saddress").setAttribute("placeholder", "주소를 입력해주세요.");

			document.getElementById("sdetailAddress").value = "";
			document.getElementById("sdetailAddress").setAttribute("placeholder", "상세주소를 입력해주세요.");
		}
		
		function checkField(e) {
			// 특정 태그에서 특정 이벤트 발생 시 수행되는 기본동작의 발현을 방해한다.
			var sname = document.getElementById("sname").value;
			var sphone = document.getElementById("sphone").value;
			var spostalCode = document.getElementById("spostalCode").value;
			var saddress = document.getElementById("saddress").value;
			var sdetailAddress = document.getElementById("sdetailAddress").value;
			
			if(sname == "") {
				alert("이름은 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			
			if(sphone == "") {
				alert("전화번호는 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			if(spostalCode == "") {
				alert("우편번호는 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			if(saddress == "") {
				alert("주소는 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			if(sdetailAddress == "") {
				alert("상세주소는 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
		}
	</script>
</body>
</html>