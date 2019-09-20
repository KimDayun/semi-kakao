<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/kakao/test/admin/css/kakao-admin.css">
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<style>
    label {line-height: 40px;}
    .admin-line-height {line-height: 40px;}
</style>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
		<c:set var="menu" value="store" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">매장정보</h1>
				<div class="well">
					<form method="post" action="insertStore.kakao" onsubmit="checkValue(event)">
					<input type="hidden" name="pno"	value="${param.pno }" id="store-pno" />
					<input type="hidden" name="no"	value="${no }" />
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>매장번호</label>
								</div>
								<div class="col-xs-1">
									<input type="text" disabled="disabled" name="storeno" id="store-no" class="form-control" value="${no }" />
								</div>
							</div>
							</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>매장명</label>
								</div>
								<div class="col-xs-11">
									<input type="text" name="name" id="store-name" class="form-control" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>지역</label>
								</div>
								<div class="col-xs-2">
									<select class="form-control" name="city" id="store-city">
                                        <option value="" selected="selected" disabled="disabled">---- 도시 ----</option>
                                        <option ${store.city == '서울' ? 'selected' :  ''} value="서울">서울</option>
                                        <option ${store.city == '경기' ? 'selected' :  ''} value="경기">경기</option>
                                        <option ${store.city == '인천' ? 'selected' :  ''} value="인천">인천</option>
                                        <option ${store.city == '대구' ? 'selected' :  ''} value="대구">대구</option>
                                        <option ${store.city == '부산' ? 'selected' :  ''} value="부산">부산</option>
                                        <option ${store.city == '제주' ? 'selected' :  ''} value="제주">제주</option>
                                        <option ${store.city == '대전' ? 'selected' :  ''} value="대전">대전</option>
                                    </select>
								</div>
								<div class="col-xs-1">
									<label>주소</label>
								</div>
								<div class="col-xs-7">
									<input type="text" name="address" id="store-address" value="${store.address }" class="form-control"/>
								</div>
								
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								
								<div class="col-xs-1">
									<label>전화번호</label>
								</div>
								<div class="col-xs-3">
									<input type="text" name="phone" id="store-phone" value="${store.phone }" class="form-control"/>
								</div>
								<div class="col-xs-1">
									<label>영업시간</label>
								</div>
								<div class="col-xs-3">
									<input type="text" name="businessHours" id="store-business-hours" value="${store.businessHours }" class="form-control"/>
								</div>
								<!-- <div class="row admin-line-height">
								    <div class="col-xs-1">
                                       <label>영업여부</label>
                                    </div>
                                    <div class="col-xs-1">
	                                       <input type="checkbox" name="displayYn" id="store-display-yn" value="Y" checked="checked" />
                                    </div>
                                </div> -->
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>위도</label>
								</div>
								<div class="col-xs-3">
									<input type="text" name="latitude" id="store-latitude" value="${store.latitude }" class="form-control"/>
								</div>
								<div class="col-xs-1">
									<label>경도</label>
								</div>
								<div class="col-xs-3">
									<input type="text" name="longitude" id="store-longitude" value="${store.longitude }" class="form-control"/>
								</div>
							</div>
						</div>
						
						<div class="text-right">
							<input type="submit" id="change-info" class="btn btn-warning" value="등록">
							<a href="list.kakao?pno=${param.pno }" class="btn btn-default">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function checkValue(event){
			
			var nameSt = document.getElementById("store-name").value;
			if(nameSt == ""){
				alert("매장명을 입력해주세요");
				event.preventDefault();
				return false;
			}
			
			var citySt = document.getElementById("store-city").value;
			if(citySt == ""){
				alert("도시를 선택해주세요")
				event.preventDefault();
				return false;
			}
			var addressSt = document.getElementById("store-address").value;
			if(addressSt == ""){
				alert("주소를 입력해주세요")
				event.preventDefault();
				return false;
			}
			var phoneSt = document.getElementById("store-phone").value;
			if(phoneSt == ""){
				alert("전화번호를 입력해주세요")
				event.preventDefault();
				return false;
			}
			var timeSt = document.getElementById("store-business-hours").value;
			if(timeSt == ""){
				alert("영업시간을 입력해주세요")
				event.preventDefault();
				return false;
			}
			var latiSt = document.getElementById("store-latitude").value;
			if(latiSt == ""){
				alert("위도를 입력해주세요")
				event.preventDefault();
				return false;
			}
			var longSt = document.getElementById("store-longitude").value;
			if(longSt == ""){
				alert("경도를 입력해주세요")
				event.preventDefault();
				return false;
			}
		}
	</script>
</body>
</html>