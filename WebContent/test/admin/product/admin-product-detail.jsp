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
            padding: 0 !important;
        }
        .label-padding{
        	padding-left: 15px;
        }
    </style>
    <body>
        <%@ include file="../common/admin-navi.jsp"%>
        <div class="row">
            <div
                class="col-xs-1"><%@ include file="../common/admin-sidebar.jsp"%>
            </div>
            <div class="col-xs-11">
                <div class="container">
                    <h1 class="admin-buttom">상품관리</h1>
                    <div class="well">
                        <form>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-1">
                                        <label>상품이름</label>
                                    </div>
                                    <div class="col-xs-11">
                                        <input class="form-control" name="username" type="text"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-1"></div>
                                <div class="col-xs-11">
                                    <div class="col-xs-2 margin-btn">
                                        <select class="form-control" name="workingarea">
                                            <option value="">대분류</option>
                                            <option value="전체">전체</option>
                                            <option value="테마 기획전">테마 기획전</option>
                                            <option value="인형/피규어">인형/피규어</option>
                                            <option value="리빙">리빙</option>
                                            <option value="잡화">잡화</option>
                                            <option value="의류">의류</option>
                                            <option value="쥬얼리">쥬얼리</option>
                                            <option value="문구">문구</option>
                                            <option value="여행/레저">여행/레저</option>
                                            <option value="생활테크">생활테크</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-2 margin-btn">
                                        <select class="form-control" name="workingarea">
                                            <option value="">소분류</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-2 margin-btn">
                                        <select class="form-control" name="workingarea">
                                            <option value="">캐릭터</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </div>
                                    <div class="checkbox">
                                        <div class="col-xs-2 ">
                                            <div class="checkbox-inline">
                                                <input name="tech" type="checkbox" value="해외배송">
                                                해외배송
                                            </div>
                                        </div>
                                        <div class="col-xs-2 ">
                                            <div class="checkbox-inline">
                                                <input name="tech" type="checkbox" value="품절여부">
                                                품절여부
                                            </div>
                                        </div>
                                        <div class="col-xs-2 ">
                                            <div class="checkbox-inline">
                                                <input name="tech" type="checkbox" value="판매여부">
                                                판매여부
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>가격</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="username" type="text"/>
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>상품수량</label>
                                    </div>
                                    <div class="col-xs-2">
                                        <input class="form-control" name="username" type="text"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                          		<div class="col-xs-1 admin-line-height margin-btn">
                                	<label class="label-padding">이미지첨부</label>
                            	</div>
                            	<div class="col-xs-11">
                            		<input type="file" />
                            		<input type="file" />
                            		<input type="file" />
                            	</div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-1">
                                    </div>
                                    <div class="col-xs-11">
                                        <textarea class="form-control margin-div" name="contents" placeholder="상세설명" rows="10"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="text-right">
                                <input class="btn btn-warning" type="submit" value="등록">
                                <a class="btn btn-default" href="admin-product-list.jsp">취소</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
