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
					<form method="post" action="updateStore.kakao" enctype="application/x-www-form-urlencoded" onsubmit="checkValue(event)">
					<input type="hidden" name="pno"	value="${param.pno }" id="store-pno" />
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>매장번호</label>
								</div>
								<div class="col-xs-1">
									<input type="text" disabled="disabled" name="no" id="store-no" class="form-control" value="${store.no }" />
								</div>
							</div>
							</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>매장명</label>
								</div>
								<div class="col-xs-11">
									<input type="text" disabled="disabled" name="name" id="store-name" class="form-control" value="${store.name }" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>지역</label>
								</div>
								<div class="col-xs-2">
									<select class="form-control" name="city" id="store-city" disabled="disabled">
                                        <option value="" disabled="disabled">---- 도시 ----</option>
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
									<input type="text" name="address" id="store-address" value="${store.address }" disabled="disabled" class="form-control"/>
								</div>
								
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								
								<div class="col-xs-1">
									<label>전화번호</label>
								</div>
								<div class="col-xs-3">
									<input type="text" name="phone" id="store-phone" value="${store.phone }" disabled="disabled" class="form-control"/>
								</div>
								<div class="col-xs-1">
									<label>영업시간</label>
								</div>
								<div class="col-xs-3">
									<input type="text" name="businessHours" id="store-business-hours" value="${store.businessHours }" disabled="disabled" class="form-control"/>
								</div>
								<div class="row admin-line-height">
								    <div class="col-xs-1">
                                       <label>영업여부</label>
                                    </div>
                                    <div class="col-xs-1">
	                                    <c:if test="${store.displayYn eq 'Y' }">
	                                       <input type="checkbox" name="displayYn" id="store-display-yn" disabled="disabled" value="Y" checked="checked" />
	                                    </c:if>
	                                    <c:if test="${store.displayYn eq 'N' }">
	                                       <input type="checkbox" name="displayYn" id="store-display-yn" disabled="disabled" value="N" />
	                                    </c:if>
                                    </div>
                                </div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>위도</label>
								</div>
								<div class="col-xs-3">
									<input type="text" name="latitude" id="store-latitude" value="${store.latitude }" disabled="disabled" class="form-control"/>
								</div>
								<div class="col-xs-1">
									<label>경도</label>
								</div>
								<div class="col-xs-3">
									<input type="text" name="longitude" id="store-longitude" value="${store.longitude }" disabled="disabled" class="form-control"/>
								</div>
							</div>
						</div>
						
						<div class="text-right">
							<input type="button" id="change-info" onclick="changeDisplay();" class="btn btn-warning" value="수정">
							<a href="list.kakao?pno=${param.pno }" class="btn btn-default">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	function changeDisplay() {
		if((document.getElementById("change-info").value) === "수정") {
			document.getElementById("change-info").value = "등록";
			document.getElementById("store-name").removeAttribute("disabled");
			document.getElementById("store-city").removeAttribute("disabled");
			document.getElementById("store-address").removeAttribute("disabled");
			document.getElementById("store-phone").removeAttribute("disabled");
			document.getElementById("store-business-hours").removeAttribute("disabled");
			document.getElementById("store-display-yn").removeAttribute("disabled");
			document.getElementById("store-latitude").removeAttribute("disabled");
			document.getElementById("store-longitude").removeAttribute("disabled");
		} else {
			document.getElementById("change-info").value = "수정";
			document.getElementById("store-name").setAttribute("disabled", "disabled");
			document.getElementById("store-city").setAttribute("disabled", "disabled");
			document.getElementById("store-address").setAttribute("disabled", "disabled");
			document.getElementById("store-phone").setAttribute("disabled", "disabled");
			document.getElementById("store-business-hours").setAttribute("disabled", "disabled");
			document.getElementById("store-display-yn").setAttribute("disabled", "disabled");
			document.getElementById("store-latitude").setAttribute("disabled", "disabled");
			document.getElementById("store-longitude").setAttribute("disabled", "disabled");
			
			var pno = document.getElementById("store-pno").value;
			var no = document.getElementById("store-no").value;
			var name = document.getElementById("store-name").value;
			var city = document.getElementById("store-city").value;
			var address = document.getElementById("store-address").value;
			var phone = document.getElementById("store-phone").value;
			var businessHours = document.getElementById("store-business-hours").value;
			console.log("businessHours",businessHours);
			var displayYn = document.getElementById("store-display-yn");
			
			if(displayYn.checked == true) {
				displayYn.value = 'Y';
			} else {
				displayYn.value = 'N';
			}
			
			console.log("displayYn",displayYn.value);
			var latitude = document.getElementById("store-latitude").value;
			console.log("latitude",latitude);
			var longitude = document.getElementById("store-longitude").value;
			console.log("longitude",longitude);
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					
				}
			}
			xhr.open("POST", "updateStore.kakao");
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("pno=" + pno + "&no=" + no + "&name=" + name+ "&city=" + city+ "&address=" + address+ "&phone=" + phone
				+ "&businessHours=" + businessHours + "&displayYn=" + displayYn.value +"&latitude="+latitude+"&longitude="+longitude);
		}
		
function checkValue(event){
			
			var titleBn = document.getElementById("bannerTitle").value;
			if(titleBn == ""){
				alert("배너타이틀을 입력해주세요");
				event.preventDefault();
				return false;
			}
			
			var subTitleBn = document.getElementById("bannerSubTitle").value;
			if(subTitleBn == ""){
				alert("서브타이틀을 입력해주세요")
				event.preventDefault();
				return false;
			}
			var proBn = document.getElementById("productNo").value;
			if(proBn == ""){
				alert("상품을 정해주세요")
				event.preventDefault();
				return false;
			}
			var priorityBn = document.getElementById("bannerPriority").value;
			if(priorityBn == ""){
				alert("노출순서를 입력해주세요")
				event.preventDefault();
				return false;
			}
			var fileBn = document.getElementById("bannerFile").value;
			if(fileBn == ""){
				alert("이미지를 넣어주세요")
				event.preventDefault();
				return false;
			}
		}
	}
</script>
</body>
</html>