<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    
    <style>
        .container {
            width: 1080px;
            margin: 0 auto;
            
        }
        table .header th, table .header td{text-align: left;}
        .table-bordered{width:100%;}
        
    </style>
</head>


<body>
<%@ include file="../common/navigation.jsp" %>
<%@ include file="mypagetop.jsp" %><!--마이페이지 공통부분(개인정보)  -->
 
    <div class="container">
        <table class="table table-bordered">
            <tr>
                <th >유형</th><td >${detail.qna.category }</td>
                <th >등록일</th><td ><fmt:formatDate value="${detail.qna.createDate }"/></td>
            </tr>
            <tr >
            	<th>질문 제목</th>
                <td >${detail.qna.title }</td>
                <th>답변상태</th>
                <td>
                	<c:choose>
                		<c:when test="${detail.qna.statusYn eq 'Y' }">
                			<span class="label label-success"> 답변완료 </span>
                		</c:when>
                		<c:otherwise>
                			<span class="label label-info"> 답변대기중 </span>
                		</c:otherwise>
                	</c:choose>
                </td>
            </tr>
            <tr >
            	<th>질문내용</th>
                <td  colspan="3"> ${detail.qna.contents}</td>
            </tr>
        </table>
        
        <c:if test="${detail.qna.statusYn eq 'Y' }">
        <table class="table table-bordered">
            <tr>
                <th>답변 등록일</th><td><fmt:formatDate value="${detail.createDate }"/></td>
            </tr>
            <tr>
            	<th>답변내용</th>
                <td >${detail.contents }</td>
            </tr>
        </table>
        </c:if>
    </div>
 
  <%@ include file="../common/footer.jsp"%>
</body>
</html>