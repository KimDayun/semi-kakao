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
<link rel="stylesheet" href="/kakao/test/css/kakao-admin.css">
<script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
<script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
</head>
<style>
        .margin-div {
            margin-top: 15px;
        }
        .admin-line-height {
            line-height: 30px;
        }
        .margin-btn {
            padding: 0;
        }
        .admin-jagan2{letter-spacing:-1.3px;}
        
    </style>
    <body>
        <%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
		<c:set var="menu" value="order" />
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
                <div class="container">
                    <h1 class="admin-buttom">주문관리</h1>
                    <div class="well">
                        <form method="post" action="detailInvoiceNumAdd.kakao">
                           <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>주문번호</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                    <input type="hidden" value=${orderInfo.no } name="no">
                                    <input type="hidden" value=${param.pno } name="pno">
                                    
                                       ${orderInfo.no }
                                    </div>
                                    <div class="col-xs-1 admin-line-height admin-jagan2" >
                                        <label>주문자이름</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        ${orderInfo.member.name}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label class="admin-jagan2">회원아이디</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        ${orderInfo.member.id }
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>주문상태</label>
                                    </div>
                                    <div class="col-xs-3">
                                    	<span id="odStatus">${orderInfo.status }</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>주문일</label>
                                    </div>
                                    <div class="col-xs-3">
                                        ${orderInfo.createDate }
                                    </div>
                                    <div class="col-xs-1 admin-line-height admin-jagan2">
                                        <label>사용포인트</label>
                                    </div>
                                    <div class="col-xs-3">
                                        ${orderInfo.usePoint }
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>주문상품</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <c:forEach var="orderpro" items="${orderProducts }">
                                        	${orderpro.product.name }<br/>
                                        </c:forEach>
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>주문수량</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <c:forEach var="orderpro" items="${orderProducts }">
                                        	${orderpro.amount }개<br/>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>최종가격</label>
                                    </div>
                                    <div class="col-xs-3">
                                        ${orderInfo.finalPrice }
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>송장번호</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                  	 <c:choose>
												<c:when test="${not empty orderInfo.invoiceNumber }">
													<td class="text-center"><input type="text" name="invoiceNum" value="${orderInfo.invoiceNumber }" readonly>
													<button type="button" class="btn btn-default" style="background-color: #ccc" disabled>적용</button></td>
												</c:when>
												<c:otherwise>
													<td class="text-center">
															<input type="text" name="invoice">
															<input type="submit" class="btn btn-default" value="적용">
															
													</td>
												</c:otherwise>
											</c:choose>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>국가</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        ${orderInfo.nation } 
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>받는사람</label>
                                    </div>
                                    <div class="col-xs-3 admin-line-height">
                                        ${orderInfo.name }
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                            	<div class="row">
                            		<div class="col-xs-1 admin-line-height">
                            			<label >연락처</label>
                            		</div>
                            		<div class="col-xs-3">
                            			${orderInfo.phone}
                            		</div>
                            		<div class="col-xs-1 admin-line-height">
                            			<label >우편번호</label>
                            		</div>
                            		<div class="col-xs-3">
                            			${orderInfo.postalCode}
                            		</div>
                            	</div>
                            </div>
                            <div class="form-group">
                            	<div class="row">
                            		<div class="col-xs-1 admin-line-height">
                            			<label >주소</label>
                            		</div>
                            		<div class="col-xs-3">
                            			${orderInfo.address}
                            		</div>
                            		<div class="col-xs-1 admin-line-height">
                            			<label >상세주소</label>
                            		</div>
                            		<div class="col-xs-3">
                            			${orderInfo.detailAddress}
                            		</div>
                            	</div>
                            </div>
                            
                            <div class="text-right">
                                <input type="button" class="btn btn-default" id="inButton" onclick="changStatus('${param.pno}', '${orderInfo.no}');" value="주문상태변경">
                                <a href="list.kakao?pno=${param.pno}" class="btn btn-default">취소</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
    
	     function changStatus(pno, orderNo) {
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					
					
					document.getElementById("odStatus").textContent = result.status;
					if(result.alert === "Y"){
						alert("송장을 입력해주세요");
					}
				}
			}
			xhr.open("GET", "orderStatusUpdate.kakao?pno=" + pno + "&no=" + orderNo);
			xhr.send();
		}
    
    </script>
</html>