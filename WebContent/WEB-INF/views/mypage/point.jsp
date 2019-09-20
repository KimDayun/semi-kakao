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
    <style>
        .front {
            color: black;
            background-color: #ffdc00;
            height: 150px;
        }

        .wrap {
            width: 100%;
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
            border-bottom: 1px solid darkgrey;
        }

        .topbar3 {
            padding: 70px;
        }

        .link_tab {
            color: black;
            line-height: 1px;
        }

        .amount {
            line-height: 1;
        }

        .pointamount {
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

        a {
            text-decoration: none !important;
        }

        .point-detail {
            padding-left: 0;
        }
    </style>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
<%@ include file="mypagetop.jsp" %><!--마이페이지 공통부분(개인정보)  -->

	<div class="container">
		<div class="row">
			<div class="panel panel-default">
			    <c:forEach var="pointHistory" items="${pointHistory }" varStatus="loop">
			    	<c:if test="${loop.index eq 0 }">
						<div class="panel-heading">
							<h3>현재 사용가능 포인트 : <span><fmt:formatNumber value="${pointHistory.member.point }"/>점</span></h3>
							<small>포인트 종류에 따라 사용 가능기간이 설정되어 기간내 사용을 하지 않을 시 소멸될 수 있습니다.</small>
						</div>
					</c:if>
			    </c:forEach>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">포인트 적립/차감</th>
						<th class="text-right">변경된 포인트</th>
						<th class="text-center">포인트 사용날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach  var="pointHistory" items="${pointHistory }">
					<tr class="${pointHistory.changePoint gt 0 ? '' : 'danger' }">
						<td class="text-center">${pointHistory.changePoint gt 0 ? '적립' : '차감' }</td>
						<td class="text-right"><fmt:formatNumber value="${pointHistory.changePoint }"/></td>
						<td class="text-center"><fmt:formatDate value="${pointHistory.createDate }"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div> 
  
    <%@ include file="../common/footer.jsp"%>
</body>

</html>