<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 800px;
	height: 400px;
}

tr, th {
	border: 1px solid grey;
}

.parent {
	width: 90%;
	margin: 10px auto;
}

.first {
	font-size: 35px;
	float: left;
	width: 30%;
	box-sizing: border-box;
}

.second {
	border: 1px solid green;
	float: left;
	margin-left: 5%;
	width: 30%;
	box-sizing: border-box;
}

.third {
	border: 0px solid blue;
	float: right;
	width: 30%;
	box-sizing: border-box;
}

.selector {
	align-items: rigth;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.5.4/umd/popper.min.js"></script>
<script>
	$(document).ready(function() {$(document).on("click","#SelectFilterBtn",function() {
		//alert( $("#category").val() + " : " + $("#category option:selected").text() );
		$("#selSearchOpt").text("");
		var str = "";
		if ($("#category").val() != 0) {
			str += $("#category option:selected").text()+ "      ";
		}

		if ($("#location").val() != 0) {str += $("#location option:selected").text()+ "      ";
		}

		if ($("#date").val() != 0) {str += $("#date option:selected").text()+ "      ";
		}

		$("#selSearchOpt").text(str).css({"font-size" : "20px", "color" : "blue"})

		$.ajax({
			type : "post", //전송방식(get,post,put,delete)
			url : "${pageContext.request.contextPath}/boardListServlet", //서버주소
			dataType : "json",//응답 데이터의 type(text, html, xml, json(***))
			data : $("#selectBoxForm").serialize(),//data 
			success : function(result) {//요청결과가 성공했을 때 호출될 callback함수
						$("#postListTable").empty();
						var str = "";
						$.each(result,function(index,item) {
							str += "<tr>";
							str += "<td>"+ item.thumbnailFile+ "</td>";
							str += "<td><a href='front?key=user&mn=userSelectBoard&postNo="+ item.postNo+ "'>"+ item.postTitle + "</a></td>";
							str += "<td>" + item.postDescr + "</td>";
							str += "</tr>";

						});
						$("#postListTable").html(str);

			},//success
			error : function(err) {//요청결과가 실패했을 때 호출될 callback함수
			console.log(err + "예외발생..");
			}//error
		});//ajax

	});//SelectFilterBtn_click

	});//ready
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<hr>

	<br>
	<form method="post" id="selectBoxForm">

		<div class="parent">
			<div class="first" style="text-align: left;">검색 필터</div>
			<div class="third" style='text-align: center;'>
			<div class="row">
				<select class="form-control" name="category" id="category"
					style="width: 150px">
					<option value="0">취미 분야</option>
					<option value="1">댄스</option>
					<option value="2">스포츠</option>
					<option value="3">독서</option>
					<option value="4">음악</option>
					<option value="5">외국어</option>
					<option value="6">공예</option>
					<option value="7">봉사활동</option>
					<option value="8">여행</option>
					<option value="9">사진</option>
					<option value="10">요리</option>
					<option value="11">반려동물</option>
				</select> <select class="form-control" name="location" id="location"
					style="width: 150px">
					<option value="0">지역</option>
					<option value="1">서울특별시</option>
					<option value="2">경기도</option>
					<option value="3">인천광역시</option>
					<option value="4">충청도</option>
					<option value="5">강원도</option>
					<option value="6">전라도</option>
					<option value="7">경상도</option>
					<option value="8">제주도</option>
				</select> 
				<select class="form-control" name="date" id="date" style="width: 300px">
					<option value="0">지난행사조회</option>
					<option value="30">1개월</option>
					<option value="90">3개월</option>
					<option value="180">6개월</option>
				</select> 
				<input type="button" class="btn btn-primary" value="조회하기" id="SelectFilterBtn" style="width: 300px">
				</div>
			</div>
		</div>
	</form>
	<br>
	<br>
	<br>
	<hr>

	<br>

	<h4 style="padding-left: 30px;">선택된 검색옵션</h4>
	<div style="padding-left: 30px" id="selSearchOpt"></div>
	<br>
	<hr>
	<br>
	<br>
	<br>
	<table style="margin: auto;" id="postListTable">
		<c:forEach items="${requestScope.postList}" var="postlist">
			<tr>
				<td>${postlist.thumbnailFile}</td>
				<td><a
					href="front?key=user&mn=userSelectBoard&postNo=${postlist.postNo}">${postlist.postTitle}</a></td>
				<td>${postlist.postDescr}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<br>

	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="pagination" style="justify-content: center;">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>

	<hr>
	<jsp:include page="../footer.jsp"></jsp:include>\
</body>
</html>