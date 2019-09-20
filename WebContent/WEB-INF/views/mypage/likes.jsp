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
            padding: 20px;
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

        a {
            text-decoration: none !important;
        }

        .text {
            margin-top: 50px;
        }
        .padding-box p{padding-left: 15px;}
    </style>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
<%@ include file="mypagetop.jsp" %><!--마이페이지 공통부분(개인정보)  -->
        
        <div class="container middleoption">
             <div class="col-sm-8 ">
            </div>
            <div class="col-sm-4 text-right" style="padding: 10px;">
               	<input type="checkbox" value="option1" id="ch-all"> <button class="btn btn-default" id="btn-all" onclick="allcheckRelease()" >전체 선택</button>
                <button type="button" class="btn btn-default" onclick="deletelikes()">선택 삭제하기</button>
            </div>
         <form  id="likesform" action="deletelikes.kakao">
        <c:forEach var="likes" items="${likes }">
                <div class="col-sm-6 padding-box">  
                <label>
	                        <input type="checkbox" id="blankCheckbox" name="pro-check"  value="${likes.no }">
	                    </label>  
                     <a href="/kakao/product/detail.kakao?no=${likes.product.no }"> <img src="/kakao/test/image/${likes.product.imgName }" width="120" height="120"> </a>
                      <p> <a href="/kakao/product/detail.kakao?no=${likes.product.no }">${likes.product.name }</a></p>
                   		 <p>${likes.product.price }<span>원</span></p>
                </div>
        </c:forEach>
        </form>
            </div>
       		 </div>
   <%@ include file="../common/footer.jsp"%>
    
    <script type="text/javascript">
	    //전체 선택 or 취소
		function allcheckRelease(){
			var check = document.getElementById("ch-all");
			var status = !check.checked;
			check.checked = status;			
			
			var checkboxs= document.querySelectorAll("[name='pro-check']")
			for(var i=0; i<checkboxs.length; i++){
				var checkbox = checkboxs[i];
				checkbox.checked=status;
			}
		}
	    
	    
	    //삭제
		function deletelikes(){
			var form = document.getElementById("likesform");
			form.submit();
		}
		
	
</script>
</body>
</html>         