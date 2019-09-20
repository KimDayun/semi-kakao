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
	href="../../bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/kakao-admin.css">
<script src="../../bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="../../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
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
    </style>
    <body>
        <%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
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
                                        1
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>전화번호</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        010-1111-1111
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label class="admin-jagan ">회원아이디</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        lee
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>이메일</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="username" type="text"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>이름</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="username" type="text"/>
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>주소</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="username" type="text"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>포인트</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="username" type="text"/>
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>생일</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        1993.01.01
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label class="admin-jagan">회원가입일</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        2019-05-25
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>탈퇴여부</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        N
                                    </div>
                                </div>
                            </div>
                            <div class="text-right">
                                <a href="" class="btn btn-default">수정</a>
                                <a href="" class="btn btn-default">삭제</a>
                                <a href="admin-member-list.jsp" class="btn btn-default">취소</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>