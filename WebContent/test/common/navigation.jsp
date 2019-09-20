<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/kakao/test/css/nav.css">
  <link rel="stylesheet" href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
  <script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
  
 <style>
    .container{width: 1080px;}
</style>

  
</head>
<script>
$(function() {
    $('.second-menu').mouseenter(function(event) {
        //alert("aa");
        event.stopImmediatePropagation();
    })
})
</script>
<body>
<div class="wrap">
    <!--내비바-->
    <nav>
        <div class="inner-nav">
            <div class="logo">
                <a href="/kakao/test/main.jsp"><img src="/kakao/test/image/logo.png" alt="logo"></a>
            </div>
            <div class="navigation">
                <ul>
                    <li class="hover sub-hover">
                        <a href="" class="show-menu">카테고리</a>
                        <div class="nav-sub">
                            <div class="second-menu">
                                <h2>전체분류</h2>
                                <ul>
                                    <li class="second-hover">
                                        <a href="#">전체</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">신상품순</a></li>
                                                <li><a href="">낮은가격순</a></li>
                                                <li><a href="">높은가격순</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">테마 기획전</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li>
                                                    <a href="">배틀그라운드 <img class="img" src="/kakao/test/image/190510_GNBbanner_battlegrounds_W.png"></a>
                                                </li>
                                                <li><a href="">허니프렌즈 <img class="img" src="/kakao/test/image/190425_GNBbanner_honey_W.png"></a></li>
                                                <li><a href="">아이앱 X 라이언&amp;콘 <img class="img" src="/kakao/test/image/190213_GNB_travelfriends_W.png"></a></li>
                                                <li><a href="">버블버블 <img class="img" src="/kakao/test/image/190213_GNB_littlesketchbook_W.png"></a></li>
                                                <li><a href="">레이지선데이 <img class="img" src="/kakao/test/image/190329_GNBbanner_lazysunday_W.png"></a></li>
                                                <li><a href="">러블리 어피치 <img class="img" src="/kakao/test/image/190425_GNBbanner_honey_W.png"></a></li>
                                                <li><a href="">리틀 스케치북 <img class="img" src="/kakao/test/image/20181002_angmond_GNB_W@2x.png"></a></li>
                                                <li><a href="">허그미 프렌즈 <img class="img" src="/kakao/test/image/190212_GNB_hugme_W.png"></a></li>
                                                <li><a href="">커버낫 X 라이언 <img class="img" src="/kakao/test/image/190425_GNBbanner_iab_W.png"></a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">인형/피규어</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">미니인형</a></li>
                                                <li><a href="">중형인형</a></li>
                                                <li><a href="">대형인형</a></li>
                                                <li><a href="">키체인인형</a></li>
                                                <li><a href="">피규어/브릭</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">리빙</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">쿠션/방석</a></li>
                                                <li><a href="">컵/텀블러</a></li>
                                                <li><a href="">주방용품</a></li>
                                                <li><a href="">미용/욕실용품</a></li>
                                                <li><a href="">생활소품/잡화</a></li>
                                                <li><a href="">푸드</a></li>
                                                <li><a href="">탈취/방향제</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">잡화</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">신발</a></li>
                                                <li><a href="">파우치/지갑/가방</a></li>
                                                <li><a href="">패션소품</a></li>
                                                <li><a href="">우산</a></li>
                                                <li><a href="">시즌잡화</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">의류</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">여성의류</a></li>
                                                <li><a href="">남성의류</a></li>
                                                <li><a href="">상의</a></li>
                                                <li><a href="">잠옷</a></li>
                                                <li><a href="">속옷</a></li>
                                                <li><a href="">양말</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">쥬얼리</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">귀걸이</a></li>
                                                <li><a href="">반지</a></li>
                                                <li><a href="">가방참/핀뱃지</a></li>
                                                <li><a href="">헤어스트링</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">문구</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">필기구</a></li>
                                                <li><a href="">필통/케이스</a></li>
                                                <li><a href="">노트/메모</a></li>
                                                <li><a href="">파일</a></li>
                                                <li><a href="">스티커</a></li>
                                                <li><a href="">데스크 소품</a></li>
                                                <li><a href="">카드/엽서</a></li>
                                                <li><a href="">선물 포장</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">여행/레져</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">여행</a></li>
                                                <li><a href="">스포츠</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">생활테크</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">휴대폰 케이스</a></li>
                                                <li><a href="">휴대폰 악세사리</a></li>
                                                <li><a href="">휴대폰 악세서리</a></li>
                                                <li><a href="">노트북 악세서리</a></li>
                                                <li><a href="">소형 전자</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="second-hover">
                                        <a href="#">니니즈</a>
                                        <div class="third-menu">
                                            <ul>
                                                <li><a href="">케로&amp;베로니</a></li>
                                                <li><a href="">앙몬드</a></li>
                                                <li><a href="">스카피</a></li>
                                                <li><a href="">죠르디</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="character">
                                   <li class="title-li"><h1>캐릭터</h1></li>
                                    <li>
                                        <a href="" class="char-detail">
                                           <img src="/kakao/test/image/ryan.png">
                                            <strong>라이언</strong>
                                            <span>위로의 아이콘,<br>믿음직스러운 조언자</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="char-detail">
                                           <img src="/kakao/test/image/apeach.png">
                                            <strong>어피치</strong>
                                            <span>뒤태가 매력적인<br>애교만점 어피치</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="char-detail">
                                            <img src="/kakao/test/image/prodo.png">
                                            <strong>프로도</strong>
                                            <span>부잣집 도시개<br>프로도</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="char-detail">
                                           <img src="/kakao/test/image/neo.png">
                                            <strong>네오</strong>
                                            <span>새침한 패셔니스타<br>네오</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="char-detail">
                                           <img src="/kakao/test/image/muzi.png">
                                            <strong>무지</strong>
                                            <span>토끼옷을 입은 무지</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="char-detail">
                                           <img src="/kakao/test/image/kon.png">
                                            <strong>콘</strong>
                                            <span>악어를 닮은<br>정체불명 콘</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="char-detail">
                                           <img src="/kakao/test/image/tube.png">
                                            <strong>튜브</strong>
                                            <span>화나면 미친오리로<br>변신하는 튜브</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="char-detail">
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
                    <li class="hover"><a href="/kakao/test/qna/qna.jsp">고객센터</a></li>
                </ul>
            </div>
            <div class="icon">
                <ul>
                    <li><a href="" class="glyphicon glyphicon-search"></a></li>
                    <li class="member"><a href="" class="glyphicon glyphicon-user"></a>
                        <div class="member-detail">
                            <ul>
                                <li><a href="/kakao/test/member/loginform.jsp">로그인</a></li>
                                <li><a href="">주문내역</a></li>
                                <li><a href="">찜</a></li>
                                <li><a href="">취소 및 교환</a></li>
                                <li><a href="">포인트</a></li>
                                <li><a href="">1:1 문의</a></li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="" class="glyphicon glyphicon-shopping-cart"></a></li>
                </ul>
            </div>
        </div>
    </nav>
    </div>

</body>
</html>