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
            <form method="post" action="register.kakao">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                    <input type="text" name="userid" class="form-control" placeholder="아이디" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" name="userpwd" class="form-control" placeholder="비밀번호(영문 숫자를 사용한 8자 이상)" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-ok"></i></span>
                    <input type="password" class="form-control" placeholder="비밀번호 확인" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                    <input type="text" name="username" class="form-control" placeholder="이름" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-phone"></i></span>
                    <input type="text" name="userphone" class="form-control" placeholder="휴대폰번호" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-envelope"></i></span>
                    <input type="text" name="useremail" class="form-control" placeholder="이메일" aria-describedby="basic-addon1">
                </div>

                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-home"></i></span>
                    <input type="text" name="useraddress" class="form-control" placeholder="주소" aria-describedby="basic-addon1">
                </div>

                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-calendar"></i></span>
                    <input type="date" name="userbirth" class="form-control" placeholder="생년월일" aria-describedby="basic-addon1">
                </div>

                <div>
                    <input class="btn btn-primary" type="submit" name="" value="회원가입">
                </div>
            </form>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body></html>