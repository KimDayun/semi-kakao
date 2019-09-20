<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 문의폼:문의시 입력할 정보를 적는 폼-->
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>1:1 문의</title>
<style>
	.btn-margin{    float: right; margin: 30px 9px 15px 0;}
	
	.qna_title{padding: 70px 0 20px; border-bottom: 1px solid #000; font-size: 30px; line-height: 31px; color: #222; font-weight: normal; text-align:right;}
	
	.input{background: #ccc;}
	.input-box{padding-left: 0; padding: 0 25px;}
	.input-box h4{margin: 42px 0 20px; font-size: 20px; color: #1e1e1e; font-weight: normal;}
	.input-box div{padding: 0;}
	form .input-box .input-left{padding-left: 15px;}
	form label{margin-bottom: 15px; font-size: 16px; line-height: 17px; color: #666; font-weight: 500;}
	.form-control{ padding: 0 19px; border: 1px solid #d2d2d2; background-color: #f9f9f9;}
	.box-margin{ margin-top: 30px;}
	.sec-box-margin{margin-top: 30px;}
	.file{margin: 10px 0 30px;}
	.border-line{margin-bottom: 30px;}
	.form-control {height: auto; padding: 12px 19px;}
</style>
</head>
<body>
<%@ include file="../common/navigation.jsp" %>
	<div class="container">
       <div class="row border-line">
            <h4 class="qna_title">1:1 문의하기</h4>
            <form method="post" action="addQna.kakao">
                <div class="col-xs-12 input-box">
                    <div class="col-xs-12">
                        <div class="row box-margin">
                            <label class="col-xs-12">유형</label>
                            <div class="col-xs-12 input-left">
                                <select class="form-control" name="category">
                                    <option>문의 유형을 선택하세요.</option>
                                    <option value="회원">회원</option>
                                    <option value="상품">상품</option>
                                    <option value="주문결제">주문결제</option>
                                    <option value="배송">배송</option>
                                    <option value="교환/반품/환불">교환/반품/환불</option>
                                    <option value="기타">기타</option>
                                    <option value="해외배송">해외배송</option>
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
                        <!-- <div class="row sec-box-margin">
                            <label class="col-xs-12">첨부파일</label>
                            <div class="col-xs-12 input-left file">
                                <input type="file" class=""/>
                            </div>
                        </div> -->
                    </div>
                </div>
        <div class="btn-margin">
            <button type="reset" class="btn btn-default cancle" >취소</button>
            <input type="submit" class="btn btn-warning add" value="등록하기" />
        </div>
            </form>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>