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

        .topbar3 {
            padding: 70px;
            font: 20px;
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

        .pooint {}

        a {
            text-decoration: none !important;
        }

        .point-detail {
            padding-left: 0;
        }

        .qna {
            float: right;
        }

        .bottomline {
            padding: 45px;
        }
    </style>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
<%@ include file="mypagetop.jsp" %><!--마이페이지 공통부분(개인정보)  -->
                  
        <div class="container middleoption">
            <div class="row ">
            	<div class="col-sm-12">
	                <table class="table">
						<thead>
							<tr>
			                	<th>문의 날짜</th>
			                    <th>문의 유형</th>
			                    <th> 제목 </th>
			                    <th>답변 상태</th>
							</tr>
						</thead>
						<tbody>
			            <c:forEach var="qna" items="${qnalist }">
							<tr>
			                    <td><fmt:formatDate value="${qna.createDate }"/></td>
			                    <td> ${qna.category }</td>
			                    <td><a href="qnadetail.kakao?tab=5&qno=${qna.no }"> ${qna.title} </a></td>
			                    <td>
			                    <c:choose>
			                		<c:when test="${qna.statusYn eq 'Y' }">
			                			<span class="label label-success"> 답변완료 </span>
			                		</c:when>
			                		<c:otherwise>
			                			<span class="label label-info"> 답변대기중 </span>
			                		</c:otherwise>
			                	</c:choose>
			                    </td>
							</tr>
		                </c:forEach>
						</tbody>
	                </table>
            	</div>
            </div>
        </div>

        <div class="container bottomline">
            <div class="row ">
                <a href="/kakao/mypage/question.kakao"><button class="button btn btn-warning qna">문의하기</button></a>
            </div>
        </div>
  
    <%@ include file="../common/footer.jsp"%>
</body>

</html>