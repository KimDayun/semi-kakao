<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        a {
            text-decoration: none !important;
        }

        .text {
            margin-top: 50px;
        }
    </style>

    <div class="wrap">
        <div class="bg-wrap">
            <div class="container">
				  
                <div class="row front">
                    <div class="col-sm-12  ">
                        <h4 class="hello">안녕하세요,</h4>
                        <h3 class="hello">${member.name } 님</h3>
                        <p><span class="glyphicon glyphicon-comment"> ${member.email }</span></p>
                    </div>
                </div>
        	     
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="row topbar1">
            <div class="col-sm-6 topone">
                <p class="point">적립포인트</p>
                <p class="pointamount">${member.point } 포인트</p>
                <p class="available">${member.point } 포인트<span class="av">사용가능</span></p>
            </div>
            
 		
            <div class="col-sm-3 topone border">
                <p class="topmiddletext">배송중</p>
                <p class="amount">${deliveryCount } 개</p>
            </div>
         
            <div class="col-sm-3 topone border">
                <p class="topmiddletext">취소</p>
                <p class="amount">${cancelCount } 개</p>
            </div>
          
            
        </div>
    
    
    <div class="row" style="margin-bottom: 20px;">
    	<ul class="nav nav-tabs nav-justified">
		  <li role="presentation" class="${param.tab eq 1 ? 'active' : '' }"><a href="/kakao/mypage/mypage.kakao?tab=1" class="link_tab">주문 내역</a></li>
		  <li role="presentation" class="${param.tab eq 2 ? 'active' : '' }"><a href="likes.kakao?tab=2" class="link_tab">찜</a></li>
		  <li role="presentation" class="${param.tab eq 3 ? 'active' : '' }"><a href="point.kakao?tab=3" class="link_tab">포인트</a></li>
		  <li role="presentation" class="${param.tab eq 4 ? 'active' : '' }"><a href="editmyinfo.kakao?tab=4" class="link_tab">개인정보</a></li>
		  <li role="presentation" class="${param.tab eq 5 ? 'active' : '' }"><a href="qna.kakao?tab=5" class="link_tab">1:1문의</a></li>
		</ul>
    </div>
   
 </div>