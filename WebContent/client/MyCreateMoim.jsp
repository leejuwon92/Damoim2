<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/client/bootstrap.min.css">
</head>
<body>
<!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">개설한 모임</h1>
      <hr>
		<h4 class="my-4">진행중인 나의 모임</h4>
		<c:choose>
		<c:when test="${empty postList}">
			개설한 모임이 없습니다.
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</c:when>
			<c:otherwise>
			<c:forEach items="${postList}" var="post">
      		<!-- Project One -->
      		<div class="row">
        	 <div class="col-md-7">
          	   <a href="${pageContext.request.contextPath}/front/key=user&mn=userSelectBoard?postNo=${post.postNo}">
                <img class="img-fluid rounded mb-3 mb-md-0" src="${post.thumbnailFile}" alt="">
               </a>
             </div>
             <div class="col-md-5">
          <h3>${post.postTitle}</h3>
          <p>모임 간단설명 : ${post.postDescr}</p>
          <p>모임 카테고리 : ${post.categoryNoTocategoryName(post.categoryCode)}</p>
          <p>모임 장소 : ${post.locationNoTolocationName(post.locationCode)} ${post.locationDetail}</p>
          <p>현재신청인원 : ${post.currentPeople}</p>
          <p>마감일 : ${post.deadline}</p>
          <a class="btn btn-primary" id="${post.postNo}" href="${pageContext.request.contextPath}/host/list.jsp?post_no=${post.postNo}" target="center">신청자 보기</a>
          <a class="btn btn-primary" id="${post.postNo}" href="${pageContext.request.contextPath}/host/UpdateMoimForm.jsp?post_no=${post.postNo}" target="center">수정하기</a>
          <a class="btn btn-primary" id="${post.postNo}" href="${pageContext.request.contextPath}/front?key=host&mn=hostPostDelete&post_no=${post.postNo}">삭제하기</a>
        </div>
      </div>
      <!-- /.row -->
      <hr>
		</c:forEach>
		</c:otherwise>
	</c:choose>			
			
     <hr>

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>

  	<jsp:useBean id="now" class="java.util.Date"/>
  	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
    <!-- /.container -->
     <hr color="black">
     <h4 class="my-4">지난 나의 모임</h4>
      <hr>
    <div class="row text-center">
       <c:choose>	
		<c:when test="${empty postList}">
			개설한 지나간 모임이 없습니다
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</c:when>
			<c:otherwise>	
			<c:forEach items="${postList}" var="post"> 
			<fmt:parseDate value="${post.meetingDate}" var="meetingDate" pattern="yyyy-MM-dd"></fmt:parseDate>
			<fmt:formatDate value="${meetindDate}" pattern="yyyy-MM-dd" var="date"/>
			<c:if test="${today}<=${date}">
	    	  <!-- Project One -->
		      <div class="row">
		        <div class="col-md-7">
		          <a href="${pageContext.request.contextPath}/front/key=user&mn=userSelectBoard?postNo=${post.postNo}">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="${post.thumbnailFile}" alt="">
		          </a>
		        </div>
		        <div class="col-md-5">
	          <h3>${post.postTitle }</h3>
	          <p>모임 간단설명 : ${post.postDescr}</p>
	          <p>모임 카테고리 : ${post.categoryNoTocategoryName(post.categoryCode) }</p>
	          <p>모임 장소 : ${post.locationNoTolocationName(post.locationCode)} ${post.locationDetail}</p>
	          <p>현재신청인원 : ${post.currentPeople}</p>
	          <p>마감일 : ${post.deadline}</p>
	        </div>
	      </div>
	      <!-- /.row -->
	      <hr>
	      </c:if>
   		 </c:forEach>
		</c:otherwise>
    </c:choose>
   </div>    
</body>
</html>