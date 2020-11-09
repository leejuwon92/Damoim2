<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.postHostInfo_section table th {
	width: 200px;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2625792f1e6e1fac26d00f60d91116c&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	var session_userNo = '${session_userNo}';
	$(document).on("click", "[value='모임삭제하기']", function(){
		if(session_userNo != null) {
			if(confirm('정말로 모임을 삭제하시겠습니까?')){
				var postNo = $(this).attr('id');
				location.href = "${pageContext.request.contextPath }/front?key=host&mn=hostPostDelete&post_no="+postNo;
			} else {
				return;
			}
		} else {
			alert("로그인을 해주세요");
			return;
		}
	});
	
	$(document).on("click", "[value='신청하기']", function(){
		console.log(session_userNo);
		var currentPeople = ${postDTO.currentPeople}
		var totalPeople = ${postDTO.totalPeople}
		
		if(currentPeople >= totalPeople){
			alert("정원이 가득 차 해당 모임에 신청할 수 없습니다.");
			return false;
		}
		
		if(session_userNo != null){
			if(confirm('모임에 신청하시겠습니까?')){
				var postNo = $(this).attr('id');
				var categoryNo = $(this).attr('name');
				location.href = "${pageContext.request.contextPath}/front?key=client&mn=clientJoinMoim&post_no="+postNo+"&category_no="+categoryNo;	
			} else {
				return;
			}
		} else {
			alert("로그인을 해주세요");		
			return;
		}
	});
	
	$(document).on("click", "[value='신청취소하기']", function(){
		if(session_userNo != null){
			if(confirm('정말로 신청 취소하시겠습니까?')){
				var postNo=$(this).attr('id');
				location.href = "${pageContext.request.contextPath}/front?key=client&mn=clientCancleMoim&post_no="+postNo;
			} else {
				return;
			}
		} else {
			alert("로그인을 해주세요");	
			return;
		}
	});
	
	$("#questionBtn").click(function(){
		
		if(session_userNo==""){
			alert("회원만 댓글을 달 수 있습니다.");
		return false;
		}
		
		if( $("#qnaTextArea").val() == "" ){
			alert("내용을 입력해주세요.");
			$("#qnaTextArea").focus();
			return false;
		}
		
		$("#qnaForm").submit();
		
	});//questionBtn_click
	
	$(document).on("click","#replyBtn",function(){
		var userNo = ${postDTO.userNo}
		if(session_userNo != userNo ){
			alert("이 글의 작성자만 답변을 할 수 있습니다..");
			return false;
		}
		
		popup($(this).attr("class"));
	})//replyBtn_click
	
	function popup(questionNo){
		
		 var pop_title = "AnswerPopup" ;
         
	     window.open("", pop_title, 'width=500,height=500') ;
	         
	        var frmData = document.ansform ;
	        frmData.target = pop_title ;
	        frmData.action = '${pageContext.request.contextPath}/client/answerPopup.jsp?questionNo='+questionNo ;
	         
	        frmData.submit() ;
	}
	
	$(document).on("click","input[value='삭제하기']",function(){
		
		if($(this).attr("id") != session_userNo){
			alert("이 질문의 작성자만 삭제 할 수 있습니다..");
			return false;
		}
		
		var questionNo = $(this).attr("name")
		var postNo = ${postDTO.postNo};
		location.href = "${pageContext.request.contextPath}/front?key=client&mn=clientDeleteReply&question_no="+questionNo+"&post_no=" + postNo;
	});//replyDelBtn_click

});//ready

