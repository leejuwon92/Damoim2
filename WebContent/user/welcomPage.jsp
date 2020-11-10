<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Consolas, sans-serif;
}
h1 {
	margin: 30px 0px;
	text-align: center;
}
img {
	max-width: 100%;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
tr th {
	background-color: pink
}
td, th {
	padding: 3px
}
.button {
	width: 50%;
}
div.button input {
	padding: 5px;
	width: 20%;
	font-size: 18px;
	margin: 50px text-align:center;
}
.button {
	margin-left: auto;
	margin-right: auto;
}
</style>
<script type="text/javascript">
	//홈가기 이동
	function mainOpen() {
		location.href = "${pageContext.request.contextPath}/start.jsp";
	}
	//로그인 이동
	function loginOpen() {
		location.href = "${pageContext.request.contextPath}/user/userLogin.jsp";
	}
</script>


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="a" style="margin: 50px 0px">
		<h1>WELCOME to DamoIm</h1>
	</div>
	<div class="b"></div>
	<img src="${pageContext.request.contextPath}/img/welcome/welcome.jpg" alt="">


	<div class="button" style="text-align: center" >
		<input type="button" class="btn btn-outline-primary" value="홈가기" onclick="mainOpen()" /> 
		<input type="button" class="btn btn-outline-primary" value="로그인하기" onclick="loginOpen()" />
	</div>
	<div style="margin-bottom: 50px"></div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>