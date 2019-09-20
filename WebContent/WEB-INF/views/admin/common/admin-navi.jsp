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
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <style>
        .admin-navi{
            padding:27px;
             border-bottom: 1px solid #000;
        }
       
        .admin-navi-font-sub{
            font-size: 17px;
            color: black;
        }
        #navi-border{
        	border-bottom: 1px solid #000;
        }
        .navbar {margin-bottom: 0px !important;} /* 이게 무조건 최우선순위 */
    </style>
</head>
<body>
<div class="navbar admin-navi varbottom" id="navi-border">
    <div class="container">
        <div class="navbar-header"><a href="/kakao/admin/main.kakao"><img src="/kakao/test/img/main-navi.png"/></a></div>
       
        <ul class="nav navbar-nav navbar-right" >
            <li><a href="/kakao/main.kakao" class="admin-navi-font-sub">사용자 페이지 이동</a></li>
        </ul>
        
    </div>
</div>
<div class="container">

</div>
</body>
</html>