<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>KAKAO FRIENDS</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/kakao/test/css/main.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
	<link rel="stylesheet" href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
	<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<style>
		.swiper-wrap{padding:0 !important; }
		.swiper-pagination-bullet {opacity: 0.3; background-color: #333 !important;}
    	.swiper-pagination-bullet-active {opacity: 1 !important;}
    	.product-title a {text-decoration: none!important; color: #111 !important; }
    	.product .product-title a {display: inline-block;}
    	.swiper-container .sub-title{display: block; margin: 35px 0 0 0; text-align: center; font-size: 16px; font-weight: bold; text-decoration: none; color: #555 !important;}
    	.swiper-container .title{display: block; text-align: center; margin: 10px 0 30px 0; font-size: 46px; text-decoration: none; color: #333; font-weight: bold;}
    	.swiper-container-horizontal>.swiper-pagination-bullets, .swiper-pagination-custom, .swiper-pagination-fraction{bottom : -4px;}
    	.container .more-button a{color: #111;}
    	.container .more-button a:hover{text-decoration: none;}
    	.btn-sm {padding: 5px 10px; font-size: 14px; line-height: 1.5; border-radius: 3px; border: none; color: #c2c2d6;}
    	.yellowlight {background-color: #fff; border-radius: 18%; color: #f4c900;}
    	.btn-sm:hover {background-color: #fff; color: #c2c2d6;}
		#MOVE_TOP_BTN {
		    position: fixed;
		    right: 2%;
		    bottom: 20px;
		    display: none;
		    z-index: 999;
		    background: url(https://t1.kakaocdn.net/friends/kfo-common/mo/m640/ico_top.png) rgba(255, 255, 255, 0.9) no-repeat center center;
		    text-indent: -9999em;
		        background-size: 17px auto;
		    padding: 15px 25px;
		    border: 1px solid #ccc;
		    border-radius: 50%;
		}
		.product-text span{
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			
		}
		.product img{width: 255px; height: 255px;}
		
</style>


</head>
<script>
	$(function() {
	    var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 1,
	      spaceBetween: 70,
	      loop: true,
	    autoplay: {
	        delay: 2500,
	        disableOnInteraction: false,
	      },
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	    });
	})
	
	function addcart(pno) {
    		
    		var xhr = new XMLHttpRequest();
    		
    		xhr.onreadystatechange = function() {
    			if (xhr.readyState == 4 && xhr.status == 200) {
    				var result = JSON.parse(xhr.responseText);

					if (result.data == "success") {
			    		location.reload();
						alert("장바구니에 담겼습니다.");
					} else if (result.data == "loginfail") {
						alert("로그인 후 사용가능합니다.")
					}
    			}
    		}
    		
    		xhr.open("GET", "product/addcart.kakao?pno="+pno);
    		xhr.send();
    		
    	}
	
	 $(function() {
	        $(window).scroll(function() {
	            if ($(this).scrollTop() > 500) {
	                $('#MOVE_TOP_BTN').fadeIn();
	            } else {
	                $('#MOVE_TOP_BTN').fadeOut();
	            }
	        });
	        
	        $("#MOVE_TOP_BTN").click(function() {
	            $('html, body').animate({
	                scrollTop : 0
	            }, 400);
	            return false;
	        });
	    });
	 
</script>
<body>
<%@ include file="common/navigation.jsp" %>
	<div class="container swiper-wrap">
		<!--슬라이드-->
	    <div class="swiper-container">
	        <div class="swiper-wrapper">
	       	<c:forEach var="banner" items="${banners }">
	            <div class="swiper-slide">
	                <div><a href="/kakao/product/detail.kakao?no=${banner.product.no }"><img src="/kakao/test/image/${banner.imgName}"></a></div>
	                <a href="" class="sub-title">${banner.subTitle }</a>
	                <a href="" class="title">${banner.title }</a>
	            </div>
	       	</c:forEach>
	        </div>
	
	        <div class="swiper-button-next swiper-button-black"></div>
	        <div class="swiper-button-prev swiper-button-black"></div>
	
	        <div class="swiper-pagination"></div>
	    </div>
    </div>
    <!-- 메인 상품-->
    <div class="container">
        <!--새로나온 상품-->
        <div class="product">
            <div class="row">
                <div class="col-sm-12 product-title">
                    <h1><a href="/kakao/product/cate_list.kakao?catno=1&type=A">새로나온 친구들</a></h1>
                </div>
                <div class="row">
                <c:forEach var="product" items="${newProducts }">
                    <div class="col-sm-3">
                        <a href="/kakao/product/detail.kakao?no=${product.no }"><img src="/kakao/test/image/${product.imgName }"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>${product.name }</span>
                                <strong><fmt:formatNumber value="${product.price }" />원</strong>
                                <p><button class="btn btn-default btn-sm glyphicon glyphicon-lock ${product.cnt gt 0 ? 'yellowlight' : ''}" id="add-button" onclick="addcart(${product.no })"></button></p>
                            </div>
                        </div>
                    </div>
				</c:forEach>
                    <div class="col-sm-12 more-button">
                        <div>
                           <a href="/kakao/product/cate_list.kakao?catno=1&type=A">상품 더 보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--새로나온 상품-->

        <!--라이언-->
        <div class="product">
            <div class="row">
                <div class="col-sm-12 main-cate">
                    <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=ryan&sort=신상품순"><img src="/kakao/test/image/190510_Tbanner_ryan_W.jpg"></a>
                    <h3>당신은 오늘도<br> 라이언을 벗어날 수 없다</h3>
                    <p>심장을 폭행하는<br>라이언 아이템 모음</p>
                </div>
                <div class="row">
                <c:forEach var="product" items="${ryanProducts }">
                    <div class="col-sm-3">
                        <a href="/kakao/product/detail.kakao?no=${product.no }"><img src="/kakao/test/image/${product.imgName }"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>${product.name }</span>
                                <strong><fmt:formatNumber value="${product.price }" />원</strong>
                                <p><button class="btn btn-default btn-sm glyphicon glyphicon-lock ${product.cnt gt 0 ? 'yellowlight' : ''}" id="add-button" onclick="addcart(${product.no })"></button></p>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
                    <div class="col-sm-12 more-button">
                        <div>
                           <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=ryan&sort=신상품순">상품 더 보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--라이언-->
        <!--어피치-->
        <div class="product">
            <div class="row">
                <div class="col-sm-12 main-cate">
                    <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=apeach&sort=신상품순"><img src="/kakao/test/image/190510_Tbanner_apeach_W.jpg"></a>
                    <h3>어제보다 오늘 더 <br> 사랑스러운 어피치</h3>
                    <p>핑크핑크 소녀감성<br>어피치 아이템 여기 다 있다</p>
                </div>
                <div class="row">
                <c:forEach var="product" items="${apeachProducts }">
                    <div class="col-sm-3">
                        <a href="/kakao/product/detail.kakao?no=${product.no}"><img src="/kakao/test/image/${product.imgName}"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>${product.name }</span>
                                <strong><fmt:formatNumber value="${product.price }" />원</strong>
                                <p><button class="btn btn-default btn-sm glyphicon glyphicon-lock ${product.cnt gt 0 ? 'yellowlight' : ''}" id="add-button" onclick="addcart(${product.no })"></button></p>
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                    <div class="col-sm-12 more-button">
                        <div>
                           <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=apeach&sort=신상품순">상품 더 보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--인기친구들-->
        <div class="product">
            <div class="row">
                <div class="col-sm-12 product-title">
                    <h1><a href="#" >인기 친구들</a></h1>
                </div>
                
                <div class="row">
                 <c:forEach var="product" items="${likeProducts }"> 
                    <div class="col-sm-3">
                        <a href="/kakao/product/detail.kakao?no=${product.no }"><img src="/kakao/test/image/${product.imgName }"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>${product.name }</span>
                                <strong><fmt:formatNumber value="${product.price }" />원</strong>
                                <p><button class="btn btn-default btn-sm glyphicon glyphicon-lock ${product.cnt gt 0 ? 'yellowlight' : ''}" id="add-button" onclick="addcart(${product.no })"></button></p>
                            </div>
                        </div>
                    </div>
                  </c:forEach>
                </div>
            </div>
        </div><!--인기 친구들-->
	        <a id="MOVE_TOP_BTN" href="#">top</a>

    </div>
    <%@ include file="common/footer.jsp" %>
</body>
</html>