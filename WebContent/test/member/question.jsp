<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/qna.css">
	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<script src="../bootstrap-3.3.2-dist/js/jquery.min.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<title>1:1 문의</title>
<style>
	.form-control{height: 50px;}
</style>
</head>
<body>
<%@ include file="../common/navigation.jsp" %>
	<div class="container">
       <div class="row border-line">
            <h2 class="qna_title">1:1 문의하기</h2>
            <form method="post" action="">
                <div class="col-xs-6 input-box">
                    <div class="col-xs-12"><h4>고객 정보</h4></div>
                    <div class="col-xs-12">
                        <div class="row box-margin">
                            <label class="col-xs-12">이름</label>
                            <div class="col-xs-12 input-left">
                                <input type="text" class="form form-control" name="username" placeholder="이름"/>
                            </div>
                        </div>
                        <div class="row sec-box-margin">
                            <label class="col-xs-12">이메일</label>
                            <div class="col-xs-12 input-left">
                                <input type="text" class="form form-control" name="useremail" placeholder="이메일"/>
                            </div>
                        </div>
                        <div class="row sec-box-margin">
                            <label class="col-xs-12">연락처</label>
                            <div class="col-xs-12 input-left">
                                <input type="text" class="form form-control" name="userphone" placeholder="연락처"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 input-box">
                    <div class="col-xs-12"><h4>문의 내용</h4></div>
                    <div class="col-xs-12">
                        <div class="row box-margin">
                            <label class="col-xs-12">유형</label>
                            <div class="col-xs-12 input-left">
                                <select class="form-control">
                                    <option>문의 유형을 선택하세요.</option>
                                    <option value="">회원</option>
                                    <option value="">상품</option>
                                    <option value="">주문결제</option>
                                    <option value="">배송</option>
                                    <option value="">교환/반품/환불</option>
                                    <option value="">기타</option>
                                    <option value="">해외배송</option>
                                </select>
                            </div>
                        </div>
                        <div class="row sec-box-margin">
                            <label class="col-xs-12">제목</label>
                            <div class="col-xs-12 input-left">
                                <input type="text" class="form form-control" name="title"/>
                            </div>
                        </div>
                        <div class="row sec-box-margin">
                            <label class="col-xs-12">내용</label>
                            <div class="col-xs-12 input-left">
                                <textarea name="contents" class="form-control" cols="75" rows="10"></textarea>
                            </div>
                        </div>
                        <div class="row sec-box-margin">
                            <label class="col-xs-12">첨부파일</label>
                            <div class="col-xs-12 input-left file">
                                <input type="file" class=""/>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="btn-margin">
            <button type="reset" class="btn btn-default cancle">취소</button>
            <button type="submit" class="btn btn-warning add">등록하기</button>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>