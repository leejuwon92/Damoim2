<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>
UserNO : <%=session.getAttribute("session_userNo") %><br>
UserId : <%=session.getAttribute("session_userId") %><br>
</h1>
</body>
</html>