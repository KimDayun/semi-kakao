<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/kakao/test/css/kakao-admin.css">
<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<style>
        .margin-div {
            margin-top: 15px;
        }
        .admin-line-height {
            line-height: 30px;
        }
        .margin-btn {
            padding: 0;
        }
        .admin-jagan2{letter-spacing:-1.2px;}
        
    </style>
    <body>
        <%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
		<c:set var="menu" value="member" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
                <div class="container">
                    <h1 class="admin-buttom">회원정보</h1>
                    <div class="well">
                        <form method="post" action="updateAll.kakao" onsubmit="checkValue(event)">
                           <div class="form-group">
                           <input type="hidden" value="${pno }" name="pno">
                           <input type="hidden" value="${member.no }" name="no">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>회원번호</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        ${member.no }
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>전화번호</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        <input class="form-control" name="userPhone" type="text" id="userPhone" value="${member.phone }" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label class="admin-jagan2">회원아이디</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        ${member.id }
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>이메일</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="userEmail" type="text" id="userEmail" value="${member.email }" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>이름</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="userName" type="text" id="userName" value="${member.name }" />
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>주소</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="userAddress" type="text" id="userAddress" value="${member.address }" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>포인트</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="userPoint" type="text" id="userPoint" value="${member.point }"/>
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>생일</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        <input class="form-control" name="userBirth" type="text" id="userBirth" value="${member.birth }"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label class="admin-jagan2">회원가입일</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        <fmt:formatDate value="${member.createDate }" pattern="yyyy-MM-dd"/> 
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>탈퇴여부</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        ${member.usedYn }
                                    </div>
                                </div>
                            </div>
                            <div class="text-right">
                                <input type="submit" value="수정" class="btn btn-default">
                                <a href="detail.kakao?pno=${pno}&no=${member.no}" class="btn btn-default">취소</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
		function checkValue(event){
			
			var titleBn = document.getElementById("userPhone").value;
			if(titleBn == ""){
				alert("전화번호를 입력해주세요");
				event.preventDefault();
				return false;
			}
			
			var subTitleBn = document.getElementById("userEmail").value;
			if(subTitleBn == ""){
				alert("이메일을 입력해주세요")
				event.preventDefault();
				return false;
			}
			var proBn = document.getElementById("userName").value;
			if(proBn == ""){
				alert("이름을 정해주세요")
				event.preventDefault();
				return false;
			}
			var priorityBn = document.getElementById("userAddress").value;
			if(priorityBn == ""){
				alert("주소를 입력해주세요")
				event.preventDefault();
				return false;
			}
			var fileBn = document.getElementById("userPoint").value;
			if(fileBn == ""){
				alert("포인트를 넣어주세요")
				event.preventDefault();
				return false;
			}
			var birth = document.getElementById("userBirth").value;
			if(birth == ""){
				alert("생일을 입력해주세요")
				event.preventDefault();
				return false;
			}
		}
	</script>
    </body>
</html>