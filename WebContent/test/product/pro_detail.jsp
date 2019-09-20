<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .container {width: 1080px;}
        p {margin: 0px;}
        a:hover {
            text-decoration: none;
            color: #999999;
        }
        a {color: #999999;}
                
        #myCmyCarousel {
            max-width: 100%;
        }
        .carousel-control.left {
            background: none;
            left: 330px;
        }
        
        .carousel-control.left:hover {
            color: #132639;
        }
        
        .carousel-control {
            width: inherit;
            color: #132639;
        }
        .carousel-control.right {
            background: none;
            right: 330px;
        }
        .carousel-control.right:hover {
            color: #132639;
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
            width: 1000px 770px;
            margin: 10px auto;
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
            width: 100%
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
        .recommend_product {
            border-top: 1px solid #eee;
        }
        .recommend_list {padding: 33px 0 30px 0;}
        .recommend_title {
            padding-top: 23px;
            font-size: 24px;
            color: #333;
        }
        .cate_item {
            padding-bottom: 45px;
        }
        .caption h3{text-align: center; font-size: 18px; color: #1e1e1e;}
        .caption p{text-align: center; font-size: 16px; color: #1e1e1e;}
        
        .order-wrap{width: 100%; position: fixed; bottom: 0; left: 0; background: #fff; border-top: 1px solid #eee; margin: 0 auto;}
        .order-box{padding: 16px 0;}
        
        .glyphicon-heart:before{color: #ccc;}
        .glyphicon-shopping-cart:before{color: #ccc;}
        .cart{padding-left: 9px; padding-right: 10px;}
        .cart span{letter-spacing: -2px;}
        .button-box{text-align: center; display: inline;}
        .inp_quantity {
            text-align: center;
            width: 40px;
            padding: 5px;
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
        }
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
    </style> 
</head>

<body>
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
                        <img src="image/detail_thumbnail.jpg" alt="Los Angeles">
                    </div>
                    <div class="item">
                        <img src="image/detail_thumbnail.jpg" alt="Chicago">
                    </div>
                    <div class="item">
                        <img src="image/detail_thumbnail.jpg" alt="New york">
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
            <p><a href="#">홈 / 시즌잡화</a></p>
            <h3 class="detail_tit">크레들 핸디형 선풍기_어피치</h3>
            <p class="detail_price">00,000원</p>
        </div>
    </div>
    <div class="row cont_about">
        <div class="col-sm-12">
            <p class="detail_com">올 여름 언제 어디서나 함께 할 어피치 크레들 핸디선풍기 지금 만나보세요!</p>
            <div class="detail_img col-sm-12">
               <div class="detail_imgbox">
                   <img src="image/detail.jpg"/>
               </div>
            </div>
        </div>
    </div>
    <div class="row recently_product">
        <div class="col-sm-12 recently_title">
            <strong>최근 본 상품</strong>
        </div>
        <div class="row recently">
            <div class="col-sm-6 recently_box">
                <a href="#">
                    <div class="col-sm-3 recently_img_box">
                        <img src="image/detail_thumbnail.jpg">
                    </div>
                    <div class="col-sm-9">
                        <div class="recently_tit">
                            <strong>크레들 핸디형 선풍기_어피치</strong>
                        </div>
                        <div class="recently_price">
                            <p> 금액: 00,000원 </p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 recently_box">
                <a href="#">
                    <div class="col-sm-3 recently_img_box">
                        <img src="image/detail_thumbnail.jpg">
                    </div>
                    <div class="col-sm-9">
                        <div class="recently_tit">
                            <strong>크레들 핸디형 선풍기_어피치</strong>
                        </div>
                        <div class="recently_price">
                            <p> 금액: 00,000원 </p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 recently_box">
                <a href="#">
                    <div class="col-sm-3 recently_img_box">
                        <img src="image/detail_thumbnail.jpg">
                    </div>
                    <div class="col-sm-9">
                        <div class="recently_tit">
                            <strong>크레들 핸디형 선풍기_어피치</strong>
                        </div>
                        <div class="recently_price">
                            <p> 금액: 00,000원 </p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="row recommend_product">
        <div class="col-sm-12 recommend_title">
            <strong>추천상품</strong>
            <div class="row recommend_list">
            <div class="col-sm-3">
                <a href="">
                    <img src="image/sample_thumbnail.png" class="img-rounded" style="max-width: 100%;">
                    <div class="caption">
                        <h3><strong>볼캡-서핑라이언</strong></h3>
                        <p>22,000원</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-3 cate_item">
                <a href="">
                    <img src="image/sample_thumbnail.png" class="img-rounded" style="max-width: 100%;">
                    <div class="caption">
                        <h3><strong>볼캡-서핑라이언</strong></h3>
                        <p>22,000원</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-3 cate_item">
                <a href="">
                    <img src="image/sample_thumbnail.png" class="img-rounded" style="max-width: 100%;">
                    <div class="caption">
                        <h3><strong>볼캡-서핑라이언</strong></h3>
                        <p>22,000원</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-3 cate_item">
                <a href="">
                    <img src="image/sample_thumbnail.png" class="img-rounded" style="max-width: 100%;">
                    <div class="caption">
                        <h3><strong>볼캡-서핑라이언</strong></h3>
                        <p>22,000원</p>
                    </div>
                </a>
            </div>
            <div class="col-sm-3 cate_item">
                <a href="">
                    <img src="image/sample_thumbnail.png" class="img-rounded" style="max-width: 100%;">
                    <div class="caption">
                        <h3><strong>볼캡-서핑라이언</strong></h3>
                        <p>22,000원</p>
                    </div>
                </a>
            </div>
        </div>
        </div>
    </div>
    <div class="order-wrap">
       <div class="container">
            <div class="row order-box">
                <div class="col-sm-4">
                   <button class="btn btn-default glyphicon glyphicon-heart" type="submit"></button>
                    <button class="btn btn-default glyphicon glyphicon-shopping-cart cart" type="submit">
                        <span>장바구니 담기</span>
                    </button>
                </div>
                <div class="box_quantity col-sm-5">
                    <div class="box_quan">
                        <button class="button btn btn-default quan_key">-</button>
                        <input type="text" class="inp_quantity" name="prEa" value="1">
                        <button class="button btn btn-default quan_key">+</button>
                    </div>
                    <div class="order_price">
                        <span class="price_text">상품 금액</span><em class="price_num">00,000원</em>
                    </div>
                </div>   
                <div class="cols-sm-3">
                    <button class="buy_btn">구매하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>