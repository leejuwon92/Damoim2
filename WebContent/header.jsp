<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- CSS here -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header/headerstyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header/bootstrap.min.css">

</head>
<body>
	<header>
		<div class="header-area">
			<div class="header-top">
				<div class="header-top-right">
					<ul>
						<li><a href="${pageContext.request.contextPath}/user/userRegister.jsp">회원가입</a></li>
						<li><a href="${pageContext.request.contextPath}/user/userLogin.jsp">로그인</a></li>
					</ul>
				</div>
				<!-- header-top-right -->
			</div><!--header-top -->
			
			<div class="header-bottom">
				<div class="row align-items-center">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/index.jsp"> <img src="${pageContext.request.contextPath}/img/header/damoim_logo.png" alt=""></a>
					</div><!-- logo -->
					<div class="main-menu">
						<nav>
							<ul id="navigation">
								<li><a href="${pageContext.request.contextPath}/front?key=user&mn=userSelectBoardList" class="btn header-btn">행사검색</a></li>
								<li><a href="#" class="btn header-btn">신청내역 조회</a></li>
								<li><a href="${pageContext.request.contextPath}/host/CreateMoimForm.jsp" class="btn header-btn">행사개설</a></li>
							</ul>
						</nav>  
					</div><!-- main-menu -->
				</div><!-- row align-items-center -->
			</div><!-- header-bottom -->
		</div>
		<!-- /header-area -->
	</header>


</body>
</html>