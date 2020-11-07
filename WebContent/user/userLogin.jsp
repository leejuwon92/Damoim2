<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#loginBtn").click(function(){

		if($("#userId").val() == ""){
			alert("아이디를 입력 해주세요.")
			$("#userId").focus();
			return false;
		}
		
		if($("#userPwd").val() == ""){
			alert("비밀번호를 입력 해주세요.")
			$("#userPwd").focus();
			return false;
		}
		
		$("#loginForm").submit();
		
		
	});//loginBtn_click

	$("#userSelectIdBtn").click(function(){
		$(location).attr("href","userSelectId.jsp");	
		
	});//userSelectIdBtn_click
	
	$("#userSelectPwdBtn").click(function(){
		$(location).attr("href","userSelectPwd.jsp");	
		
	});//userSelectIdBtn_click
	
});//ready

</script>

<style>
body {
  font: 13px/20px "Lucida Grande", Tahoma, Verdana, sans-serif;
  color: #404040;
  background: #0ca3d2;
}

.login {
  position: relative;
  margin: 30px auto;
  padding: 20px 20px 20px;
  width: 310px;
  background: white;
  border-radius: 3px;
  -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}

.login:before {
  content: '';
  position: absolute;
  top: -8px;
  right: -8px;
  bottom: -8px;
  left: -8px;
  z-index: -1;
  background: rgba(0, 0, 0, 0.08);
  border-radius: 4px;
}

.login h1 {
  margin: -20px -20px 21px;
  line-height: 40px;
  font-size: 15px;
  font-weight: bold;
  color: #555;
  text-align: center;
  text-shadow: 0 1px white;
  background: #f3f3f3;
  border-bottom: 1px solid #cfcfcf;
  border-radius: 3px 3px 0 0;
  background-image: -webkit-linear-gradient(top, whiteffd, #eef2f5);
  background-image: -moz-linear-gradient(top, whiteffd, #eef2f5);
  background-image: -o-linear-gradient(top, whiteffd, #eef2f5);
  background-image: linear-gradient(to bottom, whiteffd, #eef2f5);
  -webkit-box-shadow: 0 1px whitesmoke;
  box-shadow: 0 1px whitesmoke;
}

.login p {
  margin: 20px 0 0;
}

.login p:first-child {
  margin-top: 0;
}

.login input[type=text], .login input[type=password] {
  width: 278px;
}


.login p.submit {/* 로그인버튼 위치 */
  text-align: right;
}


:-moz-placeholder {
  color: #c9c9c9 !important;
  font-size: 13px;
}

::-webkit-input-placeholder {
  color: #ccc;
  font-size: 13px;
}

input {
  font-family: 'Lucida Grande', Tahoma, Verdana, sans-serif;
  font-size: 14px;
}

input[type=text], input[type=password] {
  margin: 5px;
  padding: 0 10px;
  width: 200px;
  height: 34px;
  color: #404040;
  background: white;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px solid #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
}

input[type=text]:focus, input[type=password]:focus {
  border-color: #7dc9e2;
  outline-color: #dceefc;
  outline-offset: 0;
}


.lt-ie9 input[type=text], .lt-ie9 input[type=password] {
  line-height: 34px;
}

</style>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<hr>

<div class="login">
 <h1>Login to DamoIm</h1>
  <form method="post"  id="loginForm" action="${pageContext.request.contextPath}/front?key=user&mn=userLogin"">
		ID:&nbsp;<p><input type="text" id="userId" name="userId" value="" placeholder="Username"></p>
		Password:&nbsp;<p><input type="password" id="userPwd" name="userPwd" value="" placeholder="Password"></p>
         </p>
         <p class="submit"><input type="button"  id="loginBtn" name="commit" value="로그인"></p>
    
 
	</form>
	<hr>
	<input type="button" value="아이디 찾기" id="userSelectIdBtn"/>
	<input type="button" value="비밀번호 찾기" id="userSelectPwdBtn"/>		
</div>	
<hr>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>