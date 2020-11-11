<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.js" integrity="sha512-uzuo1GprrBscZGr+iQSv8+YQQsKY+rSHJju0FruVsGHV2CZNZPymW/4RkxoHxAxw3Lo5UQaxDMF8zINUfAsGeg==" crossorigin="anonymous"></script>
<script>
	jQuery(function($) {
		$('#pagination').twbsPagination({
		    totalPages: 10,	// 총 페이지 번호 수
		    visiblePages: 7,	// 하단에서 한번에 보여지는 페이지 번호 수
		    startPage : 1, // 시작시 표시되는 현재 페이지
		    initiateStartPageClick: true,	// 플러그인이 시작시 페이지 버튼 클릭 여부 (default : true)
		    first : "첫 페이지",	// 페이지네이션 버튼중 처음으로 돌아가는 버튼에 쓰여 있는 텍스트
		    prev : "이전 페이지",	// 이전 페이지 버튼에 쓰여있는 텍스트
		    next : "다음 페이지",	// 다음 페이지 버튼에 쓰여있는 텍스트
		    last : "마지막 페이지",	// 페이지네이션 버튼중 마지막으로 가는 버튼에 쓰여있는 텍스트
		    nextClass : "page-item next",	// 이전 페이지 CSS class
		    prevClass : "page-item prev",	// 다음 페이지 CSS class
		    lastClass : "page-item last",	// 마지막 페이지 CSS calss
		    firstClass : "page-item first",	// 첫 페이지 CSS class
		    pageClass : "page-item",	// 페이지 버튼의 CSS class
		    activeClass : "active",	// 클릭된 페이지 버튼의 CSS class
		    disabledClass : "disabled",	// 클릭 안된 페이지 버튼의 CSS class
		    anchorClass : "page-link",	//버튼 안의 앵커에 대한 CSS class
		    
		    onPageClick: function (event, page) {
		    	redraw(page);	
		    }
		});
		
		var flag = true;
    	
		function redraw(page) {
			$("postListDiv").empty();
			if(flag){
				flag = false;
				$.ajax({
					type: "post",
					url : "moimList",
					data: {"page" : page, "pageSize" : 8, 
						"category_no":$("#category option:selected").val(),
						"location_no":$("#location option:selected").val(),
						"date":$("#date option:selected").val()
					},
					dataType:"json",
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					success: function(result){
						$("#pagination").twbsPagination("changeTotalPages", result[0], page);
						var str = "";
						if(result[1] == null){
							str += "<h1 color = 'Brown'>해당하는 모임 정보가 없습니다</h1><br><br>";
						} else {
							for(var i in result[1]){
								str += "<div class='row'>";
								str += "<div class='col-md-7'>";
								str += "<a href='front?key=user&mn=userSelectBoard&postNo=" + result[1][i].postNo + "'>";
								str += "<img src='${pageContext.request.contextPath}/img/uploadImg/" + result[1][i].thumbnailFile + "' alt='' width='580px' height='290px' >";
								str += "</a>";
								str += "</div>";
								str += "<div class='col-md-5'>";
								str += "<h3>" + result[1][i].postTitle + "</h3>";
								str += "<p><b>모임 설명</b> : " + result[1][i].postDescr + "</p>";
								str += "<p><b>모임 장소</b> : " + result[1][i].locationDetail + "</p>";
								str += "<p><b>모임 일정</b> : " + formatDate(result[1][i].meetingDate) + "</p>";								
								str += "<p><b>신청 인원</b>: " + result[1][i].currentPeople + " / " + result[1][i].totalPeople + "</p>";
								str += "<p><b>마감 일정</b> : ~ " + formatDate(result[1][i].deadline) + "</p>";
								
								str += "</div>";
								str += "</div>";
								str += "<br>"
							}
						}
						
						$("#postListDiv").html(str);
					},
					complete: function(){	// 이부분 중요
						flag = true;	//호출 완료되면 flag 값을 사용가능하게 변경
					}
				}); 
			}
		} // redraw end
		
		redraw(1);
		
		$(document).on("click","#SelectFilterBtn",function() {
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
		
			redraw(1);
	
		});//SelectFilterBtn_click

		function formatDate(date_str){
			var dateFirstSplit = date_str.split(' ');
			var dateSplit = dateFirstSplit[0].split('-')
			var yyyy = dateSplit[0];
			var mm = dateSplit[1];
			var dd = dateSplit[2];
			var str = yyyy + "-" + mm + "-" + dd; 
			
			return str;
		}
		
		
		
	});//ready
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 행사검색 게시판 검색필터 Section -->
	<section class="searchFilter_section">
		<div class="container" style="margin-top: 30px">
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
							<input type="button" class="btn btn-outline-primary" value="조회하기" id="SelectFilterBtn"
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
				<%-- <c:forEach items="${requestScope.postList}" var="postlist">
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
				</c:forEach> --%>
			</div>
		</div><!-- container -->
	</section><!-- postList_section -->
	
	<div class="container">
    	<nav aria-label="Page navigation">
    	    <ul class="pagination" id="pagination"></ul>
   		</nav>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>\
</body>
</html>