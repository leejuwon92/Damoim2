<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../js/summernote-lite.js"></script>
<script type="text/javascript" src="../js/summernote-ko-KR.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="../css/host/summernote-lite.css">
<link rel="stylesheet" href="../css/host/bootstrap.min.css">


<script type="text/javascript">


$(document).ready(function(){
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 400,                 // 에디터 높이
		  minHeight: 400,             // 최소 높이
		  maxHeight: 400,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
	
	
	$( function() {
	    $( "#deadline" ).datepicker({dateFormat:'yy-mm-dd'});
	  } );
	  
	$( function() {
	    $( "#meetingDate" ).datepicker({dateFormat:'yy-mm-dd'});
	  } );
	
	
});


</script>
</head>
<body>

<form method="post" enctype="multipart/form-data" action= "../front?key=host&mn=hostPostUpdate&post_no=1" id="createForm" onSubmit='return checkValid()'>

	<h3>모임명</h3>
    <input type="text" class="form-control" id="postTitle"  name="postTitle" >
    <br>
	<h3>모임 간단 소개</h3> 
	<input type="text" class="form-control" id="postDescr" name="postDescr">
	<br>
	<h3>모임 정보</h3>
	<textarea id="summernote" name="editordata"></textarea>
	<br>
	<br>
	<h3>장소</h3>
	<span>지역 선택</span>
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
    <span>상세 주소</span>
    <input type="text"  class="form-control" id="locationDetail" name="locationDetail">
     
	<h3>모집 마감일</h3>
	 <input type="text" id="deadline"  class="form-control" name="deadline">
	 <br>
	<h3>모임일자</h3>
	 <input type="text" id="meetingDate"  class="form-control" name="meetingDate">
	 <br>
	<h3>참가인원</h3>
	<input type="text" class="form-control"  id="totalPeople" name="totalPeople">
	<br><br><br><br>
	
	
	<span>필수항목을 입력해 주세요</span>
	<br><br>
	<input type="button" class="btn btn-primary" value="취소">
	<input type="submit" class="btn btn-primary" value="개설하기">
	
</form>

</body>
</html>