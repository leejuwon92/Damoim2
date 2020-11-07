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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
						$("#postListDiv").empty();
						var str = "";
						$.each(result,function(index,item) {
							
							str += "<div class='row'>";
							str += "<div class='col-md-7'>";
							str += "<a href='front?key=user&mn=userSelectBoard&postNo=" + item.postNo + "'>";
							str += "<img class='img-fluid rounded mb-3 mb-md-0' src='http://placehold.it/700x300' alt=''>";
							str += "</a>";
							str += "</div>";
							str += "<div class='col-md-5'>";
							str += "<h3>" + item.postTitle + "</h3>";
							str += "<p>모임 설명 : " + item.postDescr + "</p>";
							str += "<p>모임 장소 : " + item.locationDetail + "</p>";
							str += "<p>신청 인원 : " + item.currentPeople + " / " + item.totalPeople + "</p>";
							str += "<p>마감 일정 : ~ " + item.deadline + "</p>";
							str += "</div>";
							str += "</div>";
							str += "<br>"
							
						});
						$("#postListDiv").html(str);

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
			<div id="postListDiv">
				<c:forEach items="${requestScope.postList}" var="postlist">
					<div class="row">
						<div class="col-md-7">
        					<a href="front?key=user&mn=userSelectBoard&postNo=${postlist.postNo}">
								<img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
          					</a>
        				</div><!-- col7 -->
						<div class="col-md-5">
        					<h3>${postlist.postTitle}</h3>
          					<p>모임 설명 : ${postlist.postDescr}</p>
          					<p>모임 장소 : ${postlist.locationDetail}</p>
          					<p>신청 인원 : ${postlist.currentPeople} / ${postlist.totalPeople} </p>
          					<p>마감 일정 : ~ ${postlist.deadline}</p>
        				</div>
					</div><!-- row -->
				<br>
				</c:forEach>
			</div>
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