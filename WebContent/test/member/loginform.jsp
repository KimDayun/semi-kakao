<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.2-dist/js/jquery.min.js"></script>
    <script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <style>
        .container {
            width: 720px;
        }

        div {
            margin: 20px;
        }
    </style>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
    <div class="container text-center">
        <div class="row">
            <div class="input-group">
                <span class="input-group-addon glyphicon glyphicon-user" id="basic-addon1"></span>
                <input type="text" name="userid" class="form-control" placeholder="아이디" aria-describedby="basic-addon1">
            </div>
            <div class="input-group">
                <span class="input-group-addon glyphicon glyphicon-lock" id="basic-addon1"></span>
                <input type="password" name="userpwd" class="form-control" placeholder="비밀번호(영문 숫자를 사용한 8자 이상)" aria-describedby="basic-addon1">
            </div>
            <div>
                <input class="btn btn-primary"  type="submit" name="" value="로그인">
            </div>
            <div>
                <a href="joinform.jsp"><input class="btn btn-default" type="submit" name="" value="회원가입"></a>
            </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body></html>