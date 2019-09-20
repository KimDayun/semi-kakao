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
            padding: 0 !important;
        }
        .label-padding{
        	padding-left: 15px;
        }
        .list-number {
        	margin-bottom: 10px;
        }
    </style>
    <body>
        <%@ include file="../common/admin-navi.jsp"%>
        <div class="row">
            <div class="col-xs-1">
            	<c:set var="menu" value="product" />
                <%@ include file="../common/admin-sidebar.jsp"%>
            </div>
            <div class="col-xs-11">
                <div class="container">
                    <h1 class="admin-buttom">상품관리</h1>
                    <div class="well">
                        
                            <div class="form-group">
                            	<div class="row">
                            		<div class="col-xs-1 list-number">
                            			<label>번호</label>
                            		</div>
                            		<div class="col-xs-11">${product.no }</div> 
                            		</div>
                                <div class="row">
                                    <div class="col-xs-1">
                                        <label>상품이름</label>
                                    </div>
                                    <div class="col-xs-11">
                                        <input class="form-control" name="productname" type="text" value="${product.name }" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-1"></div>
                                <div class="col-xs-11">
                                    <div class="col-xs-2 margin-btn">
                                        <select class="form-control" name="workingarea" id="cat-box"  onchange="refreshMenu()" readonly>
                                            <option value=${product.cateName }>${product.cateName }</option>
                                           
                                        </select>
                                    </div>
                                    <div class="col-xs-2 margin-btn">
                                        <select class="form-control" name="subCateName" readonly>
                                            <option value=${product.subCateName }>${product.subCateName }</option>
                                        
                                        </select>
                                    </div>
                                    <div class="col-xs-2 margin-btn">
                                        <select class="form-control" name="character" readonly>
                                            <option value=${product.character }>${product.character }</option>
                                        </select>
                                    </div>
                                    <div class="checkbox">
                                        <div class="col-xs-2 ">
                                            <div class="checkbox-inline">
                                                <input type="checkbox" value="${product.globalYn}" ${product.globalYn eq 'Y' ? "checked" : "" } > 해외배송
                                            </div>
                                        </div>
                                        <div class="col-xs-2 ">
                                            <div class="checkbox-inline">
                                                <input type="checkbox" value="${product.soldoutYn}" ${product.soldoutYn eq 'Y' ? "checked" : "" } > 품절여부
                                            </div>
                                        </div>
                                        <div class="col-xs-2 ">
                                            <div class="checkbox-inline">
                                                <input type="checkbox" value="${product.sellYn}" ${product.sellYn eq 'Y' ? "checked" : "" } > 판매여부
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row margin-div">
                                    <div class="col-xs-1 admin-line-height">
                                        <label>가격</label>
                                    </div>
                                    <div class="col-xs-3">
                                        <input class="form-control" name="price" type="text" value="${product.price }"readonly/>
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>상품수량</label>
                                    </div>
                                    <div class="col-xs-2">
                                        <input class="form-control" name="stock" type="text" value="${product.stock }" readonly/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                          		<div class="col-xs-1 admin-line-height margin-btn">
                                	<label>&nbsp;&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;미&nbsp;&nbsp;지</label>
                            	</div>
                            	<div class="col-xs-11">
                            		 <a href="/kakao/test/image/${product.imgName }" target="_blank">${product.imgName }</a>
                            	</div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-1">
                                    </div>
                                    <div class="col-xs-11">
                                        <textarea class="form-control margin-div" name="info" placeholder="상세설명" rows="10" readonly>${product.info }</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="text-right">
                                <a href="updateform.kakao?pno=${param.pno }&no=${product.no }" class="btn btn-default">수정</a>
                                
                                <a href="deleteProduct.kakao?pno=${param.pno }&no=${product.no }" class="btn btn-default">판매여부 변경</a>
                                <a class="btn btn-default" href="list.kakao?pno=${param.pno }">취소</a>
                            </div>
                       
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
		function refreshMenu() {
			var nation = document.querySelector("#cat-box").value;
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4)					
				var content = xhr.responseText;
				document.getElementById("menu-no").textcontent = content;
				
				xhr.open("GET", "Admin_ProductController.java?nc=" + nation);
				xhr.send(); 
			}		
		}
		</script>	
    </body>
</html>
