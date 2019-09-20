<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
        .container{width: 1080px; }
        a:hover {
            text-decoration: none;
            color: #1e1e1e;
        }
        a {
            color: #1e1e1e;
        }
        .cate_main {height: 300px; background:#ccc; overflow: hidden; padding: 0px;}
        .cate_main h2 {display: inline-block; overflow: hidden; overflow: hidden;
                        position: absolute; left: 40px; top: 104px; width: 100%; font-weight: normal; font-size: 46px;
                        color: #fff; text-overflow: ellipsis; white-space: nowrap;}
        .cate_main img { height: 100%; margin: 0 -660px;}
        .emph_en {
            overflow: hidden;
            position: absolute;
            left: 40px;
            top: 176px;
            width: 100%;
            font-size: 24px;
            color: #fff;
            text-overflow: ellipsis;
            white-space: nowrap;
            opacity: 0.5;
        }
        .head_product {
            padding: 15px 0 2px;
        }
        .tab_friends {
            padding: 8px 0 14px;
        }
        .tab_friends li {
            float: left;
            list-style: none;
            padding: 7px 0px;
            font-size: 18px;
        }
        .tab_friends li:first-child .link_tab {
            padding-left: 0;
        }
        .tab_friends .link_tab {
            position:relative;
            padding: 7px 11px 7px 13px;
            font-size: 18px;
            color: #999;
        }
        .tab_friends .link_tab::before {
                position: absolute;
            top: 43%;
            left: 0;
            width: 4px;
            height: 4px;
            margin-top: -1px;
            border-radius: 3px;
            background-color: #ccc;
            vertical-align: top;
            content: '';
        }
        .hightlight {
            font-weight: bold;
            color: #1e1e1e;
        }
        .border {
            width: 100%;
            border-bottom: 1px solid #222;
        }
        /* 상품리스트 상단 정보공통 */
        .head_product {
            padding-top: 15px;
        }
        .desc_total {
            font-size: 17px;
            color: #666;
            letter-spacing: -1px;
        }

        .desc_total .emph_total .inp_g {
            font-weight: bold;
            color: #222;
        }
        .cate_item {padding-top: 16px; padding-bottom: 40px;}
        .btn {background-color: #d9d9d9; color: #fff;}
        hr {color: black; border: 3px;}
        
        .paging_friends {
            width: 100%;
            padding-top: 50px;
            text-align: center;
            margin-bottom: 52px;
        }
        .paging_friends .inner_paging {
            display: inline-block;
            margin-left: -5px;
            vertical-align: top;
        }
        .paging_friends .link_page {
            display: inline;
            overflow: hidden;
            float: left;
            min-width: 32px;
            height: 32px;
            margin-left: 5px;
            border: 0 none;
            border-radius: 32px;
            font-size: 16px;
            line-height: 31px;
            color: #666;
            text-align: center;
        }
        .paging_friends em.link_page {
            font-weight: bold;
            color: #fff;
            background-color: #1e1e1e;
        }
        .paging {
            border-top: 1px solid black;
        
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 cate_main">
                <h2>카테고리</h2>
                <em class="emph_en">Category</em>
                <img src="image/cate_main.jpg">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 border">
                <div class="wrap_tap">
                    <ul class="tab_friends">
                        <li><a href="" class="link_tab">전체</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">배틀그라운드</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">허니프렌즈</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">아이앱 X 라이언&콘</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">버블버블</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">레이지선데이</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">러블리 어피치</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">리틀 스케치북</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">허그미 프렌즈</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">커버낫 X 라이언</a></li>
                        <li><a href="a.ka?cat=#"  class="link_tab ${param.cat == '#' : 'hightlight' : ''}">트레블 프렌즈</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row head_product">
            <div class="col-sm-3">
                <p class="desc_total">
                    총<strong> ${allCount }개 </strong>의 상품이 조회되었습니다.
                </p>
            </div>
            <div class="col-sm-3">
                <input type="checkbox" id="checkDelivery" name="chk" class="inp_g">글로벌 배송 기능 상품보기
            </div>
            <div class="col-sm-6 text-right">
                <div class="btn-group">
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    캐릭터 <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">전체캐릭터</a></li>
                    <li><a href="#">라이언</a></li>
                    <li><a href="#">무지</a></li>
                    <li><a href="#">어피치</a></li>
                    <li><a href="#">프로도</a></li>
                    <li><a href="#">네오</a></li>
                    <li><a href="#">튜브</a></li>
                    <li><a href="#">제이지</a></li>
                    <li><a href="#">콘</a></li>
                  </ul>
                </div>
                <div class="btn-group">
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    신상품순 <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">신상품순</a></li>
                    <li><a href="#">낮은가격순</a></li>
                    <li><a href="#">높은가격순</a></li>
                  </ul>
                </div>
            </div>
        </div>
        <div class="row ">
        	<c:forEach var="product" items="${allProducts }">
            <div class="col-sm-3 cate_item">
                <a href="">
                    <img src="/kakao/test/image/${product.imgName }" class="img-rounded" style="max-width: 100%;">
                    <div class="caption">
                        <h3><strong>${product.name }</strong></h3>
                        <p><fmt:formatNumber>${product.price }</fmt:formatNumber>원</p>
                        <button class="btn btn-default btn-sm glyphicon glyphicon-plane"></button>
                        <button class="btn btn-default btn-sm glyphicon glyphicon-lock"></button>
                    </div>
                </a>
            </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-sm-12 paging" >
                <!--<div class="pagination list-unstyled clearfix">
                    <li
                </div>-->
                <div class="paging_friends">
                    <span class="inner_paging">
                        <a href="/kr/products/groups/categories/3/pages/1" class="link_page">
                        <span class="ico_newfriends_v1 ico_prev glyphicon glyphicon-chevron-left"><!--이전--></span></a>
                        <em class="link_page">1</em>
                        <a href="/kr/products/groups/categories/3/pages/2" class="link_page">2</a>
                        <a href="/kr/products/groups/categories/3/pages/3" class="link_page">3</a>
                        <a href="/kr/products/groups/categories/3/pages/4" class="link_page">4</a>
                        <a href="/kr/products/groups/categories/3/pages/5" class="link_page">5</a>
                        <a href="/kr/products/groups/categories/3/pages/6" class="link_page">
                        <span class="ico_newfriends_v1 ico_next glyphicon glyphicon-chevron-right"><!--다음--></span></a>
                    </span>
                </div>
                
            </div>
        </div>
    </div>
</body>
</html>