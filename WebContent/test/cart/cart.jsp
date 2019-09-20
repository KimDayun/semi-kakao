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
    li {
        list-style: none;
    }
    .container {
        width: 1080px;
    }
    .banner{position: relative;}
    .banner div{position: absolute; top: 30%; left: 6%;}
    .banner div h2{font-size: 46px; color: #fff;}
    .banner div span{font-size: 24px; color: #fff; opacity: .5;}
    .banner img {
        width: 100%;
    }

    .white {
        padding: 15px 0;
    }

    .basket_option {}



    .border-line {
        border-bottom: 1px solid grey;
        padding-bottom: 80px;
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
    .cursor{cursor: pointer;}
    .cart-detail{margin: 30px 0;}
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
        color: black;
        font-weight: bold;
         margin: 0 3px;
        padding: 5px 40px; 
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
    
    
</style>

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 banner">
                <img src="../images/%EC%9E%A5%EB%B0%94%EA%B5%AC%EB%8B%88.PNG">
                <div>
                    <h2>장바구니</h2>
                    <span>Shopping cart</span>
                </div>
            </div>
        </div>
        <div class="row">

        </div>
        <div class="row">
            <div class="col-sm-8 ">
                <p class="text-left white">총 1개의 상품이 조회되었습니다.</p>
            </div>
            <div class="col-sm-4">

                <p class="text-right white"><input type="checkbox" value="option1"> <label class="btn btn-default">전체 선택</label>
                    <button type="button" class="btn btn-default">선택 삭제하기</button>
                </p>
            </div>
        </div>

            <div class="cart-detail"><!--1번 시작-->
                <div class="row line">
                    <div class="col-sm-3">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="blankCheckbox" value="option1" >
                            </label>
                            <img src="../images/1.jpg" width="120" height="120">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <a href=""><span class="product_title">배스가운</span></a>
                        <div class="desc_basket">
                            <li>금액 : <span>49,000원</span></li>
                            <li>옵션 : <span>-</span></li>
                            <li>수량 : <span>2</span></li>
                        </div>
                    </div>

                    <div class="col-sm-5 ">
                        <div class="row delete">
                            <span class="ico_friends ico_delete  glyphicon glyphicon-remove cursor"></span>
                        </div>
                    </div>
                </div>

                <div class="row white bg-box">
                    <div class="col-sm-6 center-box">
                        <button class="button btn btn-default">-</button>
                        <input class="amount" >
                        <button class="button btn btn-default">+</button>
                    </div>
                    <div class="col-sm-6 center-box">
                        <p>49000원</p>
                    </div>

                    <div class="row option-btn">
                        <button class="button btn btn-default">취소</button>
                        <button class="button btn btn-warning">변경</button>
                    </div>
                </div>
            </div><!--1번끝-->
            <div class="cart-detail"><!--2번시작-->
                <div class="row line">
                    <div class="col-sm-3">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
                            </label>
                            <img src="../images/1.jpg" width="120" height="120">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <a href=""><span class="product_title">배스가운</span></a>
                        <div class="desc_basket">
                            <li>금액 : <span>49,000원</span></li>
                            <li>옵션 : <span>-</span></li>
                            <li>수량 : <span>2</span></li>
                        </div>
                    </div>
                    <div class="col-sm-5 ">
                        <div class="row delete">
                            <span class="ico_friends ico_delete  glyphicon glyphicon-remove cursor"></span>
                        </div>
                    </div>
                </div>
                <div class="row white bg-box">
                    <div class="col-sm-6 center-box">
                        <button class="button btn btn-default">-</button>
                        <input class="amount" type="text" for="prEa_5768">
                        <button class="button btn btn-default">+</button>
                    </div>
                    <div class="col-sm-6 center-box">
                        <p>49000원</p>
                    </div>
                    <div class="row option-btn">
                        <button class="button btn btn-default">취소</button>
                        <button class="button btn btn-warning">변경</button>
                    </div>
                </div>
            </div><!--2번 끝-->
             
            <div class="row white border-line">
                <div class="col-sm-3">
                    <div class="row"><li><span class="final">장바구니 합계:</span></li></div>
                    <div class="row"><li><span class="final">배송비 :</span></li></div>
                </div>
                <div class="col-sm-3">
                    <div class="row "> <li><span class="final">64,000</span></li></div>
                        <div class="row "><li><span class="final"> 0원</span></li> </div>
                </div>
                <div class="col-sm-3">
                    <div class="row desc_basket"> </div>
                    <div class="row"><li><span class="final-price">총 결제금액  </span></li></div>
                </div>
                <div class="col-sm-3">
                    <div class="row desc_basket"> </div>
                    <div class="row"><li><span class="total-price2">64,000원</span></li></div>
                    </div>
                </div>
               <div class="buy_btn">
							<a href="/kr/index" class="btn_basket btn_continue"><span class="txt_g1">쇼핑 계속하기</span></a>
							<button type="btn_button_default" class="btn btn-default"><span class="txt_g">구매하기</span></button>
							<span class="btn_basket btn_dimmed" style="display: none"><span class="txt_g">구매하기</span></span> <!-- 비활성화 버튼 -->
						</div>
            </div>
    </div>

</body>

</html>