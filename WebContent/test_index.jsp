<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 호스트 테스팅 </h1>
<a href="front?key=host&mn=hostUserList&post_no=1">리스트보기</a><p/>
<a href=<%=request.getContextPath()+"/host/CreateMoimForm.jsp" %>>글 등록</a><p/>
<a href=<%=request.getContextPath()+"/host/UpdateMoimForm.jsp" %>>글 수정</a><p/>
<a href="front?key=host&mn=hostPostDelete&post_no=23">글 삭제</a><p/>
</body>
</html>