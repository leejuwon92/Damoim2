<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#joinMoimbtn").click(function(){
		$(location).attr("href","${pageContext.request.contextPath}/front?key=client&mn=clientJoinMoim");	
	})
	
})



</script>
</head>
<body> 

<input type="button" value="신청하기" id="joinMoimbtn">
</body>
</html>