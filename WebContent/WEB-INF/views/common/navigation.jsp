<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="/kakao/test/css/nav.css">
  
 <style>
    .container{width: 1080px;}
    nav .icon{width: 200px;}
    .num_total {
	    position: absolute;
	    top: -15px;
	    left: 50%;
	    min-width: 24px;
	    height: 24px;
	    padding: 0 5px;
	    border-radius: 24px;
	    font-size: 14px;
	    line-height: 24px;
	    font-family: 'helvetica', sans-serif;
	    background-color: #ff3131;
	    color: #fff;
	    text-align: center;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	}
	nav .navigation {width: 430px;}
	nav .navigation>ul>li {width: 25%;}
	.icon #search-box{position: absolute; top: 27%; right: 600px; display: block;}
	.icon div input {width: 150px; font-size: 14px;}
	.icon .member-detail ul{width: 140px !important; height: 250px !important; position: absolute; top: 0px; left: -65px; border: 1px solid #333; background: #fff; z-index:11;}
	.glyphicon-search{cursor: pointer;}
	.inner-nav {
        text-align: center;
        background-color: #fff;
        padding: 0;
        width: 100%;
      }
	.jbFixed {
        position: fixed;
        top: 0px;
        border: 1px solid #ccc;
      }
      nav{height: auto;}
      a:hover{text-decoration: none;}
      nav .navigation>ul>li{text-align: left;}
      .icon #search-box {
	    position: absolute;
	    top: 27%;
	    right: 600px;
	    display: block;
		}
</style>

  

<script>
	$(function() {
	    $('.second-menu').mouseenter(function(event) {
	        //alert("aa");
	        event.stopImmediatePropagation();
	    })
	})
	function searchbox() {
		document.getElementById("search-box").innerHTML= '<input type="text" name="keyword" value="" placeholder="검색어를 입력하세요."/>';
		}
	
	 $( document ).ready( function() {
	        var jbOffset = $( 'nav' ).offset();
	        $( window ).scroll( function() {
	          if ( $( document ).scrollTop() > jbOffset.top ) {
	            $( 'nav' ).addClass( 'jbFixed' );
	          }
	          else {
	            $( 'nav' ).removeClass( 'jbFixed' );
	          }
	        });
	      } );
</script>

