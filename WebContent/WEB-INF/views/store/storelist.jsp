<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>KAKAO FRIENDS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <style>
        .container {
        	padding: 0px; 
            width: 1080px;
        }

        div {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
    <div class="container text-center">
        <div class="row" style="margin-bottom: 15px;">
            <div class="col-sm-12">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="storelist.kakao">전지역</a></li>
					<li class="${local eq '서울' ? 'active' : '' }"><a href="localstore.kakao?local=서울">서울</a></li>
					<li class="${local eq '경기' ? 'active' : '' }"><a href="localstore.kakao?local=경기">경기</a></li>
					<li class="${local eq '인천' ? 'active' : '' }"><a href="localstore.kakao?local=인천">인천</a></li>
					<li class="${local eq '대구' ? 'active' : '' }"><a href="localstore.kakao?local=대구">대구</a></li>
					<li class="${local eq '부산' ? 'active' : '' }"><a href="localstore.kakao?local=부산">부산</a></li>
					<li class="${local eq '제주' ? 'active' : '' }"><a href="localstore.kakao?local=제주">제주</a></li>
					<li class="${local eq '대전' ? 'active' : '' }"><a href="localstore.kakao?local=대전">대전</a></li>
                </ul>
            </div>
        </div>

        <div class="row">
        	<c:forEach var="store" items="${stores }">
            <div class="col-sm-4 text-left" style="width: 338px; height: 460px;">
                <div class="panel panel-default">
                    <div id="map-${store.no }" style="width: 100%; height: 200px;"></div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f31112399734ccd8e89f0bbd1bb48d87&libraries=services"></script>
                	<script>
                		var mapContainer = document.getElementById('map-${store.no}'), // 지도를 표시할 div 
					    mapOption = {
					        center: new daum.maps.LatLng(${store.latitude}, ${store.longitude}), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('${store.city} ${store.address}', function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     if (status === daum.maps.services.Status.OK) {
						
						        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
				    </script>
                    <div class="panel-body">
                        <p style="font-size: 25px;"><strong>${store.name }</strong></p>
                        <p><span class="glyphicon glyphicon-phone-alt"></span> ${store.phone }</p>
                        <p><span class="glyphicon glyphicon-time"></span> ${store.businessHours }</p>
                        <p><span class="glyphicon glyphicon-map-marker"></span> ${store.city} ${store.address }</p>
                    </div>
                </div>
            </div>
        	</c:forEach>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body></html>