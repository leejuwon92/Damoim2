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
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<hr>

<div style="text-align: center;">
	<form method="post" id="loginForm" action="${pageContext.request.contextPath}/front?key=user&mn=userLogin">
		아이디:&nbsp;<input type="text" id="userId" name="userId"><br>
		비밀번호:&nbsp;<input type="password" id="userPwd" name="userPwd"><br>
		<input type="button" value="로그인" id="loginBtn"/>
	</form>
	<hr>
	<input type="button" value="아이디 찾기" id="userSelectIdBtn"/>
	<input type="button" value="비밀번호 찾기" id="userSelectPwdBtn"/>		
</div>	
<hr>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>