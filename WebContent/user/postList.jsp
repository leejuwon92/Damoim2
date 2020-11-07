<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
							str += "<td rowspan='5' width='40%'>"
							str += "<a href='front?key=user&mn=userSelectBoard&postNo="+ item.postNo+ "'>";
							str += "<img width='460px' height='330px' src='${pageContext.request.contextPath}/img/sample/" + item.thumbnailFile + "'>";
							str += "</a>";
							str += "</td>";
							str += "<td width='30%'><h4>취미</h4></td>";
							str += "<td width='30%'><h4>" + item.categoryCode + "</h4></td>";
							str += "</tr>"
							str += "<tr>";
							str += "<td><h4>지역</h4></td>";
							str += "<td><h4>" + item.locationCode + "</h4></td>";
							str += "</tr>"
							str += "<tr>";
							str += "<td><h4>모임명</h4></td>"
							str += "<td><h4>" + item.postTitle + "</h4></td>";
							str += "</tr>";
							str += "<tr>";
							str += "<td><h4>참가인원</h4></td>";
							str += "<td><h4>" + item.currentPeople + " / " + item.totalPeople + "</h4></td>";
							str += "</tr>";
							str += "<tr>";
							str += "<td><h4>마감일</h4></td>";
							str += "<td><h4> ~ " + item.deadline + "</h4></td>";
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

	<!-- 행사검색 게시판 검색필터 Section -->
	<section class="searchFilter_section">
		<div class="container">
			<form method="post" id="selectBoxForm">
				<table class="table-borderless">
					<tr>
						<td width="65%" rowspan="2"><h2>검색필터</h2></td>
						<td width="10%">
							<select class="form-control" name="category" id="category">
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
							</select>
						</td>
						<td width="10%">
							<select class="form-control" name="location" id="location">
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
						</td>
						<td width="15%">
							<select class="form-control" name="date" id="date">
								<option value="0">지난행사조회</option>
								<option value="30">1개월</option>
								<option value="90">3개월</option>
								<option value="180">6개월</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="button" class="btn btn-primary" value="조회하기" id="SelectFilterBtn"
							style="padding: 5px 171px;"> 
						</td>
					</tr>
				</table>
			</form>
		</div><!-- container -->
	</section><!-- searchFilter_section -->

	<!-- 행사검색 게시판 선택된 검색필터 Section -->
	<section class="selectedFilter_section">
		<div class="container">
			<hr>
			<div class="card" style="width: auto; border: none;">
				<div class="card-body">
					<h4 class="card-title">선택된 검색옵션</h4>
					<div class="card-text" id="selSearchOpt"></div>
     		 	</div><!-- card-body -->
    		</div><!-- card -->
		</div><!-- container -->
	</section><!-- selectedFilter_section -->
	
	<!-- 행사검색 게시판 조회 Section -->
	<section class="postList_section">
		<div class="container">
			<table class="table" id="postListTable" style="text-align: center">
				<c:forEach items="${requestScope.postList}" var="postlist">
				<tr>
					<td rowspan="5" width="40%">
						<a href="front?key=user&mn=userSelectBoard&postNo=${postlist.postNo}">
							<img width="460px" height="330px" src="${pageContext.request.contextPath}/img/sample/${postlist.thumbnailFile} ">
						</a>
					</td>
					<td width="30%"><h4>취미</h4></td>
					<td width="30%"><h4>${postlist.categoryCode}</h4></td>
				</tr>
				<tr>
					<td><h4>지역</h4></td>
					<td><h4>${postlist.locationCode}</h4></td>
				</tr>
				<tr>
					<td><h4>모임명</h4></td>
					<td><h4>${postlist.postTitle}</h4></td>
				</tr>
				<tr>
					<td><h4>참가인원</h4></td>
					<td><h4>${postlist.currentPeople} / ${postlist.totalPeople}</h4></td>
				</tr>
				<tr>
					<td><h4>마감일</h4></td>
					<td><h4> ~ ${postlist.deadline}</h4></td>
				</tr>
				</c:forEach>
			</table>
		</div><!-- container -->
	</section><!-- postList_section -->
	
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