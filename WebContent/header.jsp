<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.headerTop .input[type=button]{
	padding: 30px;
}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var session_userNo = '${session_userNo}';
	
	$("#registerBtn").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/user/userRegister.jsp");
	});

	$("#loginBtn").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/user/userLogin.jsp");		
	});

	$("#myPageBtn").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/client/MypageIframe.jsp");		
	});

	$("#logOutBtn").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/Logout.jsp");	
	});
	
	$("#searchMoimBtn").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/front?key=user&mn=userSelectBoardList");	
	});
		
	
	$("#openMoimBtn").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/host/CreateMoimForm.jsp");	
	});
	
	$(document).on("click","#searchMyMoimBtn",function(){
		if(session_userNo ==null||session_userNo==""){
			alert("로그인을 해주세요");
			return;
			}else {
				//alert(session_userNo);
				$(location).attr("href", "${pageContext.request.contextPath}/client/MypageIframe.jsp");
				return;
			}
	});
	
	
}); //ready
</script>
</head>
<body>

<!-- 헤더시작 -->
<section class="header_section">
	<%
		if(session.getAttribute("session_userNo") == null || 
			session.getAttribute("session_userId") == null){
	%>
	
	<div class="headerTop">
		<div class="container-fluid" style="background-color: rgb(38,38,38);">
			<div class="row">
				<div class="col-xl-1"></div>
				<div class="col-xl-10">
					<div style="text-align: right">
						<input type="button" class="btn btn-dark" value="회원가입" id="registerBtn"
						style=" border-color: rgb(38,38,38); background-color: rgb(38,38,38); font-size: 16px; width: 150px; height: 70px; border-radius: 15px">
						<input type="button" class="btn btn-dark" value="로그인" id="loginBtn"
						style=" border-color: rgb(38,38,38); background-color: rgb(38,38,38);;font-size: 16px; width: 150px; height: 70px; border-radius: 15px">
					</div>
				</div>
				<div class="col-xl-1"></div>
			</div><!-- row -->
		</div><!-- container_fluid / background color -->
	</div><!-- headerTop  -->
	
	<%} else { %>
	
	<div class="headerTop">
		<div class="container-fluid" style="background-color: rgb(38,38,38);">
			<div class="row">
				<div class="col-xl-1"></div>
				<div class="col-xl-10">
					<div style="text-align: right">
						<input type="button" class="btn btn-dark" value="마이페이지" id="myPageBtn"
						style=" border-color: rgb(38,38,38); background-color: rgb(38,38,38); font-size: 16px; width: 150px; height: 70px; border-radius: 15px">
						<input type="button" class="btn btn-dark" value="로그아웃" id="logOutBtn"
						style=" border-color: rgb(38,38,38); background-color: rgb(38,38,38); font-size: 16px; width: 150px; height: 70px; border-radius: 15px">
					</div>
				</div>
				<div class="col-xl-1"></div>
				
			</div><!-- row -->
		</div><!-- container_fluid / background color -->
	</div><!-- headerTop  -->
				
	<%} %>
		
	<div class="headerBottom" style="margin: 2px">
		<div class="row justify-content-end">
				<div class="col-xl-1"></div>
				<div class="col-xl-3">
					<a href="${pageContext.request.contextPath}/start.jsp"> 
						<img src="${pageContext.request.contextPath}/img/header/damoim_logo.png" alt="">
						
					</a>
				</div>
		
				<div class="col-xl-7">
					<div style="text-align: right">
						<input type="button" class="btn btn-primary" value="모임검색" id="searchMoimBtn"
						style=" font-size: 16px; width: 150px; height: 70px; border-radius: 15px">
						<input type="button" class="btn btn-primary" value="신청내역 조회" id="searchMyMoimBtn"
						style=" font-size: 16px; width: 150px; height: 70px; border-radius: 15px">
						<input type="button" class="btn btn-primary" value="모임개설" id="openMoimBtn"
						style=" font-size: 16px; width: 150px; height: 70px; border-radius: 15px">
					</div>
				</div>
			<div class="col-xl-1"></div>
		</div><!-- row -->
	</div><!-- headerBottom -->
</section><!-- header_section -->

</body>
</html>