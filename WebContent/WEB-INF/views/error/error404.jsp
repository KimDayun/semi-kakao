<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

<title>KAKAO FRIENDS</title>
 <style>
        .err-wrap {width: 1080px; margin: 0 auto; text-align: center; margin-top: 150px;}
        .err-wrap img {width: 200px}
        .err-wrap h2{letter-spacing: 1px; margin-top: 60px}
        .err-wrap .error-title {margin-top: 90px; color: #ff3232; font-weight: 600; font-size: 15px;}
        .err-wrap .error-sub {margin-top: 35px; line-height: 30px; font-size: 15px;}
        .btn-err {margin-top: 45px;}
        .btn-err a{margin-left: 10px; border: 1px solid #f4c900; color: #fff; background-color: #f4c900; padding: 12px 80px; font-size: 14px; letter-spacing: 0.5px;}
        .err-wrap a{text-decoration: none;}
    </style>
</head>
<body>
    <div class="err-wrap">
        <div>
            <img src="/kakao/test/image/err-ryon.gif">
        </div>
        <div>
            <h2>서비스 이용에 불편을 드려 죄송합니다.</h2>
            
            <p class="error-title">404 - Not Found Error</p>
            
            <p class="error-sub">원하시는 페이지를 찾을 수가 없습니다. 찾으시려는 페이지의 주소가 잘못 입력되었거나,<br>
                                페이지 주소의 변경 혹은 삭제로 인해 현재 사용하실 수 없습니다.<br>
                                입력하신 페이지의 주소가 정확한 지 다시 한번 확인해 주시길 부탁드립니다
            </p>
           
        </div>
        <div class="btn-err"> 
            <a href="/kakao/main.kakao">홈으로 이동</a>
        </div>
    </div>
</body>
</html>