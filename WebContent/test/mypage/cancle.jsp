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
    <style>
        .front {
            color: black;
            background-color: #ffdc00;
            height: 150px;
        }

        .wrap {
            width: 100%;
        }

        .bg-wrap {
            width: 100%;
            padding: 40px 0;
            background: #ffdc00
        }

        .point {
            margin-bottom: 26px;
            padding-top: 1px;
            font-size: 22px;
            line-height: 1;
        }

        .topmiddletext {
            color: #1e1e1e;
            font-size: 16px;
        }

        .hello {
            display: block;
            font-weight: normal;
            font-size: 36px;
            line-height: 42px;
        }

        .topbar1 {
            padding: 70px;
        }

        .topbar2 {
            padding: 50px;
            font: 20px;
            border-bottom: 1px solid darkgrey;
        }

        .link_tab {
            font-size: 22px;
            color: black;
            line-height: 1px;
        }

        .amount {
            font-size: 30px;
            line-height: 1;
        }

        .pointamount {
            font-size: 30px;
            line-height: 1;
            float: right;
            padding: 30px;
        }

        .av {
            color: darkgrey;
        }

        .available {
            padding: 35px;
        }

        .topone {
            border-right: 1px solid darkgrey;
        }

        .border {
            height: 149px;
        }

        .select {
            border-bottom: 8px solid #ffdc00;
        }

        .boxbox {
            padding: 50px;
        }

        a {
            text-decoration: none !important;
        }
    </style>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
    <div class="wrap">
        <div class="bg-wrap">
            <div class="container">

                <div class="row front">
                    <div class="col-sm-12  ">
                        <h4 class="hello">안녕하세요,</h4>
                        <h3 class="hello">고객 님</h3>
                        <p><span class="glyphicon glyphicon-comment">heekyung@naver.com</span></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row topbar1">
                <div class="col-sm-6 topone">
                    <p class="point">적립포인트</p>
                    <p class="pointamount">1000</p>
                    <p class="available">0p<span class="av">사용가능</span></p>
                </div>
                <div class="col-sm-3 topone border">
                    <p class="topmiddletext">배송중</p>
                    <p class="amount">0</p>

                </div>
                <div class="col-sm-3 topone border">
                    <p class="topmiddletext">취소</p>
                    <p class="amount">0</p>
                </div>
            </div>
        </div>


        <div class="container middleoption">
            <div class="row topbar2">
                <div class="col-sm-2 ">
                    <a href="" class="link_tab">주문 내역</a>
                </div>
                <div class="col-sm-2">
                    <a href="" class="link_tab">찜</a>
                </div>
                <div class="col-sm-2">
                    <a href="" class="link_tab"> <span class="select">취소</span></a>
                </div>
                <div class="col-sm-2">
                    <a href="" class="link_tab">포인트</a>
                </div>
                <div class="col-sm-2">
                    <a href="" class="link_tab">개인정보</a>
                </div>
                <div class="col-sm-2">
                    <a href="" class="link_tab">1:1문의</a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row boxbox">
                <div class="col-sm-12 box">
                    <div class="col-sm-2">
                        <input type="checkbox">
                        <span class="ordernumber">105452</span>
                    </div>
                    <div class="col-sm-2">
                        <img src="../images/1.jpg" width="120" height="120">
                    </div>
                    <div class="col-sm-3">
                        <p class="elements">아마레 장우산</p>
                    </div>
                    <div class="col-sm-2">
                        <p class="elements">2000원</p>
                    </div>
                    <div class="col-sm-2">
                        <p class="elements">1개</p>
                    </div>
                    <div class="row ">
                        <a href=""><button class="button btn btn-default">취소하기</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="../common/footer.jsp"%>
</body>

</html>