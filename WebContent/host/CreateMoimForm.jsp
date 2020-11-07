<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/summernote-lite.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/summernote-ko-KR.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="/code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/host/summernote-lite.css">
<link rel="stylesheet" href="../css/host/bootstrap.min.css">


<script type="text/javascript">
<%
request.setCharacterEncoding("UTF-8");
%>


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
<jsp:include page="../header.jsp"></jsp:include>
<hr>

<%
	if(session.getAttribute("session_userNo") == null || session.getAttribute("session_userNo") == null) {
%>		
		
<script>
	alert("로그인 해주세요")
	location.href="${pageContext.request.contextPath}/index.jsp";
</script>		
		
<%
} else {
%>		
		
	<!-- 회원가입 -->
	<section class="OpenMoim_section">
		<div class="container">
			<h2>DaMoim 모임 개설</h2>
			<form method="post" enctype="multipart/form-data" action= "../front?key=host&mn=hostPostInsert" id="createForm" onSubmit='return checkValid()'>
				<div class="form-group">
  					<label for="postTitle">모임명</label>
  					<input type="text" class="form-control" name="postTitle" id="postTitle"/>
  				</div>
  				
  				<div class="form-group">
  					<label for="postDescr">모임 간단 소개</label>
  					<input type="text" class="form-control" name="postDescr" id="postDescr"/>
  				</div>
			
				<div class="form-group">
  					<label for="summernote">모임 정보</label>
  					<textarea id="summernote" name="editordata"></textarea>
  				</div>
			
				<div class="form-group">
  					<label for="thumbnailFile">썸네일 이미지</label><br>
  					<input type="file" class="form-control-file" name="thumbnailFile" id="thumbnailFile"/>
  				</div>
			
				<div class="form-group">
  					<label for="bannerFile">배너 이미지</label><br>
  					<input type="file" class="form-control-file" name="bannerFile" id="bannerFile"/>
  				</div>
			
				<div class="form-group">
  					<label for="category">카테고리</label>
  					<select name="category" id="category" class="custom-select">
 						<option value="0">--카테고리를 선택하세요 --</option>
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
  				</div>
			
				<div class="form-group">
  					<label for="locationDetail">상세주소</label>
  					<input type="text" class="form-control" name="locationDetail" id="locationDetail"/>
  				</div>
  				
  				<div class="form-group">
  					<label for="deadline">모집 마감일</label>
  					<input type="text" class="form-control" name="deadline" id="deadline"/>
  				</div>
  				
  				<div class="form-group">
  					<label for="meetingDate">모임일자</label>
  					<input type="text" class="form-control" name="meetingDate" id="meetingDate"/>
  				</div>
			
				<div class="form-group">
  					<label for="totalPeople">참가인원</label>
  					<input type="text" class="form-control" name="totalPeople" id="totalPeople"/>
  				</div>
				
				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="개설하기">	
  					<input type="button" class="btn btn-primary" value="취소">
  				</div>
					
			</form>	<!-- form -->	
		</div><!-- container -->
	</section><!-- OpenMoim_section -->
		
<% } %>

<hr>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>