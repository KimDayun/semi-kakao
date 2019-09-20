<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
       <div class="row border-line">
            <h2 class="qna_title">1:1 문의하기</h2>
            <form method="post" action="">
                <div class="col-xs-6 input-box">
                    <div class="col-xs-12"><h4>문의 내용</h4></div>
                    <div class="col-xs-12">
                        <div class="row sec-box-margin">
                            <label class="col-xs-12">답변 날짜</label>
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
                    </div>
                </div>
            </form>
        </div>
        <div class="btn-margin">
            <button type="reset" class="btn btn-default cancle" type="submit">취소</button>
            <button type="submit" class="btn btn-warning add">등록하기</button>
        </div>
</div>
</body>
</html>