<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="../bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
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
				<img src="../image/sample4.PNG" style="width: 125px;">
			</div>
		</div>
		<hr>
		<div class="row">
			<p style="font-size: 25px; padding: 10px;">
				<strong>상품 리스트</strong>
			</p>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<img src="../image/sample4.PNG" style="float: left" />
				<div class="aligntext">
					<p style="font-size: 20px;">600mAh입체형 보조배터리_라이언</p>
					<p>금액 : 168,000 원</p>
					<div style="float: right;">
						<p>수량 : 4개</p>
					</div>
					<p>옵션 : -</p>
				</div>
				<div style="float: right;">
					<div class="btn-group" role="group" aria-label="...">
						<button type="button" class="btn btn-default">-</button>
						<button type="button" class="btn btn-default">4</button>
						<button type="button" class="btn btn-default">+</button>
					</div>
					<button class="btn btn-default">변경</button>
				</div>
			</div>
			<div class="col-sm-6">
				<img src="../image/sample4.PNG" style="float: left" />
				<div class="aligntext">
					<p style="font-size: 20px;">600mAh입체형 보조배터리_라이언</p>
					<p>금액 : 168,000 원</p>
					<div style="float: right;">
						<p>수량 : 4개</p>
					</div>
					<p>옵션 : -</p>
				</div>
				<div style="float: right;">
					<div class="btn-group" role="group" aria-label="...">
						<button type="button" class="btn btn-default">-</button>
						<button type="button" class="btn btn-default">4</button>
						<button type="button" class="btn btn-default">+</button>
					</div>
					<button class="btn btn-default">변경</button>
				</div>
			</div>
			<div class="col-sm-6">
				<img src="../image/sample4.PNG" style="float: left" />
				<div class="aligntext">
					<p style="font-size: 20px;">600mAh입체형 보조배터리_라이언</p>
					<p>금액 : 168,000 원</p>
					<div style="float: right;">
						<p>수량 : 4개</p>
					</div>
					<p>옵션 : -</p>
				</div>
				<div style="float: right;">
					<div class="btn-group" role="group" aria-label="...">
						<button type="button" class="btn btn-default">-</button>
						<button type="button" class="btn btn-default">4</button>
						<button type="button" class="btn btn-default">+</button>
					</div>
					<button class="btn btn-default">변경</button>
				</div>
			</div>
			<div class="col-sm-6">
				<img src="../image/sample4.PNG" style="float: left" />
				<div class="aligntext">
					<p style="font-size: 20px;">600mAh입체형 보조배터리_라이언</p>
					<p>금액 : 168,000 원</p>
					<div style="float: right;">
						<p>수량 : 4개</p>
					</div>
					<p>옵션 : -</p>
				</div>
				<div style="float: right;">
					<div class="btn-group" role="group" aria-label="...">
						<button type="button" class="btn btn-default">-</button>
						<button type="button" class="btn btn-default">4</button>
						<button type="button" class="btn btn-default">+</button>
					</div>
					<button class="btn btn-default">변경</button>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-sm-6 col-sm-offset-6">
				<span>총 상품 금액 </span><strong class="pull-right">226,000원</strong>
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
						<td><strong>: 1,000P</strong></td>
					</tr>
					<tr>
						<td style="padding-right: 20px;">사용 가능 포인트</td>
						<td><strong>: 1,000P</strong></td>
					</tr>
				</table>
				<br>
				<br>
				<input type="text" placeholder="포인트 입력" style="border: 0px;" />
				<button class="btn btn-default pull-right">적용</button>
				<hr style="width: 420px; border: 1px solid black;">
				<br>
				<p>
					<strong>할인금액</strong>
				</p>
				<br> <span>쿠폰<strong class="pull-right">0 원</strong></span>
				<hr style="width: 420px; border: 1px solid #ccc;">
				<span>포인트<strong class="pull-right">0 원</strong></span> <br>
				<br>
				<br>
				<span>총 상품 금액<strong class="pull-right">226,000원</strong></span>
				<br>
				<br>
			</div>

			<div class="col-sm-6 col-sm-offset-1">
				<p style="font-size: 25px;"><strong>주문자 정보</strong></p>
				<select class="form-control input-lg" id="" name="">
					<option value="">한국</option>
					<option value="">중국</option>
					<option value="">일본</option>
					<option value="">미국</option>
				</select>
				<hr style="width: 500px; border: 1px solid #ccc;">
				<input type="text" name="" value="" style="border: 0px;" placeholder="이름" />
				<hr style="width: 500px; border: 1px solid #ccc;">
				<input type="text" name="" value="" style="border: 0px;" placeholder="이메일" />
				<hr style="width: 500px; border: 1px solid #ccc;">
				<input type="text" name="" value="" style="border: 0px;" placeholder="전화번호" />
				<hr style="width: 500px; border: 1px solid #ccc;">
				<br><br>
				<span style="font-size: 20px;">배송지 정보
					<span class="pull-right" style="font-size: 15px;">최근 배송지 <span class="glyphicon glyphicon-menu-right"></span></span>
				</span>
				<br><br>
				
				<table>
					<tr>
						<td style="padding-right: 150px;"><input type="radio" id="user-shipping-address-primary" name="shippingaddress" value="" checked />기본배송지</td>
						<td><input type="radio" id="user-shipping-address-new" name="shippingaddress" value="" />새로운 배송지</td>
					</tr>
				</table>
				<br>
				<select class="form-control input-lg" id="" name="">
					<option value="">한국</option>
					<option value="">중국</option>
					<option value="">일본</option>
					<option value="">미국</option>
				</select>
				<hr style="width: 500px; border: 1px solid #ccc;">
				<input type="text" name="" value="" style="border: 0px;" placeholder="이름" />
				<hr style="width: 500px; border: 1px solid #ccc;">
				<input type="text" name="" value="" style="border: 0px;" placeholder="전화변호" />
				<hr style="width: 500px; border: 1px solid #ccc;">
				<input type="text" name="" value="" style="border: 0px;" placeholder="우편번호" />
				<button class="btn btn-default pull-right">우편번호</button>
				<hr style="width: 500px; border: 1px solid #ccc;">
				<input type="text" name="" value="" style="border: 0px;" placeholder="주소를 입력해주세요" />
				<hr style="width: 500px; border: 1px solid #ccc;">
				<input type="text" name="" value="" style="border: 0px;" placeholder="상세주소를 입력해주세요" />
				<hr style="width: 500px; border: 1px solid #ccc;">
				<span class="pull-right"><input type="checkbox" id="" name="h" value="" /> 기본 배송지로 저장</span>
				<br><br>
				<p><strong>배송메모 (0 / 50자)</strong></p>
				<textarea rows="1" cols="60" id="" name="" placeholder="주소록 작성란이 아닙니다. 배송메모만 50자 이내로 작성해주세요." style="border: 0px;"></textarea>
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
				<span>상품 금액<strong class="pull-right">226,000 원</strong></span>
				<hr style="width: 500px; border: 0.5px solid #ccc;">
				<span>할인 금액 (추가내용 쿠폰 + 포인트)<strong class="pull-right">0 원</strong></span>
				<hr style="width: 500px; border: 0.5px solid #ccc;">
				<span>배송비<strong class="pull-right">0 원</strong></span>
				<br><br><br><br>
				<span>총 결제금액<strong class="pull-right">226,000 원</strong></span>
				<br><br><br>
				</div>
				<hr style="border: 0.5px solid #ccc;">
				<br><br>
				<p style="font-size: 25px;"><strong>결제 수단</strong></p>
				<table>
					<tr>
						<td style="padding-right: 150px;"><input type="radio" id="" name="" value="" checked />kakao<strong>pay</strong></td>
						<td><input type="radio" id="" name="" value="" />신용카드</td>
						<button class="btn btn-warning pull-right" style="width: 200px;">결제하기</button>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
</body>
</html>