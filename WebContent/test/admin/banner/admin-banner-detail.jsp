<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/kakao-admin.css">
    <script src="../../bootstrap-3.3.2-dist/js/jquery.min.js"></script>
    <script src="../../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    </head>
	<style>
  	 	 .admin-line-height{line-height: 40px;}
  	 	 .admin-margin-buttom{margin-bottom: 10px;}
	</style>
<body>
	<%@ include file="../common/admin-navi.jsp"%>
	<div class="row">
		<div class="col-xs-1">
			<%@ include file="../common/admin-sidebar.jsp"%>
		</div>
		<div class="col-xs-11">
			<div class="container">
				<h1 class="admin-buttom">배너관리</h1>
				<div class="well">
					<form>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>번&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;호</label>
								</div>
								<div class="col-xs-11">1</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-jagan admin-line-height">배너타이틀</label>
								</div>
								<div class="col-xs-11">
									<input type="text" class="form-control" name="title" />
								</div>
							</div>
							<div class="row">
								<div class="col-xs-1">
									<label class="admin-jagan admin-line-height">서브타이틀</label>
								</div>
								<div class="col-xs-11">
									<input type="text" class="form-control" name="title" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									
								</div>
								<div class="col-xs-1">
                                    <label>표시여부</label>
								</div>
								<div class="col-xs-1">
								    <input type="checkbox" name="dispalyYn" />
								</div>
								<div class="col-xs-1">
									<label >노출순서</label>
								</div>
								<div class="col-xs-1">
									<input type="text" class="form-control admin-margin-buttom" name="priority" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-1">
									<label>이&nbsp;&nbsp;미&nbsp;&nbsp;지</label>
								</div>
								<div class="col-xs-11">
								    <input type="file" name="file"/>
                                    
								</div>
							</div>
						</div>
						
						<div class="text-right">
							<input type="submit" class="btn btn-warning" value="등록">
							<a href="admin-banner-list.jsp" class="btn btn-default">취소</a>
						</div>
					</form>
				</div>
			
			</div>
		</div>
	</div>
</body>
</html>