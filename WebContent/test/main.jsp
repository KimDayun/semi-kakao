<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>KAKAO FRIENDS</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/kakao/test/css/main.css">
	<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="bootstrap-3.3.2-dist/js/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
	<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<style>
		.swiper-wrap{padding:0 !important; }
		.swiper-pagination-bullet {opacity: 0.3; background-color: #333 !important;}
    	.swiper-pagination-bullet-active {opacity: 1 !important;}
    	a {text-decoration: none!important; color: #111 !important; }
    	a:hover{text-decoration : none;}
    	.swiper-container .sub-title{display: block; margin: 35px 0 0 0; text-align: center; font-size: 16px; font-weight: bold; text-decoration: none; color: #555 !important;}
    	.swiper-container .title{display: block; text-align: center; margin: 10px 0 30px 0; font-size: 46px; text-decoration: none; color: #333; font-weight: bold;}
    	
    	
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
</script>
<body>
<%@ include file="common/navigation.jsp" %>
	<div class="container swiper-wrap">
		<!--슬라이드-->
	    <div class="swiper-container">
	        <div class="swiper-wrapper">
	            <div class="swiper-slide">
	                <div><a href=""><img src="image/190328_Rbanner_tableclock_W.png"></a></div>
	                <a href="" class="sub-title">카카오 프렌즈샵</a>
	                <a href="" class="title">카카오 프렌즈샵</a>
	            </div>
	            <div class="swiper-slide">
	                <div><a href=""><img src="image/190328_Rbanner_tableclock_W.png"></a></div>
	                <a href="" class="sub-title">카카오 프렌즈샵</a>
	                <a href="" class="title">카카오 프렌즈샵</a>
	            </div>
	            <div class="swiper-slide">
	                <div><a href=""><img src="image/190328_Rbanner_tableclock_W.png"></a></div>
	                <a href="" class="sub-title">카카오 프렌즈샵</a>
	                <a href="" class="title">카카오 프렌즈샵</a>
	            </div>
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
                    <h1><a href="">새로나온 친구들</a></h1>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                       <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 more-button">
                        <div>
                           <a href="">상품 더 보기</a>
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
                    <a href=""><img src="image/190510_Tbanner_ryan_W.jpg"></a>
                    <h3>당신은 오늘도<br> 라이언을 벗어날 수 없다</h3>
                    <p>심장을 폭행하는<br>라이언 아이템 모음</p>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                       <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 more-button">
                        <div>
                           <a href="">상품 더 보기</a>
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
                    <a href=""><img src="image/190510_Tbanner_apeach_W.jpg"></a>
                    <h3>어제보다 오늘 더 <br> 사랑스러운 어피치</h3>
                    <p>핑크핑크 소녀감성<br>어피치 아이템 여기 다 있다</p>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 more-button">
                        <div>
                           <a href="">상품 더 보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--인기친구들-->
        <div class="product">
            <div class="row">
                <div class="col-sm-12 product-title">
                    <h1><a href="">인기 친구들</a></h1>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                       <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <a href=""><img src="image/apeachjpg.jpg"></a>
                        <div class="row">
                            <div class="col-sm-12 product-text">
                                <span>어피치 가습기</span>
                                <strong>29,000원</strong>
                                <p><a href=""></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 more-button">
                        <div>
                           <a href="">상품 더 보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--인기 친구들-->
    </div>
    <%@ include file="common/footer.jsp" %>
</body>
</html>