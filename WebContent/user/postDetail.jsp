<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.postInfo_section .thumbnail{
	width: 700px;
	height: 400px;
	text-align: center;
}
.postHostInfo_section table th{
	width: 200px;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2625792f1e6e1fac26d00f60d91116c&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		if(session_userNo != null){
			if(confirm('모임에 신청하시겠습니까?')){
				var postNo = $(this).attr('id');
				var categoryNo = $(this).attr('name');
				location.href = "${pageContext.request.contextPath }/front?key=client&mn=clientJoinMoim&post_no="+postNo+"&category_no="+categoryNo;	
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
	
});//ready
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<hr>

<!-- 게시글의 카테고리 이름 section -->
<section class="categoryName_section">
	<div class="container">
		<h4>취미 | ${categoryName}</h4>	
		<hr>
	</div><!-- container -->
</section><!-- categoryName_section -->

<hr>
<!-- 게시글의 정보가 들어갈 장소 -->
<section class="postInfo_section">
	<div class="container">
		<div style="text-align: center">
		<h3><b>${postDTO.postTitle}</b></h3>
		</div>
		<table class="table table-borderless">
			<tr>
				<td rowspan="5" class = "thumbnail">
					<img class="img-thumbnail"  alt="" 
					src="${pageContext.request.contextPath}/img/sample/${postDTO.thumbnailFile}"
					width="50%" height="50%">
				</td>
			
				<td>일시</td>
				<td>${postDTO.meetingDate}</td>
			</tr>
			<tr>
				<td>장소</td>
				<td>${postDTO.locationDetail}</td>
			</tr>
			<tr>
				<td>신청인원</td>
				<td>${postDTO.currentPeople} / ${postDTO.totalPeople} </td>
			</tr>
			<tr>
				<td>신청시간</td>
				<td>${postDTO.regDate} ~ ${postDTO.deadline}</td>
			</tr>
			<tr>
			<c:choose>
			<c:when test="${checker == true && postDTO.userNo eq session_userNo }">
				<td colspan="2">
				<input type="button" class="btn btn-primary" id="${postDTO.postNo }" value="모임삭제하기" style="width: 100%" ></td>
			</c:when>
			<c:when test="${checker == true}">
				<td colspan="2">
				<input type="button" class="btn btn-primary" id="${postDTO.postNo }" value="신청취소하기" style="width: 100%" ></td>
			</c:when>
			<c:otherwise>
				<td colspan="2">
				<input type="button" class="btn btn-primary" id="${postDTO.postNo }" name="${postDTO.categoryCode }" value="신청하기" style="width: 100%" ></td>
			</c:otherwise>
			</c:choose>
				
			</tr>
		</table>
	</div><!-- container -->
</section><!-- categoryName_section -->

<!-- 게시글의 내용이 들어갈 장소 -->
<section class="postContents_section">
	<div class="container">
		<hr>
		<h4>상세정보</h4>
		<hr>
		${postDTO.postContent}
	</div><!-- container -->
</section><!-- postContents_section -->

<!-- 게시글의 장소정보가 들어갈 장소 -->
<section class="postLocationInfo_section">
	<div class="container">
		<hr>
		<h4>모임장소</h4>
		<hr>
		<table class="table table-borderless">
			<tr>
				<td>
					<h5>모임장소</h5>
					<p>${postDTO.locationDetail}
				</td>
				<td>
					<div id="map" style="width:700px;height:350px;"></div>
				</td>
			</tr>
		</table>
	</div><!-- container -->
</section><!-- postContents_section -->

  <!-- 게시글의 질문답변이 들어갈 장소 -->
<section class="postQnA_section">
	<div class="container">
		<hr>
		<h4>Q&nbsp;&amp;&nbsp;A</h4>
		<hr>
		<table class="table table-borderless">
			<thead class="thead-light">
				<tr>
					<th width="70%" style="text-align: center">내용</th>
					<th width="15%" style="text-align: center">작성자</th>
					<th width="15%" style="text-align: center">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.question}" var="question">
					<c:if test="${question.answerNo==0}">
						<tr>
							<td>${question.replyContent}</td>
							<td>${question.userNo}</td>
							<td>${question.regdate}</td>
						</tr>
					</c:if>
					<c:forEach items="${requestScope.answer}" var="answer">
						<c:if test="${question.questionNo == answer.answerNo}">
							<tr>
								<td><span style="margin: 10px">ㄴ</span>${answer.replyContent}</td>
								<td>${answer.userNo}</td>
								<td>${answer.regdate}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</tbody>
			</table>
			
			<table class="table table-borderless">
				<tr>
					<td width="85%">
						<textarea style="width: 100%; height: 50px"></textarea>		
					</td>	
					<td width="15%">
						<input type="button" class="btn btn-primary" value="질문하기"
						style="padding: 14px 30px 14px 30px " >		
					</td>
				</tr>
			</table>
			
	</div><!-- container -->
</section><!-- postContents_section -->
 
 <!-- 게시글의 호스트정보가 들어갈 장소 -->
<section class="postHostInfo_section">
	<div class="container">
		<hr>
		<h4>문의하기</h4>
		<hr>
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
	</div><!-- container -->
</section><!-- postContents_section -->


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
		var keyword = ${postDTO.locationDetail};

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