<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/kakao/test/css/main.css">
<link rel="stylesheet" href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<title>KAKAO FRIENDS</title>
<style>
        .container {width: 1080px; margin: 25px auto 0;}
        p {margin: 0px;}
        a:hover {
            text-decoration: none;
            color: #999999;
        }
        a {color: #999999;}
                
        #myCmyCarousel {
            max-width: 100%;
        }
        .carousel{
        	float: inherit !important;
        }
        .carousel-control.left {
            background: none;
            left: 430px;
            background-image: none !important;
        }
        
        .carousel-control .left:hover {
            color: #132639 !important;
        }
        .carousel-control {
            width: auto !important;
            color: #132639 !important;
            
        }
        .carousel-control.right {
            background: none;
            right: 430px !important;
            background-image: none !important;
        }
        .carousel-control .right:hover {
            color: #132639 !important;
        }
        .detail_cat {
            padding-top: 27px;
            font-size: 14px;
            
        }
        .detail_cat p {
            text-align: center;
        }
        .detail_tit {
            font-size: 44px;
            line-height: 50px;
            color: #1e1e1e;
            text-align: center;
            margin: 0px;
        }
        .cont_about {
            overflow: hidden;
            width: 100%;
            padding: 49px 0 92px;
        }
        .detail_price {
            padding: 9px 0px 0px;
        }
        .detail_com {
            text-align: center;
        }
        .detail_imgbox {
            width: 800px;
            margin: 10px auto;
            text-align: center;
        }
        .detail_imgbox img {
            width: 100%;
        }
        .recently_product {
            border-top: 1px solid #eee;
        }
        .recently_title {
            padding-top: 22px;
            font-size: 24px;
        }
        .recently {
            padding: 30px 0px;
        }
        .recently_box {
            padding: 30px 0px 0px;
            
        }
        .recently_img_box {
            width: 100px;
        }
        .recently_box img {
            width: 100px;
            height: 100px;
        }
        .recently_tit {
            font-size: 14px;
            color: #1e1e1e;
        }
        .recently_price {
            padding-top: 21px;
            font-size: 12px;
            color: #1e1e1e;
        }
        .recently_txt{
        	margin-left: 20px;
        }
        .recommend_product {
            border-top: 1px solid #eee;
        }
        .recommend_list {padding: 10px 0 30px 0;}
        .recommend_title {
            padding-top: 23px;
            font-size: 24px;
            color: #333;
        }
        .cate_item {
            padding-bottom: 45px;
        }
        .caption {margin-bottom: 20px;}
        .caption h3{text-align: center; font-size: 17px; color: #1e1e1e; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; margin-top: 8px;}
        .caption p{text-align: center; font-size: 16px; color: #1e1e1e;}
        
        .order-wrap{width: 100%; position: fixed; bottom: 0; left: 0; background: #fff; border-top: 1px solid #eee; margin: 0 auto;}
        .order-box{padding: 16px 0;}
        
        .glyphicon-heart:before{color: #ccc;}
        
        .cart:before{color: #ccc;}
        .cart{padding-left: 9px; padding-right: 10px;}
        .cart span{letter-spacing: -2px;}
        .button-box{text-align: center; display: inline;}
        .inp_quantity {
            text-align: center;
            width: 40px;
            padding: 5px 6px 6px 6px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
        }
        .quan_key {
            width: 39px;
            font-size: 15px;
            border-right: 1px solid #ddd;
        }
        .quan_key:hover {
            border-right: 1px solid #ddd;
            background-color: #fff;
        }
        .order_price {
            padding: 6px 0px 0px 170px;
            font-size: 16px;
        }
        .price_text {
            color: #999;
        }
        .price_num {
            color: #333;
            padding-left: 10px;
            font-weight: 500;
        }
        b{font-weight: 500;}
        .box_quantity {
            padding-left: 70px;
        }
        .box_quan {
            float: left;
        }
        .buy_btn {
            float: right;
            width: 160px;
            height: 40px;
            font-size: 16px;
            color: #fff;
            background-color: #ffc20e;
            text-align: center;
            border: none;
            margin-right: 60px;
        }
        .carousel-control:focus{color: #fff;}
        .carousel-control .glyphicon-chevron-left, .carousel-control .glyphicon-chevron-right, .carousel-control .icon-next, .carousel-control .icon-prev
        {
        	width: 30px;
		    height: 30px;
		    margin-top: -90px !important;
		    font-size: 30px;
}
        }
        .carousel-inner>.item>img {max-width: 600px !important;}
        .active-cart:before{color: #ffc20e;}
        .active-like:before{color: #ff0000;}
        .cat-margin{margin-bottom: 10px;}
        .carousel-inner>.item>a>img, .carousel-inner>.item>img {width: 510px; height: 510px;}
   		.img-rounded{max-width: 240px; height: 240px !important; margin: 15px 0;}
   
    </style> 
</head>

<body>
<%@ include file="../common/navigation.jsp"%>
    <div class="container">
       <div class="row">
            <div id="myCarousel" class="col-sm-6 col-sm-offset-3 carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="/kakao/test/image/${products.imgName }">
                    </div>
                    <div class="item">
                        <img src="/kakao/test/image/${products.imgName }">
                    </div>
                    <div class="item">
                        <img src="/kakao/test/image/${products.imgName }">
                    </div>
                </div>
            </div>
        </div>
        
        <div>
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
         <div class="row detail_cat">
        <div class="col-sm-12">
            <p class="cat-margin"><a href="/kakao/product/cate_list.kakao?catno=${products.cateNo }&type=S">홈 / ${categories.name }</a></p>
            <h3 class="detail_tit">${products.name }</h3>
            <p class="detail_price"><span id="product-price"><fmt:formatNumber value="${products.price }" /></span>원</p>
        </div>
    </div>
    <div class="row cont_about">
        <div class="col-sm-12">
            <p class="detail_com">${products.info }</p>
            <div class="detail_img col-sm-12">
               <div class="detail_imgbox">
                   <img src="/kakao/test/image/${products.imgName }"/>
               </div>
            </div>
        </div>
    </div>
    
    <div class="row recently_product">
        <div class="col-sm-12 recently_title">
            <strong>최근 본 상품</strong>
        </div>
        <div class="row recently">
        <c:forEach var="product" items="${recentProducts }">
            <div class="col-sm-6 recently_box">
                <a href="/kakao/product/detail.kakao?no=${product.no }">
                    <div class="col-sm-3 recently_img_box">
                        <img src="/kakao/test/image/${product.imgName }">
                    </div>
                    <div class="col-sm-9 recently_txt">
                        <div class="recently_tit">
                            <strong>${product.name }</strong>
                        </div>
                        <div class="recently_price">
                            <p><fmt:formatNumber>${product.price }</fmt:formatNumber><span>원</span></p>
                        </div>
                    </div>
                </a>
            </div>
          </c:forEach>
        </div>
    </div>
    <div class="row recommend_product">
        <div class="col-sm-12 recommend_title">
            <strong>추천상품</strong>
            <div class="row recommend_list">
            	<c:forEach var="product" items="${productsByCateNo }">
	            <div class="col-sm-3">
	                <a href="/kakao/product/detail.kakao?no=${product.no }">
	                    <img src="/kakao/test/image/${product.imgName }" class="img-rounded" style="max-width: 100%;">
	                    <div class="caption">
	                        <h3><strong>${product.name }</strong></h3>
	                        <p><fmt:formatNumber>${product.price }</fmt:formatNumber><span>원</span></p>
	                    </div>
	                </a>
	            </div>
	            </c:forEach>
	        </div>
        </div>
    </div>
    <form action="insertcart.kakao" id="list-form">
	    <div class="order-wrap">
	       <div class="container">
	            <div class="row order-box">
	                <div class="col-sm-4">
	                   <input type="hidden" value="${products.no }" name="no">
	                   		<c:choose>
	                   			<c:when test="${memsts eq 'Y' }">
	                   				<button class="btn btn-default glyphicon glyphicon-heart ${likests eq 'Y' ? 'active-like' : ''}" type="submit" onclick="changeSubmit('insertlike.kakao');"></button>
	                   			</c:when>
		                   		<c:otherwise>
		                   			<button class="btn btn-default glyphicon glyphicon-heart ${likests eq 'Y' ? 'active-like' : ''}" type="submit" onclick="checkFiled(event);"></button>
		                   		</c:otherwise>
			                </c:choose>
			                    <button class="btn btn-default glyphicon glyphicon-shopping-cart cart ${cartsts eq 'Y' ? 'active-cart' : ''}" type="button" onclick="addcart(${products.no });">
			                        <span>장바구니 담기</span>
			                    </button>
	                </div>
	                <div class="box_quantity col-sm-5">
	                    <div class="box_quan">
	                        <button id="minus-amount-${products.no }" type="button" class="button btn btn-default quan_key" onclick="minusAmount(${products.no });">-</button>
	                        <input type="text" id="current-amount-${products.no }" class="inp_quantity" name="amount" value="1" onkeyup="changeAmount(${products.no });"/>
	                        <button id="plus-amount-${products.no }" type="button" class="button btn btn-default quan_key" onclick="plusAmount(${products.no });">+</button>
	                    </div>
	                    <div class="order_price">
	                        <span class="price_text">상품 금액 </span><b id="product-price-${products.no }" class="price_num"><fmt:formatNumber value="${products.price }" /></b>원
	                    </div>
	                </div>   
	                <div class="cols-sm-3">
	                	<input type="hidden" name="status" value="detail"/>
	                	<input type="hidden" name="memberNo" value="${member.no }"/>
	                	<input type="hidden" name="proNo" value="${products.no }"/>
	                	<input type="hidden" name="price" value="${products.price }"/>
	                	<c:choose>
	                		<c:when test="${memsts eq 'Y' }">
	                    		<button class="buy_btn" type="submit" onclick="changeSubmit('/kakao/order/orderlist.kakao');">구매하기</button>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<button class="buy_btn" type="submit" onclick="checkFiled(event);">구매하기</button>
	                    	</c:otherwise>
	                	</c:choose>
	                	
	                </div>
	            </div>
	        </div>
	    </div>
    </form>
</div>
<script type="text/javascript">
	
	function checkFiled(e) {
		alert("로그인 후 사용가능합니다.");
		e.preventDefault();
		return;
	}
	
	function changeSubmit(str){
	    document.getElementById("list-form").setAttribute("action", str);
	 }
	
	function minusAmount(no) {
		var currentAmount = document.getElementById("current-amount-" + no).value;
		var price = parseInt(document.getElementById("product-price").textContent.replace(/,/g, ''))
		
		if (currentAmount == 1) {
			alert("수량은 0으로 변경하실 수 없습니다.")
		} else {
			currentAmount = currentAmount -1;
			document.getElementById("current-amount-" + no).value = currentAmount;
			document.getElementById("product-price-"+no).textContent = (price * currentAmount).toLocaleString();
		}
	}
	function plusAmount(no) {
		var currentAmount = document.getElementById("current-amount-" + no).value;
		var price = parseInt(document.getElementById("product-price").textContent.replace(/,/g, ''))
		currentAmount = Number(currentAmount) + Number(1);
		document.getElementById("current-amount-" + no).value = currentAmount;
		document.getElementById("product-price-"+no).textContent = (price * currentAmount).toLocaleString();
	}
	function changeAmount(no) {
		
		var currentAmount = document.getElementById("current-amount-" + no).value;
		var price = parseInt(document.getElementById("product-price").textContent.replace(/,/g, ''))
		if (currentAmount !== '') {
			document.getElementById("current-amount-"+ no).value = currentAmount;
			document.getElementById("product-price-" + no).textContent = (price * currentAmount).toLocaleString();
		}
	}
	
	function addcart(pno) {
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);

				if (result.data == "success") {
					var cf = confirm("장바구니로 이동하시겠습니까?");
		    		if (cf == true) {
		    			location.reload();
		    			location.href = "/kakao/cart/cart.kakao";
		    		} else {
		    			location.reload();
		    		}
				} else if (result.data == "loginfail") {
					alert("로그인 후 사용가능합니다.");
				}
			}
		}
		
		var amount = document.getElementById("current-amount-" + pno).value;
		xhr.open("GET", "addcart.kakao?pno="+pno+"&amount="+amount);
		xhr.send();
		
	}

	
</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>