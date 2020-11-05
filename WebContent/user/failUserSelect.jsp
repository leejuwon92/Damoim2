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
	
	$("#backBtn").click(function(){
		$(location).attr("href","${pageContext.request.contextPath}/user/userLogin.jsp");
		
	});//cancelBtn_click
	
});//ready
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<hr>
	<br>
	<h2>
		회원님의 정보와 일치하는 회원정보가 없습니다.
	</h2>
	<input type="button" value="뒤로가기" id="backBtn"> 
	<br>
	<hr>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>