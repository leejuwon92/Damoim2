<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#toLogin").click(function(){
		$(location).attr("href","${pageContext.request.contextPath}/user/userLogin.jsp");
	});
	
	$("#toMain").click(function(){
		$(location).attr("href","${pageContext.request.contextPath}/start.jsp");
	});
});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<hr>
	<br>
	<h2>
		기능을 사용하시려면 로그인 해주세요
	</h2>
	<input type="button" value="로그인하기" id="toLogin"> 
	<input type="button" value="메인으로" id="toMain"> 
	<br>
	<hr>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>