<div class="wrap">
    <!--내비바-->
    <nav>
        <div class="inner-nav">
            <div class="logo">
                <a href="/kakao/main.kakao"><img src="/kakao/test/image/logo.png" alt="logo"></a>
            </div>
            <div class="navigation">
                <ul>
                    <li class="hover sub-hover">
                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A" class="show-menu">카테고리</a>
                        <div class="nav-sub">
                            <div class="second-menu">
                                <h2>전체분류</h2>
                                <ul>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A">전체</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=1&type=A">신상품순</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=&sort=낮은가격순">낮은가격순</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=&sort=높은가격순">높은가격순</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=28&type=B">테마 기획전</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=29&type=S">배틀그라운드 <img class="img" src="/kakao/test/image/190510_GNBbanner_battlegrounds_W.png"></a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=30&type=S">허니프렌즈 <img class="img" src="/kakao/test/image/190425_GNBbanner_honey_W.png"></a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=31&type=S">아이앱 X 라이언&amp;콘 <img class="img" src="/kakao/test/image/190425_GNBbanner_iab_W.png"></a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=32&type=S">버블버블 <img class="img" src="/kakao/test/image/190402_GNB_bubblebubble_W.png"></a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=33&type=S">레이지선데이 <img class="img" src="/kakao/test/image/190329_GNBbanner_lazysunday_W.png"></a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=34&type=S">러블리 어피치 <img class="img" src="/kakao/test/image/190221_gnb_lovelyapeach_W.png"></a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=35&type=S">리틀 스케치북 <img class="img" src="/kakao/test/image/190213_GNB_littlesketchbook_W.png"></a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=38&type=S">트래블 프렌즈 <img class="img" src="/kakao/test/image/190213_GNB_travelfriends_W.png"></a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=40&type=B">인형/피규어</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=46&type=S">미니인형</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=48&type=S">중형인형</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=49&type=S">대형인형</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=50&type=S">키체인인형</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=51&type=S">피규어/브릭</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=60&type=B">리빙</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=61&type=S">쿠션/방석</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=80&type=S">주방용품</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=79&type=S">컵/텀블러</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=87&type=S">미용/욕실용품</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=88&type=S">생활소품/잡화</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=90&type=S">탈취/방향제</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=91&type=B">잡화</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=92&type=S">신발</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=97&type=S">파우치/지갑/가방</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=98&type=S">패션소품</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=99&type=S">우산</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=100&type=S">시즌잡화</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=78&type=B">의류</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=81&type=S">여성의류</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=82&type=S">남성의류</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=86&type=S">양말</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=73&type=B">쥬얼리</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=74&type=S">귀걸이</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=75&type=S">반지</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=76&type=S">가방참/핀뱃지</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=59&type=B">문구</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=65&type=S">필기구</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=66&type=S">필통/케이스</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=67&type=S">노트/메모</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=69&type=S">스티커</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=70&type=S">데스크 소품</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=71&type=S">카드/엽서</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=72&type=S">선물 포장</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=56&type=B">여행/레져</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=57&type=S">여행</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=58&type=S">스포츠</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="/kakao/product/cate_list.kakao?catno=47&type=B">생활테크</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=52&type=S">휴대폰 케이스</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=53&type=S">휴대폰 악세사리</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=54&type=S">노트북 악세서리</a></li>
                                                <li><a href="/kakao/product/cate_list.kakao?catno=55&type=S">소형 전자</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="character">
                                   <li class="title-li"><h1>캐릭터</h1></li>
                                    <li>
                                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=ryan&sort=신상품순" class="char-detail">
                                           <img src="/kakao/test/image/ryan.png">
                                            <strong>라이언</strong>
                                            <span>위로의 아이콘,<br>믿음직스러운 조언자</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=apeach&sort=신상품순" class="char-detail">
                                           <img src="/kakao/test/image/apeach.png">
                                            <strong>어피치</strong>
                                            <span>뒤태가 매력적인<br>애교만점 어피치</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=prodo&sort=신상품순" class="char-detail">
                                            <img src="/kakao/test/image/prodo.png">
                                            <strong>프로도</strong>
                                            <span>부잣집 도시개<br>프로도</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=neo&sort=신상품순" class="char-detail">
                                           <img src="/kakao/test/image/neo.png">
                                            <strong>네오</strong>
                                            <span>새침한 패셔니스타<br>네오</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=muzi&sort=신상품순" class="char-detail">
                                           <img src="/kakao/test/image/muzi.png">
                                            <strong>무지</strong>
                                            <span>토끼옷을 입은 무지</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=con&sort=신상품순" class="char-detail">
                                           <img src="/kakao/test/image/kon.png">
                                            <strong>콘</strong>
                                            <span>악어를 닮은<br>정체불명 콘</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=tube&sort=신상품순" class="char-detail">
                                           <img src="/kakao/test/image/tube.png">
                                            <strong>튜브</strong>
                                            <span>화나면 미친오리로<br>변신하는 튜브</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/kakao/product/cate_list.kakao?catno=1&type=A&pno=1&character=jayg&sort=신상품순" class="char-detail">
                                           <img src="/kakao/test/image/jayz.png">
                                            <strong>제이지</strong>
                                            <span>힙합을 사랑하는<br>자유로운 영혼</span>
                                        </a>
                                    </li>
                                    
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li class="hover"><a href="/kakao/store/storelist.kakao">매장안내</a></li>
                    <li class="hover"><a href="/kakao/notice/notice.kakao?pno=1">고객센터</a></li>
                    <c:if test="${'admin'eq LOGINMEMBER.id }">
                   		<li><a href="/kakao/admin/main.kakao">관리자</a></li>
                    </c:if>
                </ul>
            </div>
            
            <div class="icon">
            	<form action="/kakao/product/search.kakao">
	            	<div id="search-box">
	            		
	            	</div>
            	</form>
                <ul>
                    <li><span class="glyphicon glyphicon-search" onclick="searchbox()"></span></li>
                    
                    <c:if test="${empty LOGINMEMBER }">
	                    <li class="member"><a href="/kakao/member/loginform.kakao" class="glyphicon glyphicon-user"></a>
	                        <div class="member-detail">
	                            <ul>
	                                <li><a href="/kakao/member/loginform.kakao">로그인</a></li>
	                                <li><a href="/kakao/member/joinform.kakao">회원가입</a></li>
	                                <li><a href="/kakao/mypage/mypage.kakao">주문내역</a></li>
	                                <li><a href="/kakao/mypage/likes.kakao">찜</a></li>
	                                <li><a href="/kakao/mypage/point.kakao">포인트</a></li>
	                                <li><a href="/kakao/mypage/qna.kakao">1:1 문의</a></li>
	                            </ul>
	                        </div>
	                    </li>
                    </c:if>
                    <c:if test="${not empty LOGINMEMBER }">
	                    <li class="member"><a href="/kakao/mypage/editmyinfo.kakao?tab=4" class="glyphicon glyphicon-user"></a>
	                        <div class="member-detail">
	                            <ul>
	                                <li><a href="/kakao/member/logout.kakao">로그아웃</a></li>
	                                <li><a href="/kakao/mypage/mypage.kakao?tab=1">주문내역</a></li>
	                                <li><a href="/kakao/mypage/likes.kakao?tab=2">찜</a></li>
	                                <li><a href="/kakao/mypage/point.kakao?tab=3">포인트</a></li>
	                                <li><a href="/kakao/mypage/editmyinfo.kakao?tab=4">개인정보</a></li>
	                                <li><a href="/kakao/mypage/qna.kakao?tab=5">1:1 문의</a></li>
	                            </ul>
	                        </div>
	                    </li>
                    </c:if>
	                <li>
	                	<a href="/kakao/cart/cart.kakao" class="glyphicon glyphicon-shopping-cart">
	                <c:if test="${not empty LOGINMEMBER }">
	                	<span class="num_total">${countCarts }</span>
                	</c:if>
	                	</a>
	                </li>
                </ul>
            </div>
        </div>
    </nav>
    </div>
<script type="text/javascript">
	
</script>