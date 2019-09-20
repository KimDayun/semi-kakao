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
                        <form>
                           <div class="form-group">
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
                                        <input class="form-control" name="userPhone" type="text" value="${member.phone }" readonly/>
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
                                        <input class="form-control" name="username" type="text" value="${member.email }" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>이름</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="username" type="text" value="${member.name }" readonly/>
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>주소</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="username" type="text" value="${member.address }" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>포인트</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="username" type="text" value="${member.point }" readonly/>
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>생일</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                  	  <input class="form-control" name="userBirth" type="text" value=" ${member.birth }" readonly/>
                                       
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
                            <div class="form-group">
                            	<div class="row">
                            		<div class="col-xs-1 admin-line-height">
                            			<label >구매건수</label>
                            		</div>
                            		<div class="col-xs-3">
                            			${member.orderCount }
                            		</div>
                            		<div class="col-xs-1 admin-line-height">
                            			<label >구매가격</label>
                            		</div>
                            		<div class="col-xs-3">
                            			${member.totalBuyPrice }
                            		</div>
                            	</div>
                            </div>
                            <div class="text-right">
                                <a href="updateForm.kakao?pno=${pno }&no=${member.no}" class="btn btn-default">수정</a>
                                <a href="detailUpdate.kakao?pno=${pno}&no=${member.no}" class="btn btn-default">사용여부변경</a>
                                <a href="list.kakao?pno=${pno}" class="btn btn-default">취소</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>