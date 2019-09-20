<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>kakao</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style>
    .front {
        color: black;
        background-color: #ffdc00;
        height: 150px;
    }

    .wrap {
        width: 100%;
    }

    .bg-wrap {
        width: 100%;
        padding: 40px 0;
        background: #ffdc00
    }

    .point {
        margin-bottom: 26px;
        padding-top: 1px;
        font-size: 22px;
        line-height: 1;
    }

    .topmiddletext {
        color: #1e1e1e;
        font-size: 16px;
    }

    .hello {
        display: block;
        font-weight: normal;
        font-size: 36px;
        line-height: 42px;
    }

    .topbar1 {
        padding: 70px;
    }

    .topbar2 {
        padding: 50px;
        font: 20px;
        border-bottom: 1px solid darkgrey;
    }

    .link_tab {
        font-size: 22px;
        color: black;
        line-height: 1px;
    }

    .amount {
        font-size: 30px;
        line-height: 1;
    }

    .pointamount {
        font-size: 30px;
        line-height: 1;
        float: right;
        padding: 30px;
    }

    .av {
        color: darkgrey;
    }

    .available {
        padding: 35px;
    }

    .topone {
        border-right: 1px solid darkgrey;
    }

    .border {
        height: 149px;
    }

    .select {
        border-bottom: 8px solid #ffdc00;
    }

    .checkbox {
        font-size: 15px;
    }

    .elements {
        font-size: 15px;
        float: right;
    }

    .ordernumber {}

    .box {
        outline: inherit;
        outline-color: aqua;
    }

    a {
        text-decoration: none !important;
    }

    .cancle {
        float: right;
        padding: 50px;
    }

    .editmyinfo {
        width: 250px;
    }
</style>

<body>
<%@ include file="../common/navigation.jsp" %>
<%@ include file="mypagetop.jsp" %><!--마이페이지 공통부분(개인정보)  -->
    <form method="post" action="update.kakao">
        <div class="container middleoption">
            <table class="table table-border">
                <h3>개인정보수정</h3>
                <tbody>
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" name="id" value="${memberInfo.memId}" class="form-control editmyinfo" readonly></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="name" value="${memberInfo.memName}" class="form-control editmyinfo" readonly></td>
                    </tr>
                    <tr>
                        <td>휴대폰 번호</td>
                        <td> <input type="text" name="phone" value="${memberInfo.memPhone}" class="form-control editmyinfo" ></td>
                    </tr>
                    <tr>
                        <td>비밀번호 </td>
                        <td><input type="password" name="pwd" value="${memberInfo.memPwd}" class="form-control editmyinfo" ></td>
                    </tr>

                    <tr>
                        <td>비밀번호 변경</td>
                        <td><input type="password" name="npwd" value="${memberInfo.memPwd}" class="form-control editmyinfo"></td>
                    </tr>

                    <tr>
                        <td>생년월일</td>
                        <td><input type="date" name="birth" value="${memberInfo.memBirth}" class="form-control editmyinfo"></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input type="text" name="email" value="${memberInfo.memEmail}" class="form-control editmyinfo"></td>
                    </tr>
                    <tr>
                        <td>배송지</td>
                        <td><input type="text" name="address" value="${memberInfo.memAddress}" class="form-control editmyinfo"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="container middleoption">
            <div class="row cancle">
              <button class="button btn btn-default" type="submit">수정하기</button>
             	<a class="button btn btn-danger"  href="outmember.kakao">탈퇴하기</a>
            </div>
        </div>
    </form>
    <%@ include file="../common/footer.jsp"%>
    
   <script type="text/javascript">
   </script>
</body>

</html>