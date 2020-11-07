<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/client/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(document).on("click", "[name='delete']", function(){
			console.log($(this).attr("id"));
		});
	});
</script>

</head>
<body>
<!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">신청한 모임</h1>
      <hr>
		<h4 class="my-4">진행중인 나의 모임</h4>
		<c:choose>	
		<c:when test="${empty postList }">
			참가하신 모임이 없습니다
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</c:when>
			<c:otherwise>	
			<c:forEach items="${postList}" var="post"> 
	    	  <!-- Project One -->
		      <div class="row">
		        <div class="col-md-7">
		          <a href="#">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
		          </a>
		        </div>
		        <div class="col-md-5">
	          <h3>${post.postTitle }</h3>
	          <p>모임 간단설명 : ${post.postDescr }</p>
	          <p>모임 카테고리 : ${post.categoryNoTocategoryName(post.categoryCode) }</p>
	          <p>모임 장소 : ${post.locationNoTolocationName(post.locationCode)} ${post.locationDetail }</p>
	          <p>현재신청인원 : ${post.currentPeople }</p>
	          <p>마감일 : ${post.deadline }</p>
	          <a class="btn btn-primary" id="${post.postNo }" name='delete' href="../front?key=client&mn=clientCancleMoim&post_no=${post.postNo}">신청취소</a>
	        </div>
	      </div>
	      <!-- /.row -->
	      <hr>
   		 </c:forEach>
		</c:otherwise>
    </c:choose>
    
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

  
    <!-- /.container -->
     <hr color="black">
     <h4 class="my-4">지난 나의 모임</h4>
      <hr>
     <div class="row text-center">
       <c:choose>	
		<c:when test="${empty postList }">
			참가했던 지나간 모임이 없습니다
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</c:when>
			<c:otherwise>	
			<c:forEach items="${postList}" var="post"> 
	    	  <!-- Project One -->
		      <div class="row">
		        <div class="col-md-7">
		          <a href="#">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
		          </a>
		        </div>
		        <div class="col-md-5">
	          <h3>${post.postTitle }</h3>
	          <p>모임 간단설명 : ${post.postDescr }</p>
	          <p>모임 카테고리 : ${post.categoryNoTocategoryName(post.categoryCode) }</p>
	          <p>모임 장소 : ${post.locationNoTolocationName(post.locationCode)} ${post.locationDetail }</p>
	          <p>현재신청인원 : ${post.currentPeople }</p>
	          <p>마감일 : ${post.deadline }</p>
	        </div>
	      </div>
	      <!-- /.row -->
	      <hr>
   		 </c:forEach>
		</c:otherwise>
    </c:choose>
   </div>    
</body>
</html>