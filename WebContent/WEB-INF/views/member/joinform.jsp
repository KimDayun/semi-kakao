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
            width: 720px;
        }

        div {
            margin: 20px;
        }
    </style>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js""></script>
</head>

<body>
<%@ include file="../common/navigation.jsp" %>
    <div class="container text-center">
        <div class="row">
            <form method="post" action="register.kakao" onsubmit="checkField(event);">
            
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i><span style="color: red; font-size: 20px;"> *</span></span>
                    <input type="text" id="user-id" name="userid" class="form-control" placeholder="아이디" aria-describedby="basic-addon1" onkeyup="checkId();" style="width: 100%;">
              		<span class="" style="display: none; width: 0%;" id="id-error-msg"></span>
                </div>
                
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-lock"></i><span style="color: red; font-size: 20px;"> *</span></span>
                    <input type="password" id="user-pwd" name="userpwd" class="form-control" placeholder="비밀번호(영문 숫자를 사용한 8자 이상)" aria-describedby="basic-addon1" onkeyup="clickField()">
                </div>
                
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-ok"></i><span style="color: red; font-size: 20px;"> *</span></span>
                    <input type="password" id="user-pwd-check" class="form-control" placeholder="비밀번호 확인" onkeyup="checkPwd();" aria-describedby="basic-addon1">
              		<span class="" style="display: none; width: 0%;" id="pwd-error-msg"></span>
                </div>
                
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i><span style="color: red; font-size: 20px;"> *</span></span>
                    <input type="text" id="user-name" name="username" class="form-control" placeholder="이름" aria-describedby="basic-addon1">
                </div>
                
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-phone"></i><span style="color: red; font-size: 20px;"> *</span></span>
                    <input type="text" id="user-phone" name="userphone" class="form-control" placeholder="휴대폰번호" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-envelope"></i><span style="color: red; font-size: 20px;"> *</span></span>
                    <input type="text" id="user-email" name="useremail" class="form-control" placeholder="이메일" aria-describedby="basic-addon1">
                </div>

                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-home"></i></span>
                    <input type="text" id="user-postal-code" name="userpostalcode" id="addr1" readonly="readonly" class="form-control" style="width: 15%;" placeholder="우편번호" aria-describedby="basic-addon1">
                    <button type="button" class="btn btn-default" onclick="execPostCode();" style="float: left;">우편번호 찾기</button>
                    <input type="text" id="user-address" name="useraddress" id="addr2" class="form-control" placeholder="도로명주소" readonly="readonly" aria-describedby="basic-addon1">
                    <input type="text" id="user-detail-address" name="userdetailaddress" id="addr3" class="form-control" placeholder="상세주소" aria-describedby="basic-addon1">
                </div>

                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-calendar"></i></span>
                    <input type="date" id="user-birth" name="userbirth" class="form-control" placeholder="생년월일" aria-describedby="basic-addon1">
                </div>

                <div>
                    <input class="btn btn-primary" type="submit" name="" value="회원가입">
                </div>
            </form>
        </div>
    </div>
    
    <script type="text/javascript">
    	function clickField() {
			var userpwd = document.getElementById("user-pwd").value;
			var pwdCheckEl = document.getElementById("user-pwd-check");
			var pwdCheck = pwdCheckEl.value;
			
			var msgbox = document.getElementById('pwd-error-msg');
			
			
			if (pwdCheck == "") {
				pwdCheckEl.style.width = "100%";
				msgbox.style.display = "none";
    		} else if (userpwd != pwdCheck) {
				msgbox.setAttribute("class", "alert alert-danger");
				msgbox.style.display = "inline-block";
				pwdCheckEl.style.width = "70%";
				msgbox.style.width = "30%";
				msgbox.style.lineHeight = "3px";
				msgbox.style.marginBottom = "0px";
				msgbox.textContent = "비밀번호가 일치하지 않습니다.";
    		} else {
    			msgbox.setAttribute("class", "alert alert-success");
				msgbox.style.display = "inline-block";
    			pwdCheckEl.style.width = "70%";
				msgbox.style.width = "30%";
				msgbox.style.lineHeight = "3px";
				msgbox.style.marginBottom = "0px";
				msgbox.textContent = "비밀번호가 일치합니다.";
    		}
    	}
    
		function checkField(e) {
			// 특정 태그에서 특정 이벤트 발생 시 수행되는 기본동작의 발현을 방해한다.
			var userid = document.getElementById("user-id").value;
			var userpwd = document.getElementById("user-pwd").value;
			var userpwdcheck = document.getElementById("user-pwd-check").value;
			var username = document.getElementById("user-name").value;
			var userphone = document.getElementById("user-phone").value;
			var useremail = document.getElementById("user-email").value;
			
			if(userid == "") {
				alert("아이디는 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			
			if(userpwd == "") {
				alert("비밀번호는 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			if(userpwdcheck == "") {
				alert("비밀번호 확인은 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			if(username == "") {
				alert("이름은 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			if(userphone == "") {
				alert("핸드폰 번호는 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			if(useremail == "") {
				alert("이메일은 필수 입력값 입니다.")
				e.preventDefault();
				return
			}
			
			if(userpwd != userpwdcheck) {
				alert("비밀번호가 일치하지 않습니다.");
				e.preventDefault();
				return;
			}
		}
		
		function checkId() {
			var userEl = document.getElementById("user-id");
			var userid = userEl.value;
			
			var msgbox = document.getElementById('id-error-msg');
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					var isExist = result.exist;
					if (isExist == 'Yes') {
						msgbox.setAttribute("class", "alert alert-danger");
						msgbox.style.display = "inline-block";
						userEl.style.width = "70%";
						msgbox.style.width = "30%";
						msgbox.style.lineHeight = "3px";
						msgbox.style.marginBottom = "0px";
						msgbox.textContent = "이미 사용중인 아이디입니다.";
					} else {
						msgbox.setAttribute("class", "alert alert-success");
						msgbox.style.display = "inline-block";
						userEl.style.width = "70%";
						msgbox.style.width = "30%";
						msgbox.style.lineHeight = "3px";
						msgbox.style.marginBottom = "0px";
						msgbox.textContent = "사용가능한 아이디입니다.";
					}
				}
			}
			xhr.open("GET", "checkid.kakao?id=" + userid);
			xhr.send();
		}
		
    	function checkPwd() {
			var userpwd = document.getElementById("user-pwd").value;
			var pwdCheckEl = document.getElementById("user-pwd-check");
			var pwdCheck = pwdCheckEl.value;
			
			var msgbox = document.getElementById('pwd-error-msg');
			
    		if (userpwd != pwdCheck) {
				msgbox.setAttribute("class", "alert alert-danger");
				msgbox.style.display = "inline-block";
				pwdCheckEl.style.width = "70%";
				msgbox.style.width = "30%";
				msgbox.style.lineHeight = "3px";
				msgbox.style.marginBottom = "0px";
				msgbox.textContent = "비밀번호가 일치하지 않습니다."
    		} else if (pwdCheck == "") {
				pwdCheckEl.style.width = "100%";
				msgbox.style.display = "none";
    		} else {
    			msgbox.setAttribute("class", "alert alert-success");
				msgbox.style.display = "inline-block";
    			pwdCheckEl.style.width = "70%";
				msgbox.style.width = "30%";
				msgbox.style.lineHeight = "3px";
				msgbox.style.marginBottom = "0px";
				msgbox.textContent = "비밀번호가 일치합니다.";
    		}
    	}
    	
		function execPostCode() {
			new daum.Postcode({
				oncomplete: function(data) {
					$('[name=userpostalcode]').val(data.zonecode); // 우편번호 (5자리)
					$('[name=useraddress]').val(data.address);
					$('[name=userdetailaddress]').val(data.buildingName);
				}
            }).open();
        }
	</script>
<%@ include file="../common/footer.jsp" %>
</body></html>