<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- bootstrap cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- ckEditor CDN -->
<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
<!-- datepicker cdn	 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/host/bootstrap.min.css">

<!-- map API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2625792f1e6e1fac26d00f60d91116c&libraries=services"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/host/map.css" type="text/css" />

<script type="text/javascript">
jQuery(function($){	
	$('#deadline, #meetingDate').datepicker({
        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        format: "yyyy/mm/dd",
        language: "ko",
        startDate: "today",
    });

	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	$("#search").click(function(){
		searchPlaces();
	});

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var keyword = document.getElementById('keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);

	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

	        alert('검색 결과가 존재하지 않습니다.');
	        return;

	    } else if (status === kakao.maps.services.Status.ERROR) {

	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;

	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
			names = new Array();
			names[i] = places[i].address_name + " " + places[i].place_name;
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title, address) {
	        	var strArr = new Array();
	        	strArr = address.split(" ");
	        	var address_str = "";
	        	for(var j=0; j<strArr.length; j++){
	        		if(j != 0 && typeof strArr[j] != "undefined" | strArr[j] != null | strArr[j] != ""){
	        			address_str += strArr[j] + " ";
	        		}
	        	}
	        	
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	            
	            kakao.maps.event.addListener(marker, 'click', function() {
	                $("#locationDetail").val(address_str + title);
	            });

	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };

	        })(marker, places[i].place_name, places[i].address_name);

	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
		placeAdressName = places.road_address_name;
		placeName = places.place_name;
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';

	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           

	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 

	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }

	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;

	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }

	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	
	
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	
	 
	 $("#submit").click(function(){
		 alert()
		 $("#createForm").submit();
	 });
	
});//ready
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div class="container">
	<div style="text-align: left; margin-top: 35px" >
		<h3><b>DaMoim 모임 수정</b></h3>
		<hr width="300px" align="left">
	</div>
	
	<form method="post" enctype="multipart/form-data" action= "../front?key=host&mn=hostPostUpdate" id="createForm" onSubmit=''>
    	<input type="hidden" id="post_no" name="post_no" value="${post.postNo }"/>
    	<div class="form-group">
			<label for="postDescr">모임 간단 소개</label>
			<input type="text" class="form-control" name="postDescr" id="postDescr" value="${post.postDescr }"/>
		</div>
		<br>
		<div class="form-group">
			<label for="editor">모임 정보</label>
		 	<textarea name="editordata" id="editor"></textarea>
  		</div>
		<br>
    	<div class="form-group">
			<label for="deadline">모집 마감일</label>
			<input type="text" autocomplete="off" class="form-control" name="deadline" id="deadline" value="${post.deadline }"/>
		</div>
		<br>
		<div class="form-group pmd-textfield pmd-textfield-floating-label">
			<label for="meetingDate">모임일자</label>
			<input type="text" autocomplete="off" class="form-control" name="meetingDate" id="meetingDate" value="${post.meetingDate }"/>
	  	</div>
  				
		<div class="form-group">
			<label for="totalPeople">참가인원</label>
			<input type="text" class="form-control" name="totalPeople" id="totalPeople" value="${post.totalPeople }"/>
    	</div>
     	<br>
    
    	<div class="form-group">
 			<label for="category">장소</label>
  			<select name="location" id="location" name="location" class="custom-select" value="${post.locationCode }">
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
	    </div>
		<br>
		
    	<div class="form-group">
			<label for="locationDetail">상세주소</label>
			<p>
			<input type="text" class="form-control" name="locationDetail" id="locationDetail" value="${post.locationDetail }"/>
			<div class="map_wrap">
	    		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		    	<div id="menu_wrap" class="bg_white">
		       		<div class="option">
		            	<div>
		                	<form onsubmit="searchPlaces(); return false;">
		                  		키워드 : <input type="text" value="${post.locationDetail }" id="keyword" size="15"> 
		                    	<button type="button" id="search">검색하기</button> 
		                	</form>
		            	</div>
		        	</div>
		        	<hr>
		        	<ul id="placesList"></ul>
		     	<div id="pagination"></div>
				</div>
			</div>
  		</div>
		<br><hr>
		<div style="text-align: left">
			<input type="submit" class="btn btn-outline-primary" value="수정하기">
			<input type="button" class="btn btn-outline-primary" value="취소">
		</div>
	</div>
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