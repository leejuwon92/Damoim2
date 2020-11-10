<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header/headerstyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer/footerstyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer/bootstrap.min.css">
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var namestate = 0;
		var pwdstate = 0;
		var emailstate = 0;
		var phonestate = 0;
		var login_x = "<img src='${pageContext.request.contextPath}/img/user/login/login_x.png' width='25px' height='25px'>"
		var login_check = "<img src='${pageContext.request.contextPath}/img/user/login/login_check.png' width='25px' height='25px'>"
		$("#user_id").blur(function(){
			
			if( $("#user_id").val()==""){
				$("#idCheckSpan").html(login_x);
				idstate = 0;
				return false;
			}
			
			$.ajax({
				type : "post", //전송방식(get,post,put,delete)
				url : "../idCheck", //서버주소
				dataType : "text",//응답 데이터의 type(text, html, xml, json(***))
				data : { // 서버에게 보낼 parameter
					"userId" : $("#user_id").val()
				},//data 
				success : function(result) {//요청결과가 성공했을 때 호출될 callback함수
				
					if(result == 0){//0이면 같을때
						$("#idCheckSpan").html(login_x);
						idstate = 0;
					}else{
						$("#idCheckSpan").html(login_check);
						idstate = 1;
					}
						
				},//success
				error : function(err) {//요청결과가 실패했을 때 호출될 callback함수
					console.log(err + "예외발생..");
				}//error
			});//ajax 
			
		});//user_id_blur
		
		$("#user_name").blur(function(){
			if( $("#user_name").val()==""){
				$("#nameCheckSpan").html(login_x);
				namestate = 0;
				return false;
			}
			
			$("#nameCheckSpan").html(login_check);
			namestate = 1;
		})//user_name_blur
		
		
		$("#user_pwdcheck").blur(function(){
			if( $("#user_pwd").val()==""){
				$("#pwdCheckSpan").html(login_x);
				pwdstate = 0;
				return false;
			}
			
			
			if($("#user_pwd").val() == $(this).val()){
				$("#pwdCheckSpan").html(login_check);
				pwdstate = 1;
			}else{
				$("#pwdCheckSpan").html(login_x);
				pwdstate = 0;
			}
		});//user_pwdcheck_keyup
		
		
		$("#user_email").blur(function() {
			if( $("#user_email").val()=="" ){
				$("#emailCheckSpan").html(login_x);
				emailstate = 0;
				return false;
			}
			
			$.ajax({
				type : "post", //전송방식(get,post,put,delete)
				url : "../emailCheck", //서버주소
				dataType : "text",//응답 데이터의 type(text, html, xml, json(***))
				data : { // 서버에게 보낼 parameter
					"userEmail" : $("#user_email").val()
				},//data 
				success : function(result) {//요청결과가 성공했을 때 호출될 callback함수
					if(result == 0){//0이면 같을때
						$("#emailCheckSpan").html(login_x);
						emailstate = 0;
					}else{
						$("#emailCheckSpan").html(login_check);
						emailstate = 1;
					}
				},//success
				error : function(err) {//요청결과가 실패했을 때 호출될 callback함수
					console.log(err + "예외발생..");
				}//error
			});//ajax
		});//emailCheckBtnCheck_click

		$("#user_phone").blur(function(){
			if( $("#user_phone").val()==""){
				$("#phoneCheckSpan").html(login_x);
				phonestate = 0;
				return false;
			}
			
			$("#phoneCheckSpan").html(login_check);
			phonestate = 1;
		})//user_name_blur
		
		
		
		
		$(document).on("click","#userUpdateBtn",function(){
		
			
			if(namestate == 0){
				alert("이름을 입력 해주세요.")
				$("#user_name").focus();
				return false;
			}
			
			if(pwdstate == 0){
				alert("비밀번호를 확인을 해주세요.")
				$("#user_pwd").focus();
				return false;
			}
			
			if(emailstate == 0){
				alert("이메일 중복확인을 해주세요.")
				$("#user_email").focus();
				return false;
			}
			
			if(phonestate == 0){
				alert("연락처 확인을 해주세요.")
				$("#user_phone").focus();
				return false;
			}
			
			$("#updateForm").submit();
		});//click
		
		
			
	}); //ready
</script>	
</head>
<body>

	<!-- 회원정보 수정 -->
	<section class="registration_section">
		<div class = "container-fluid">
			<!-- Head Title -->
			<div style="text-align: left; margin-top: 35px" >
				<h3><b>회원 정보 수정</b></h3>
				<hr width="300px" align="left">
			</div>
			<form id="updateForm" method="post" action="${pageContext.request.contextPath}/front?key=client&mn=clientUpdateClientInform">
				<div class="form-group">
					<label for="user_name">Name:<span id="nameCheckSpan"></span></label>
		  			<input type="text" class="form-control" name="userName" id="user_name" value="${client.userName }"/>
				</div>
				
				<div class="form-group">
		  			<label for="user_pwd">Password:</label>
		  			<input type="password" class="form-control" name="userPwd" id="user_pwd"/>
		  		</div>
		  		
				<div class="form-group">
		  			<label for="user_pwdcheck">Password Check:<span id="pwdCheckSpan"></span></label>
		  			<input type="password" class="form-control" name="pwdcheck" id="user_pwdcheck" />
		  		</div>
		  		
		  		
				<div class="form-group">
		  			<label for="user_email">E-mail:<span id="emailCheckSpan"></span></label>
		  			<input type="text" class="form-control" name="userEmail" id="user_email" value="${client.userEmail}"/>
		  		</div>
		
				<div class="form-group">
		  			<label for="user_phone">Phone:<span id="phoneCheckSpan"></span></label>
		  			<input type="text" class="form-control" name="phoneNo" id="user_phone" value="${client.phoneNo}"/>
		  		</div>  
		  		<div style="text-align: left">
		  			<input type="button" class="btn btn-outline-primary" value="수정하기" id="userUpdateBtn" />
		  			<input type="button" class="btn btn-outline-primary" value="취소하기" onclick="location.href='start.jsp'" />
				</div>
			</form>
		</div><!-- container-fluid -->
	</section><!-- registration_section -->

	</body>
</html>