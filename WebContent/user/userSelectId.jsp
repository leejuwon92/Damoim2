<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#cancelBtn").click(function(){
		$(location).attr("href","${pageContext.request.contextPath}/user/userLogin.jsp");
		
	});//cancelBtn_click
	
	$(document).on("click","#selectIdBtn",function(){
		
		if($("#user_name").val() == ""){
			alert("이름을 입력 해주세요.")
			$("#user_name").focus();
			return false;
		}
		
		if($("#user_email").val() == ""){
			alert("이메일을 입력 해주세요.")
			$("#user_email").focus();
			return false;
		}
		
		if($("#user_phone").val() == ""){
			alert("연락처를 입력 해주세요.")
			$("#user_phone").focus();
			return false;
		}
		
		$("#selectIdForm").submit();
		
	});//selectIdBtn_click
	
});//ready
</script>
</head>
<body>

	<form id = "selectIdForm" method="post" action="${pageContext.request.contextPath}/front?key=user&mn=userSelectId">
		<h1>아이디 찾기</h1>
		<br>
			이&nbsp;&nbsp;&nbsp;름:&nbsp;<input type="text" name="name" id="user_name" size="20" /><br>
			이메일:&nbsp;<input type="text" name="email" id="user_email" size="20" /><br>
			연락처:&nbsp;<input type="text" name="phone" id="user_phone" size="20" /><br>
			<p>
			<input type="button" value="아이디 찾기" id="selectIdBtn"/>&nbsp;&nbsp;&nbsp; 
			<input type="button" value="취소" id="cancelBtn"/>
	</form>
</body>
</html>