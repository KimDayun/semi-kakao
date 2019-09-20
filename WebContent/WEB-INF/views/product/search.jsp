<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KAKAO FRIENDS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/kakao/test/css/main.css">
	<link rel="stylesheet" href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" ></script>
	<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
	<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
   <style> .container{width: 1080px; }
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
            color: #000 !important;
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
            letter-spacing: -1.4px;
        }

        .desc_total .emph_total .inp_g {
            font-weight: bold;
            color: #222;
        }
        .cate_item {padding-top: 16px; padding-bottom: 40px;}
        .cate_item a:hover{text-decoration: none;}
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
        .caption h3, .caption strong, .caption p{
        	color : #333 !important;
        }
        .caption h3{
        	white-space: nowrap;
			word-wrap: normal;
			text-overflow : ellipsis;
			overflow: hidden;
		}
		.bluelight {
			background-color : skyblue;
		}
		.yellowlight {
			background-color : #ffce02;
		}
		.btn-group{float: right;}
		.title{text-align: center; font-size: 30px; }
		.title strong{letter-spacing: 10px;}
		.desc_total {font-size: 16px;}
    </style>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
  	<form action="" id="list-form">
  		<input type="hidden" id="page-no" name="pno" value="${param.pno }">
  		<input type="hidden" id="keyword" name="keyword" value="${param.keyword }">
	    <div class="container">
	    	<h3 class="title">" <strong>${param.keyword }</strong>"</h3>
	        <div class="row head_product">
	            <div class="col-sm-3">
	                <p class="desc_total">
	                    총<strong> ${cnt }개 </strong>의 상품이 조회되었습니다.
	                </p>
	            </div>
	            <div class="col-sm-9 text-right">
	                <div class="btn-group">
	                    <select class="form-control" name="sort" onchange="sendform(1);">
	                        <option value="신상품순" ${param.sort eq '신상품순' ? "selected" : "" }>신상품순</option>
	                        <option value="낮은가격순" ${param.sort eq '낮은 가격순' ? "selected" : "" }>낮은가격순</option>
	                        <option value="높은가격순" ${param.sort eq '높은 가격순' ? "selected" : "" }>높은가격순</option>
	                    </select>
	                </div>
	            </div>
	        </div>
	
	        <div class="row ">
	            <c:forEach var="product" items="${products }">
	                <div class="col-sm-3 cate_item">
	                    <a href="/kakao/product/detail.kakao?no=${product.no }">
	                        <img src="/kakao/test/image/${product.imgName }" class="img-rounded" style="max-width: 100%;">
	                        <div class="caption">
	                            <h3><strong>${product.name }</strong></h3>
	                            <p>
	                                <fmt:formatNumber>${product.price }</fmt:formatNumber>원
	                            </p>
	                        </div>
	                    </a>
	                    <button class="btn btn-default btn-sm glyphicon glyphicon-plane ${product.globalYn eq 'Y' ? 'bluelight' : ''}"></button>
	
	                    <button class="btn btn-default btn-sm glyphicon glyphicon-lock ${product.cnt gt 0 ? 'yellowlight' : ''}" type="button" id="add-button" onclick="addcart(${product.no })"></button>
	
	                </div>
	            </c:forEach>
	        </div>
	
	        <div class="row">
	            <div class="col-sm-12 paging" >
	                <div class="paging_friends">
	                    <span class="inner_paging">
	                    	<c:choose>
	                    		<c:when test="${not pagination.first }">
			                        <a href="" class="link_page" onclick="goPage(event, ${pagination.page - 1})">
			                        <span class="ico_newfriends_v1 ico_prev glyphicon glyphicon-chevron-left"><!--이전--></span></a>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<li><a href="#"></a></li>
	                    		</c:otherwise>
	                    	</c:choose>
	                        
	                        <c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
	                        	<c:choose>
	                        		<c:when test="${num eq pagination.page }">
				                        <em class="link_page">${num }</em>
	                        		</c:when>
	                        		<c:otherwise>
				                        <a href="javascript:sendform(${num })" class="link_page">${num }</a>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </c:forEach>
	                        
	                        <c:choose>
	                        	<c:when test="${not pagination.last }">
			                        <a href="" class="link_page" onclick="goPage(event, ${pagination.page + 1})">
			                        <span class="ico_newfriends_v1 ico_next glyphicon glyphicon-chevron-right"><!--다음--></span></a>
	                        	</c:when>
	                        	<c:otherwise>
									<li><a href="#"></a></li>
								</c:otherwise>
	                        </c:choose>
	                    </span>
	                </div>
	            </div>
	        </div>
	    </div>
    </form>
    
    <script type="text/javascript">
    
	    function sendform(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("list-form").submit()
			
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
			xhr.open("GET", "addcart.kakao?pno="+pno);
			xhr.send();
		}
	    function goPage(event, pno){
    		event.preventDefault();
    		sendform(pno);
    	}
    </script>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>