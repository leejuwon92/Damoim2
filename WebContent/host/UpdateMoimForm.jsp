<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- ckEditor CDN -->
<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
<!-- datepicker -->


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="../css/host/summernote-lite.css">
<link rel="stylesheet" href="../css/host/bootstrap.min.css">


<!-- map API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2625792f1e6e1fac26d00f60d91116c&libraries=services"></script>


<script type="text/javascript">


$(document).ready(function(){
	//여기 아래 부분

	
	$( function() {
	    $( "#deadline" ).datepicker({dateFormat:'yy-mm-dd'});
	  } );
	  
	$( function() {
	    $( "#meetingDate" ).datepicker({dateFormat:'yy-mm-dd'});
	  } );
	
	
});

$(document).ready(function(){
	//map 관련 변수
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.402029, 127.106741), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };  
	var map = new kakao.maps.Map(mapContainer, mapOption); 	// 지도를 생성합니다    
	var ps = new kakao.maps.services.Places(); // 장소 검색 객체를 생성합니다
	searchPlace(); // 키워드로 장소를 검색합니다
	
	$(document).on("blur","#locationDetail",function(){
		searchPlace();
	})//locationDetail_blur
	
	/* $("#deadline").datepicker(); */
	 
         $( function() {
   			 $( "#deadline" ).datepicker();
  		} );
	
	/* $( "#deadline" ).datepicker({dateFormat:'yy-mm-dd'});
	  
	$( "#meetingDate" ).datepicker({dateFormat:'yy-mm-dd'}); */
	
	function searchPlace(){
		var keyword = $("#locationDetail").val();

     		if (keyword == null || keyword == "") {
     			return false;
     		}
     		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
     		ps.keywordSearch( keyword, placesSearchCB); 
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
	    
	    searchPlace();
	}
	
});//ready
</script>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>
<hr>
	
<h2>DaMoim 모임 수정</h2>
<form method="post" enctype="multipart/form-data" action= "../front?key=host&mn=hostPostUpdate&post_no=1" id="createForm" onSubmit='return checkValid()'>
	
	<div class="form-group">
  					<label for="postTitle">모임명</label>
  					<input type="text" class="form-control" name="postTitle" id="postTitle"/>
  	</div>

    
    <div class="form-group">
  					<label for="postDescr">모임 간단 소개</label>
  					<input type="text" class="form-control" name="postDescr" id="postDescr"/>
  				</div>
	<br>
	
	<div class="form-group">
  					<label for="editor">모임 정보</label>
  					 <textarea name="editordata" id="editor">
 					</textarea>
  	</div>
  	

	<div class="form-group">
  					<label for="category">장소</label>
	  <select name="location" id="location" name="location" class="custom-select">
    <option value="0">--지역을 선택하세요 --</option>
      <option value="1">서울시</option>
      <option value="2">경기도</option>
      <option value="3">인천시</option>
      <option value="4">충청도</option>
      <option value="5">강원도</option>
      <option value="6">전라도</option>
      <option value="7">경상도</option>
      <option value="8">제주도</option>
    </select>
    <br>
    
    <div class="form-group">
  					<label for="locationDetail">상세주소</label>
  					<p>
  					<input type="text" class="form-control" name="locationDetail" id="locationDetail"/>
  					<div id="map" style="width:100%; height:350px;"></div>
  	</div>
  	
    <div class="form-group">
  					<label for="deadline">모집 마감일</label>
  					<input type="text" autocomplete="off" class="form-control" name="deadline" id="deadline"/>
  	</div>
	<div class="form-group pmd-textfield pmd-textfield-floating-label">
  					<label for="meetingDate">모임일자</label>
  					<input type="text" autocomplete="off" class="form-control" name="meetingDate" id="meetingDate"/>
  	</div>
  				

	<div class="form-group">
  					<label for="totalPeople">참가인원</label>
  					<input type="text" class="form-control" name="totalPeople" id="totalPeople"/>
    </div>
	
	
	
	<span>필수항목을 입력해 주세요</span>
	<br><br>
	<input type="button" class="btn btn-primary" value="취소">
	<input type="submit" class="btn btn-primary" value="수정하기">
	
</form>

<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
	ClassicEditor
	.create( document.querySelector( '#editor' ) )
	.catch( error => {
    console.error( error );
} );

</script>
</body>
</html>