<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
        /* 사이드바 래퍼 스타일 */
  
        /*사이드바 전체위치*/
        #page-wrapper {
            padding-left: 200px;
        }
  
        #sidebar-wrapper {
            position: static;
            width: 200px;
            height: 100vh;
            margin-left: -250px;
            background: #666;
            overflow-x: hidden;    /*가로로 내용이 넘치면 숨김*/
            overflow-y: auto;    /*세로로 내용이 넘치면 스크롤*/
        }
        /* 사이드바 스타일 */
      
        .sidebar-nav {
        	
            width: 100%;
            margin: 0;
            /*padding: ;*/
            list-style: none; /*li할때 아무것도 안나오게 하는것*/
            color: black;
        }
      
        .sidebar-nav li {
            line-height: 60px;
            /*border-bottom: 1px solid #777;*/
        }
  
        .sidebar-nav li a {
            display: block;
            text-decoration: none;    /*글자 타입을 설정하는건데 none은 설정이 */
            color: #ccc;
            text-align:center;
        }
      
        .sidebar-nav li a:hover {
            color: black;
            background: #fff;
        }
      
        .sidebar-nav > .sidebar-brand {
            font-size: 1.3em;
            line-height: 6em;
        }
    	.sidebar-active{
            background: #fff;
            color: black !important;
    	}
        #admin-contents {margin-top: 60px;}
    </style>


    <div id="page-wrapper">
        <!-- 사이드바 -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav ">
              <li class="ex"><a href="../product/admin-product-list.jsp">상품관리</a></li>
              <li><a href="../member/admin-member-list.jsp">회원관리</a></li>
              <li><a href="../store/admin-store-list.jsp">매장등록</a></li>
              <li><a href="../banner/admin-banner-list.jsp" class="sidebar-active" >배너관리</a></li>
              <li><a href="#">판매현황</a></li>
              <li><a href="../qna/admin-qna-list.jsp">문의현황</a></li>
              <li><a href="../notice/admin-notice-list.jsp">공지사항</a></li>
            </ul>
        </div>
        <!-- /사이드바 -->
    
    </div>
