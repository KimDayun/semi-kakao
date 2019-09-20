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
    	<c:set var="menu" value="product" />
        <%@ include file="../common/admin-navi.jsp"%>
        <div class="row">
            <div
                class="col-xs-1"><%@ include file="../common/admin-sidebar.jsp"%>
            </div>
            <div class="col-xs-11">
                <div class="container">
                    <h1 class="admin-buttom">상품관리</h1>
                    <div class="well">
                    <form method="post" action="update.kakao" enctype="multipart/form-data" onsubmit="checkfield(event)">
                    <input type="hidden" name="pno" value="${param.pno }" >
                            <div class="form-group">
                            	<div class="row">
                            		<div class="col-xs-1 list-number">
                            			<label>번호</label>
                            		</div>
                            		<div class="col-xs-11">${product.no }</div> 
                            		<input type="hidden" name="no" value="${product.no }" >
                            		</div>
                                <div class="row">
                                    <div class="col-xs-1">
                                        <label>상품이름</label>
                                    </div>
                                    <div class="col-xs-11">
                                        <input class="form-control" name="name" type="text" value="${product.name }" id="name" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-1"></div>
                                <div class="col-xs-11">
                                    <div class="col-xs-2 margin-btn">
                                        <select class="form-control" id="cat-box"  onchange="refreshMenu()" >
                                            <option value="1">전체</option>
                                            <option value="28">테마 기획전</option>
                                            <option value="40">인형/피규어</option>
                                            <option value="47">생활테크</option>
                                            <option value="56">여행/레져</option>
                                            <option value="59">문구</option>
                                            <option value="60">리빙</option>
                                            <option value="73">쥬얼리</option>
                                            <option value="78">의류</option>
                                            <option value="91">잡화</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-2 margin-btn">
                                        <select class="form-control" name="subCateName" id="sub" >
                                     		  <option value=${product.subCateName }>${product.subCateName }</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-2 margin-btn">
                                        <select class="form-control" name="character" >
   			                                     <option value=${product.character }>${product.character }</option>
                                        </select>
                                    </div>
                                    <div class="checkbox">
                                        <div class="col-xs-2 ">
                                            <div class="checkbox-inline">
                                                <input type="checkbox" name="globalYn" value="Y" ${product.globalYn eq 'Y' ? "checked" : "" } > 해외배송
                                            </div>
                                        </div>
                                        <div class="col-xs-2 ">
                                            <div class="checkbox-inline">
                                                <input type="checkbox" name="soldoutYn" value="Y" ${product.soldoutYn eq 'Y' ? "checked" : "" } > 품절여부
                                            </div>
                                        </div>
                                        <div class="col-xs-2 ">
                                            <div class="checkbox-inline">
                                                <input type="checkbox" name="sellYn"  value="Y" ${product.sellYn eq 'Y' ? "checked" : "" } > 판매여부
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
                                        <input class="form-control" name="price" type="text" value="${product.price }" id="price"/>
                                    </div>
                                    <div class="col-xs-1 admin-line-height">
                                        <label>상품수량</label>
                                    </div>
                                    <div class="col-xs-2">
                                        <input class="form-control" name="stock" type="text" value="${product.stock }" id="stock"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                          		<div class="col-xs-1 admin-line-height margin-btn">
                                	<label class="label-padding">이미지첨부</label>
                            	</div>
                            	<div class="col-xs-11">
                            		<input type="file" name="imageFile" id="imageFile"/>
                            	</div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-1">
                                    </div>
                                    <div class="col-xs-11">
                                        <textarea class="form-control margin-div" name="info" placeholder="상세설명" rows="10" id="info">${product.info }</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="text-right">
                                <input type="submit" class="btn btn-warning" value="수정">
                                <a class="btn btn-default" href="list.kakao?pno=${pno}">취소</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        function checkfield (event) {
        	
        	var name = document.getElementById("name").value;
        	if (name == '') {
        		alert("상품이름을 입력하세요");
        		event.preventDefault();
        		return false;
        	}
        	
        	var price = document.getElementById("price").value;
        	if (price == '') {
        		alert("가격을 입력하세요");
        		event.preventDefault();
        		return false;
        	}
        	
        	var stock = document.getElementById("stock").value;
        	if (stock == '') {
        		alert("수량을 입력하세요");
        		event.preventDefault();
        		return false;
        	}
        	
        	var info = document.getElementById("info").value;
        	if (info == '') {
        		alert("상세설명을 입력하세요");
        		event.preventDefault();
        		return false;
        	}
        }
		function refreshMenu() {	
			var cateNo = document.querySelector("#cat-box").value;
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {		
					var content = xhr.responseText;
					var categories = JSON.parse(content);   //JSON.parse 배열로 변환
					
					var options = "";
					for(var i=0; i<categories.length; i++) {
						var cat = categories[i];
						options += "<option value='"+cat.no+"'>"+cat.name+"</option>"
					}
					
					document.getElementById("sub").innerHTML = options;
				}
			}		
			xhr.open("GET", "cate.kakao?cateNo=" + cateNo);
			xhr.send(); 
		}
		</script>	
    </body>
</html>