</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- 게시글의 카테고리 이름 section -->
	<section class="categoryName_section" style="margin-top: 10px">
		<div class="container">
			<h4>취미 | ${categoryName}</h4>
			<hr width="300px" align="left">
		</div>
		<!-- container -->
	</section>
	<!-- categoryName_section -->

	<!-- 게시글의 정보가 들어갈 장소 -->
	<section class="postInfo_section">
		<div class="container">
			<div style="text-align: center">
				<h3>
					<b>${postDTO.postTitle}</b>
				</h3>
				<hr>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<img src="${pageContext.request.contextPath}/img/thumbnailimg/${postDTO.thumbnailFile}"
					width="540px" height="300px">
				</div>
				<!-- col-6 -->
				<div class="col-xl-6">

					<div class="row" style="padding: 19px">
						<div class="col-xl-4">장소</div>
						<div class="col-xl-8">${postDTO.locationDetail}</div>
					</div>

					<div class="row" style="padding: 19px">
						<div class="col-xl-4">모임일</div>
						<div class="col-xl-8">
							<fmt:parseDate value="${postDTO.meetingDate}" var="meetingDate"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${meetingDate}" pattern="yyyy-MM-dd" />
						</div>
					</div>

					<div class="row" style="padding: 19px">
						<div class="col-xl-4">신청인원</div>
						<div class="col-xl-8">${postDTO.currentPeople}/
							${postDTO.totalPeople}</div>
					</div>

					<div class="row" style="padding: 19px">
						<div class="col-xl-4">신청기간</div>
						<div class="col-xl-8">
							<fmt:parseDate value="${postDTO.regDate}" var="regDate"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />
							&nbsp; ~ &nbsp;
							<fmt:parseDate value="${postDTO.deadline}" var="deadline"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${deadline}" pattern="yyyy-MM-dd" />
						</div>
					</div>

					<div class="row" style="padding: 19px">
						<div class="col-xl-12">
							<c:choose>
								<c:when
									test="${checker == true && postDTO.userNo eq session_userNo }">
									<input type="button" class="btn btn-primary"
										id="${postDTO.postNo }" value="모임삭제하기" style="width: 100%">
								</c:when>
								<c:when test="${checker == true}">
									<input type="button" class="btn btn-primary"
										id="${postDTO.postNo }" value="신청취소하기" style="width: 100%">
								</c:when>
								<c:otherwise>
									<input type="button" class="btn btn-primary"
										id="${postDTO.postNo }" name="${postDTO.categoryCode }"
										value="신청하기" style="width: 100%">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<!-- col-6 -->
			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</section>
	<!-- categoryName_section -->

	<!-- 게시글의 내용이 들어갈 장소 -->
	<section class="postContents_section" style="margin-top: 20px">
		<div class="container">
			<h4>상세정보</h4>
			<hr width="300px" align="left">
			${postDTO.postContent}
		</div>
		<!-- container -->
	</section>
	<!-- postContents_section -->

	<!-- 게시글의 장소정보가 들어갈 장소 -->
	<section class="postLocationInfo_section" style="margin-top: 20px">
		<div class="container">
			<h4>모임장소</h4>
			<hr width="300px" align="left">
			<table class="table table-borderless">
				<tr>
					<td>
						<h5>모임장소</h5>
						<p>${postDTO.locationDetail}
					</td>
					<td>
						<div id="map" style="width: 700px; height: 350px;"></div>
					</td>
				</tr>
			</table>
		</div>
		<!-- container -->
	</section>
	<!-- postContents_section -->

	<!-- 게시글의 질문답변이 들어갈 장소 -->
	<section class="postQnA_section" style="margin-top: 20px">
		<div class="container">
			<h4>Q&nbsp;&amp;&nbsp;A</h4>
			<hr width="300px" align="left">
			<table class="table table-borderless">
				<thead class="thead-light">
					<tr>
						<th width="51%" style="text-align: center">내용</th>
						<th width="16%" style="text-align: center">작성자</th>
						<th width="16%" style="text-align: center">작성일</th>
						<th width="16%" style="text-align: center">기타</th>
					</tr>
				</thead>
			</table>
			<c:forEach items="${requestScope.question}" var="question">
				<c:if test="${question.answerNo==0}">
					<div class="row" style="padding: 10px">
						<div class="col-xl-6">
							<div>
								<div class="row">
									<div class="col-xl-9">
										<a href="#" id="replyBtn" class="${question.questionNo}"
											style="color: black"> ${question.replyContent}</a>
									</div>
									<div class="col-xl-3" style="text-align: right"></div>
									<div class="row"></div>
								</div>
							</div>
						</div>
						<div class="col-xl-2" style="text-align: center">
							${question.userID}</div>
						<div class="col-xl-2" style="text-align: center">
							${question.regdate}</div>
						<div class="col-xl-2" style="text-align: center">
							<input type="button" class="btn btn-outline-primary" 
							id="${question.userNo}" name="${question.questionNo}" value="삭제하기">						
						</div>
					</div>
				</c:if>
				<c:forEach items="${requestScope.answer}" var="answer">
					<c:if test="${question.questionNo == answer.answerNo}">
						<div class="row" style="padding: 10px">
							<div class="col-xl-6">
								<div style="margin-left: 30px">
									&#8227;&nbsp;${answer.replyContent}</div>
							</div>
							<div class="col-xl-2" style="text-align: center">
								${answer.userID}</div>
							<div class="col-xl-2" style="text-align: center">
								${answer.regdate}</div>
							<div class="col-xl-2" style="text-align: center">
								<input type="button" class="btn btn-outline-primary" 
							id="${answer.userNo}" name="${answer.questionNo}" value="삭제하기">
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>

			<form id="qnaForm" method="post"
				action="${pageContext.request.contextPath}/front?key=client&mn=clientInsertReply">
				<table class="table table-borderless" style="margin-top: 10px">
					<tr>
						<td width="85%"><textarea style="width: 100%; height: 50px"
								id="qnaTextArea" name="reply_content"></textarea></td>
						<td width="15%"><input type="text" name="post_no"
							value="${postDTO.postNo}" hidden="hidden"> <input
							type="text" name="session_userNo" value="${session_userNo}"
							hidden="hidden"> <input type="button"
							class="btn btn-primary" value="질문하기" id="questionBtn"
							style="padding: 14px 30px 14px 30px"></td>
					</tr>
				</table>
			</form>

			<form id="ansform" name="ansform" method="post" hidden="hidden">
				<input type="text" name="post_no" value="${postDTO.postNo}">
				<input type="text" name="session_userNo" value="${session_userNo}">
			</form>

		</div>
		<!-- container -->
	</section>
	<!-- postContents_section -->

	<!-- 게시글의 호스트정보가 들어갈 장소 -->
	<section class="postHostInfo_section">
		<div class="container">
			<h4>문의하기</h4>
			<hr width="300px" align="left">
			<table class="table table-borderless">
				<thead class="thead-light">
					<tr>
						<th>
							<h5>담당자</h5>
						</th>
						<td>
							<h5>${clientDTO.userName}</h5>
						</td>
					</tr>
					<tr>
						<th>
							<h5>담당자이메일</h5>
						</th>
						<td>
							<h5>${clientDTO.userEmail}</h5>
						</td>
					</tr>
				</thead>
			</table>
		</div>
		<!-- container -->
	</section>
	<!-- postContents_section -->


	<hr>
	<jsp:include page="../footer.jsp"></jsp:include>\

	<script>
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 
	
	// 키워드로 장소를 검색합니다
	
	searchPlace();
	
	function searchPlace(){
		var keyword = "${postDTO.locationDetail}";

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB); 
	}
	
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	
	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}
	
	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	    infowindow.open(map, marker); 
	    
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
</script>
</body>
</html>