<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style>
    .container {
        width: 1080px;
    }
  

    .amount {
        width: 40px;
        padding: 5px;
    }

    .select-all {
        font-weight: 500;
        cursor: pointer;
    }

    .product_title {
        font-size: 20px;
        color: #1e1e1e;
        font-weight: bold;
    }

    .delete {
        text-align: right;
        padding-right: 15px;
    }

    .option-btn {
        text-align: center;

    }

    .center-box {
        text-align: center;
    }

    .option-btn button {
        margin: 0 3px;
        padding: 5px 40px;
    }

    .bg-box {
        background: #f0f0f0;
        padding: 30px 0;
    }
    .desc_basket li span{
        float: right;
         font-size: 13px;
        color: #1e1e1e;
        font-weight: bold;
    }
    .row white border-line li span{float: right;}
    .total-price{ 
        font-size: 16px;
        color: #1e1e1e;
        font-weight: bold;
    }
    .txt_g{
        font-size: 18px;
        color: #fff;
        font-weight: bold;
         margin: 0 3px;
        padding: 5px 55px; 
    }
    .txt_g1{
        font-size: 18px;
        color: black;
        font-weight: bold;
         margin: 0 3px;
        padding: 5px 40px; 
    }
    
    .final{
        font-size: 18px;
        color: #8a8a8a;
        font-weight: bold;
    }
    .final-price{
         font-size: 18px;
        color: #1e1e1e;
        font-weight: bold;
    }
    .final-price2{
         font-size: 18px;
        color: #1e1e1e;
        font-weight: bold;
        float: right;
    }
    
     .buy_btn{margin: 30px 0; text-align: center;}
    a{text-decoration: none;}
    .btn_basket{padding: 10px 0;}
    .total-price2{color: #222; font-weight: bold; font-size: 18px;}
    .btn-border{border: 1px solid #ccc !important;}
</style>

<body>
<%@ include file="../common/navigation.jsp" %>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <img src="../test/image/sample3.PNG" style="max-width: 100%;">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8 ">
                <h3 class="text-left">
                 <c:if test="${not empty LOGINMEMBER }">
                	${countCarts }개의 상품이 조회되었습니다.
               	</c:if>
                </h3>
            </div>
            <div class="col-sm-4 text-right" style="padding: 20px;">
               	<input type="checkbox" value="option1" id="ch-all"> <button class="btn btn-default" id="btn-all" onclick="allcheckRelease()" >전체 선택</button>
                <button type="button" class="btn btn-default" onclick="deleteCart()">선택 삭제하기</button>
            </div>
        </div>
        <hr/>
   
		<form  id="cartform" action="delete.kakao">
        <c:forEach var="info" items="${carts }">
        <div  style="margin: 10px;">
	        <div class="row line">
	            <div class="col-sm-3">
	                <div class="checkbox" >
	                    <label>
	                        <input type="checkbox" id="blankCheckbox" name="pro-check"  value="${info.cartNo }">
	                    </label>
	                    <img src="../test/image/${info.imgName }" width="120" height="120">
	                </div>
	            </div>
                <div class="col-sm-5">
                    <a href="/kakao/product/detail.kakao?no=${info.productNo }"><strong style="font-size: 21px;">${info.productName }</strong></a>
                    <div style="margin-top: 10px;">
                    	<div><strong style="font-size: 16px;">금액 :</strong><span class="pull-right"><fmt:formatNumber>${info.price }</fmt:formatNumber></span></div>
                    	<div><strong style="font-size: 16px;">옵션 : </strong><span class="pull-right"></span></div>
                    	<div><strong style="font-size: 16px;">수량 : </strong><span class="pull-right">${info.productAmount}</span></div>
                    </div>
                </div>
                
						
                <div class="col-sm-4 text-right" >
                    <button class="btn btn-default btn-lg" type="button" onclick="toggleBox(${info.cartNo })">옵션/수량 변경</button>
                </div>
             </div>
         
             
             <div class="well" style="display: none;" id="item-box-${info.cartNo }">
             	<div class="row" style="font-size: 20px;">
             		<div class="col-sm-2 col-sm-offset-4 text-center">
             			<div class="input-group">
						  <span class="input-group-addon" onclick="minusAmount(${info.cartNo})">-</span>
						  <input type="text" class="form-control" name="amount" id="amount-${info.cartNo }" value="${info.productAmount}">
						  <span class="input-group-addon" onclick="plusAmount(${info.cartNo})">+</span>
						</div>
             		</div>
             		<div class="col-sm-6 text-center"  style="margin-top: 15px;">
             			<span style="padding-bottom: 10px;"><fmt:formatNumber>${info.totalPrice }</fmt:formatNumber> <strong>원</strong></span>
             		</div>
             	</div>
             	<div class="row">
             		<div class="col-sm-12 text-center">
             			<button class="btn btn-default btn-lg" style="width: 200px;">취소</button>
             			<button class="btn btn-success btn-lg" style="width: 200px;" type="button" onclick="changeAmount(${info.cartNo})">변경</button>
             		</div>
             	</div>
             </div>
             
					<%-- <div style="float: right;">
						<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-default" id="minus-amount-${info.productNo }" onclick="minusAmount(${info.productNo});">-</button>
							<input type="button" class="btn btn-default" id="current-amount-${info.productNo }" value="${info.productAmount}" />
							<button type="button" class="btn btn-default" id="plus-amount-${info.productNo }" onclick="plusAmount(${info.productNo});">+</button>
						</div>
						<button type="button" class="btn btn-default" onclick="updateAmount(${info.productNo})">변경</button>
					</div>
				</div>  --%>
             
	    </div>
	    </c:forEach>
        </form>
	    
	   
       <div style="font-size: 20px;">
           <div class="row">
           	<div class="col-sm-3">장바구니 합계 : </div>
           	<div class="col-sm-3 text-right"><fmt:formatNumber>${info.totalPrice }</fmt:formatNumber></div>
           </div>
           <div class="row">
           	<div class="col-sm-3">배송비 : </div>
           	<div class="col-sm-3 text-right">${info.deliveryFee }</div>
           	<div class="col-sm-3">총결재 금액 : </div>
           	<div class="col-sm-3 text-right">${info.deliveryFee }${info.totalPrice }</div>
           </div>                
       </div>
       <div class="row white border-line">

          <div class="buy_btn">
		<a href="/kakao/product/cate_list.kakao?catno=1&type=A" class="btn btn_default btn-border"><span class="txt_g1">쇼핑 계속하기</span></a>
		<a href="/kakao/order/orderlist.kakao?status=cart"><button type="" class="btn btn-warning"><span class="txt_g">구매하기</span></button></a>
		<span class="btn_basket btn_dimmed" style="display: none"><span class="txt_g">구매하기</span></span> <!-- 비활성화 버튼 -->
	</div>
       </div>
 		</div>
 	 <%@ include file="../common/footer.jsp"%>
 		
 
	<script type="text/javascript">
	
		function changeAmount(cartNo) {
			var input = document.getElementById("amount-" + cartNo);
			var amount = input.value;
			
			location.href = "changeAmount.kakao?cno=" + cartNo + "&amount=" + amount;
		}
	
		function minusAmount(cartNo) {
			var input = document.getElementById("amount-" + cartNo);
			var amount = parseInt(input.value);
			input.value = amount - 1;
		}
		
		function plusAmount(cartNo) {
			var input = document.getElementById("amount-" + cartNo);
			var amount = parseInt(input.value);
			input.value = amount + 1;
		}
	
		//옵션 수량 박스
		function toggleBox(cartNo) {
			var current = document.getElementById("item-box-" + cartNo).style.display;
			if (current == 'block') {
				document.getElementById("item-box-" + cartNo).style.display = 'none';				
			} else {
				document.getElementById("item-box-" + cartNo).style.display = "block"
			}
		}
		
		//전체 선택 or 취소
		function allcheckRelease(){
		
			var check = document.getElementById("ch-all");
			var status = !check.checked;
			check.checked = status;			
			
			var checkboxs= document.querySelectorAll("[name='pro-check']")
			for(var i=0; i<checkboxs.length; i++){
				var checkbox = checkboxs[i];
				checkbox.checked=status;
			}
		}
		
		//장바구니 상품 삭제
		function deleteCart(){
			var form= document.getElementById("cartform");
			form.submit();
		}
		

		
		
	</script>
</body>

</html>