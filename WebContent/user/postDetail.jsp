<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<hr>

<h1>${categoryName}</h1>
<hr>
<table>
	<tr>
		<td rowspan="6">${postDTO.thumbnailFile}</td>
		<td>글제목</td>
		<td>${postDTO.postTitle}</td>
	</tr>
	<tr>
		<td>일시</td>
		<td>${postDTO.meetingDate}</td>
	</tr>
	<tr>
		<td>장소</td>
		<td>${postDTO.locationDetail}</td>
	</tr>
	<tr>
		<td>현재신청인원</td>
		<td>${postDTO.currentPeople} / ${postDTO.totalPeople} </td>
	</tr>
	<tr>
		<td>신청시간</td>
		<td>${postDTO.regDate} ~ ${postDTO.deadline}</td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="신청하기" style="width: 400px"></td>
	</tr>
</table>
<hr>
 ${postDTO.postContent}
<hr>
<h2>장소</h2>
<h3>장소 이름 : ${postDTO.locationDetail}</h3>
<h1>맵 API가 들어갈 장소 입니다.</h1>
<hr>
<h2>호스트정보</h2>
<h3>담당자 : </h3>
<h3>담당자이메일 : </h3>
<hr>
<h1>질문하기 들어갈 장소 입니다.</h1>

<hr>
<jsp:include page="../footer.jsp"></jsp:include>\



</body>
</html>