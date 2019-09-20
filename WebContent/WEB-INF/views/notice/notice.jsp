<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>KAKAO FRIENDS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/kakao/test/bootstrap-3.3.2-dist/css/bootstrap.min.css">
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/jquery.min.js"></script>
    <script src="/kakao/test/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <style>
        .container {
       		padding: 0px;
            width: 1080px;
        }

        .box-padding {
            padding: 15px;
        }

        .box {
            position: relative;
        }

        .box button {
            position: absolute;
            top: 0;
            right: 0
        }
    </style>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
    <div class="container">
        <div class="row" style="margin-bottom: 15px;">
            <div class="col-sm-12">
                <ul class="nav nav-tabs">
                    <li class="presentation active"><a href="notice.kakao?pno=1">공지사항</a></li>
                    <li class="presentation"><a href="faq.kakao?pno=1">FAQ</a></li>
                </ul>
            </div>
        </div>

		<c:forEach var="notice" items="${notices }">
	        <div class="row">
	            <div class="col-sm-12">
	                <p class="box-padding"><strong>[${notice.category }]</strong> <fmt:formatDate value="${notice.createDate }" pattern="yyyy.MM.dd" /></p>
	                <p class="box-padding box" style="font-size: 30px;">${notice.title }
	                    <button class="btn btn-default" style="border: 0px;" onclick="showDetail(${notice.no })" id="btn-show-${notice.no }">
	                        <span class="glyphicon glyphicon-menu-down"></span>
	                    </button>
	                </p>
	            </div>
	        </div>
	        <div class="row" style="display: none;" id="detail-button-${notice.no }">
	        	<div class="col" style="background-color: #f6f6f6;">
	        		<p class="box-padding">
	        			${notice.contents }
	        		</p>
	        	</div>
	        </div>
	        <hr>
		</c:forEach>
		
		<div class="text-center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pno == 1 }">
						<li><a href="">&laquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="notice.kakao?pno=${pno-1 }">&laquo;</a></li>
					</c:otherwise>
					
				</c:choose>
				<c:forEach var="a" begin="${pageBegin}"
					end="${pageEnd > totalPage ? totalPage : pageEnd}">
					<li class="${pno == a ? "active":""}">
						<a href="notice.kakao?pno=${a }">${a }</a>
					</li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pno == totalPage }">
						<li><a href="">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="notice.kakao?pno=${pno+1 }">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
    </div>
    
    <script type="text/javascript">
    	
    	function showDetail(no) {
	    	var detail = document.getElementById("detail-button-" + no);
	    	var btn = document.getElementById("btn-show-" + no);
	    	
	    	
    		var currentState = detail.style.display;
    		if (currentState == 'block') {
    			detail.style.display = 'none';
    			btn.innerHTML = '<span class="glyphicon glyphicon-menu-down"></span>';
    		} else {
    			detail.style.display = 'block';
    			btn.innerHTML = '<span class="glyphicon glyphicon-menu-up"></span>';
    		}
    	}
    </script>
    <%@ include file="../common/footer.jsp" %>
</body></html>