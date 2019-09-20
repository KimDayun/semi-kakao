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

        .boxbox {
            padding: 30px;
        }

        .ordernumber {}

        .box {
            outline: inherit;
            outline-color: aqua;
        }

        a {
            text-decoration: none !important;
        }
        
        .txt_g{
        font-size: 15px;
        color: #fff;
        font-weight: bold;
         margin: 3px;
        padding: 20px 20px; 
   		 }
   		 
    .table>tbody>tr>td{line-height: 110px;}
    
    </style>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
<%@ include file="mypagetop.jsp" %><!--마이페이지 공통부분(개인정보)  -->

            	<form id="orderlist" action="delete.kakao">
        <div class="container">
            <div class="row">
               <table class="table">   
               	<thead>
               		<tr>
               			<th>주문번호</th>
               			<!-- <th>송장번호</th>
               			<th></th> -->
               			<th>상품이름</th>
               			<th>가격</th>
               			<th>수량</th>
               			<th>주문날짜</th>
               			<th>총 금액</th>
               			<th>입금 상태</th>
               			<th></th>
               		</tr>
               	</thead>
               	<tbody>
       				<c:forEach var="order" items="${orderProducts }">
					<tr class="line-center">
						<td>${order.orderNo }<input type="hidden" name="orderNo" value="${order.orderNo }"/></td>
						<%-- <td>${order.invoiceNumber }</td> --%>
						<%-- <td><a href="/kakao/product/detail.kakao?no=${order.proNo}"><img src="/kakao/test/image/${order.proImg }" width="120" height="120"></a></td> --%>
						<!-- <td></td> -->
						<td><a href="/kakao/product/detail.kakao?no=${order.proNo}">${order.proName }</a></td>
						<td>${order.proPrice }</td>
						<td>${order.orderAmount}</td>
						<td><fmt:formatDate value="${order.orderDate }" /></td>
						<td>${order.finalPrice }</td>
						<td>${order.orderStatus }</td>
						<td>
							<button type="button" size="small" class="btn btn-warning" name="pro-check" value=${order.orderNo } onclick="deleteOrder()">
								<span class="txt_g" >  
									주문 취소
								</span>
							</button>
						</td>
					</tr>               	
       				</c:forEach>        			
               	</tbody>
               </table>
            </div>
        </div>
               </form>
        
    <%@ include file="../common/footer.jsp"%>
</body>


<script type="text/javascript">
	function deleteOrder(){
		var form = document.getElementById("orderlist");
		form.submit();
	}
</script>

</html>