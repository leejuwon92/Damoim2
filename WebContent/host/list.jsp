<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>순서</th>
			<th>유저번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>폰</th>
			<th>비번</th>
		</tr>
		<c:choose>
			<c:when test="${empty requestScope.list}">
			   	<tr>
			        <td colspan="7">
			            <p align="center"><b><span style="font-size:9pt;">등록된 상품이 없습니다.</span></b></p>
			        </td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="client" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${client.userNo }</td>
						<td>${client.userId }</td>
						<td>${client.userName }</td>
						<td>${client.userEmail }</td>
						<td>${client.phoneNo }</td>
						<td>${client.userPwd }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>
</body>
</html>