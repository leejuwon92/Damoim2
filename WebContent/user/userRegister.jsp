<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var idstate = 0;
		var pwdstate = 0;
		var emailstate = 0;
		
		$("#idCheckBtn").click(function() {
			if( $("#user_id").val()=="" ){
				$("idCheckSpan").html("아이디를 입력하세요").css({"font-size" : "15px", "color" : "red"});
				$("#idCheckSpan").focus();
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
						$("#idCheckSpan").html("아이디가 중복되어 사용하실 수 없습니다.").css({"font-size" : "15px", "color" : "red"});
						idstate = 0;
					}else{
						$("#idCheckSpan").html("사용가능한 아이디입니다.").css({"font-size" : "15px", "color" : "blue"});
						idstate = 1;
					}
						
				},//success
				error : function(err) {//요청결과가 실패했을 때 호출될 callback함수
					console.log(err + "예외발생..");
				}//error
			});//ajax
		});//idCheckBtnCheck_click
		
		$("#user_pwdcheck").keyup(function(){
			if($("#user_pwd").val() == $(this).val()){
				$("#pwdCheckSpan").html("비밀번호가 일치합니다.").css({"font-size" : "15px", "color" : "blue"});
				pwdstate = 1;
			}else{
				$("#pwdCheckSpan").html("비밀번호가 일치하지 않습니다.").css({"font-size" : "15px", "color" : "red"});
				pwdstate = 0;
			}
		});//user_pwdcheck_keyup
		
		$("#emailCheckBtn").click(function() {
			if( $("#user_email").val()=="" ){
				$("emailCheckSpan").html("이메일을 입력하세요").css({"font-size" : "15px", "color" : "red"});
				$("#emailCheckSpan").focus();
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
						$("#emailCheckSpan").html("이메일이 중복되어 사용하실 수 없습니다.").css({"font-size" : "15px", "color" : "red"});
						emailstate = 0;
					}else{
						$("#emailCheckSpan").html("사용가능한 이메일입니다.").css({"font-size" : "15px", "color" : "blue"});
						emailstate = 1;
					}
				},//success
				error : function(err) {//요청결과가 실패했을 때 호출될 callback함수
					console.log(err + "예외발생..");
				}//error
			});//ajax
		});//emailCheckBtnCheck_click
		
		$(document).on("click","#userRegisterBtn",function(){
			
			if(idstate == 0){
				alert("아이디 중복확인을 해주세요.")
				$("#user_id").focus();
				return false;
			}
			
			if($("#user_name").val() == ""){
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
			
			if($("#user_phone").val() == ""){
				alert("연락처 확인을 해주세요.")
				$("#user_phone").focus();
				return false;
			}
			
			$("#registerForm").submit();
		});//click
		
		
			
			
		
	}); //ready
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<hr>
	<form id="registerForm" method="post" action="${pageContext.request.contextPath}/front?key=user&mn=userRegister">
	<h1>회원가입</h1>
	<br>
	<h2>
		아이디:&nbsp;<input type="text" name="userId" id="user_id" size="20" /> 
		<input type="button" value="아이디중복체크" id="idCheckBtn" />
		<span id="idCheckSpan"></span>
		<br> 
		이름:&nbsp;<input type="text" name="userName" id="user_name" size="20" /><br>
		비밀번호:&nbsp;<input type="password" name="userPwd" id="user_pwd" size="20" /><br>
		비밀번호확인:&nbsp;<input type="password" name="pwdcheck" id="user_pwdcheck" />
		<span id="pwdCheckSpan"></span>
		<br>
		이메일:&nbsp;<input type="text" name="userEmail" id="user_email" size="20" />
		<input type="button" value="이메일 중복 체크" id="emailCheckBtn"/> 
		<span id="emailCheckSpan"></span>
		<br> 
		연락처:&nbsp;<input type="text" name="phoneNo" id="user_phone" size="20" /><br> <br>
		<a href="#" id="agreement">&lt;약관동의&gt;</a> <br> 
		<input type="button" value="회원가입" id="userRegisterBtn"/>
		<input type="button" value="취소" onclick="location.href='index.jsp'" />&nbsp;&nbsp;&nbsp;
	</h2>
	</form>

	<hr>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>