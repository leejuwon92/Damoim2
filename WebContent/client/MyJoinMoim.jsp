<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
	$(function(){
		$(document).on("click", "[name='delete']", function(){
			console.log($(this).attr("id"));
		});
	});
</script>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/>
  	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<section class="myJoinMoim_section">
		<div class="container-fluid">
			<!-- Head Title -->
			<div style="text-align: left; margin-top: 35px" >
				<h3><b>신청한 모임</b></h3>
				<hr width="300px" align="left">
			</div>
			
			<!-- 진행중인 나의 모임 -->
			<div style="text-align: left" >
				<h4><b>진행중인 나의 모임</b></h4>
			</div>
			<div class="myJoinMoim_current">
				<c:choose>
					<c:when test="${empty postList }">
						<div style="padding-bottom: 300px">
							참가한 모임이 없습니다.
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${postList}" var="post">
							<fmt:parseDate value="${post.meetingDate}" var="meetingDate" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${meetingDate}" pattern="yyyy-MM-dd" var="date"/>
							<c:if test="${today < date}">
							<!-- Project One -->				
							<div class="row">
								<div class="col-xl-5">
									<a href="${pageContext.request.contextPath}/front?key=user&mn=userSelectBoard&postNo=${post.postNo}">
										<img src="${pageContext.request.contextPath}/img/uploadImg/${post.thumbnailFile}" width='450px' height='280px' >
									</a>			
								</div><!-- col-5 -->
								<div class="col-xl-7">
									<h3>${post.postTitle}</h3>
									<p>모임 간단설명 : ${post.postDescr}</p>
          							<p>모임 카테고리 : ${post.categoryNoTocategoryName(post.categoryCode)}</p>
          							<p>모임 장소 : ${post.locationNoTolocationName(post.locationCode)} ${post.locationDetail}</p>
          							<p>현재신청인원 : ${post.currentPeople}</p>
          							<p>모임일 : ${date}</p>
          							<a class="btn btn-outline-primary" id="${post.postNo }" name='delete' href="../front?key=client&mn=clientCancleMoim&post_no=${post.postNo}">신청취소</a>	
								</div><!-- col-7 -->
							</div><!-- row -->	
      						<hr>
      						</c:if>
      					</c:forEach>
        	 		</c:otherwise>
				</c:choose>
			</div><!-- myJoinMoim_current -->
			<hr color="black">
			<div style="text-align: left" >
				<h4><b>지난 나의 모임</b></h4>
			</div>
			<div class="myJoinMoim_past">
				
  				
				<%-- <c:choose>
					<c:when test="${empty postList}">
						<div style="padding-bottom: 300px">
							참가한 지난 모임이 없습니다.
						</div>
					</c:when>
					<c:otherwise> --%>
						<c:forEach items="${postList}" var="post">
							<fmt:parseDate value="${post.meetingDate}" var="meetingDate" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${meetingDate}" pattern="yyyy-MM-dd" var="date"/>
							<c:if test="${today > date}">	
								<!-- Project two -->
								<div class="row">
									<div class="col-xl-5">
										<a href="${pageContext.request.contextPath}/front?key=user&mn=userSelectBoard&postNo=${post.postNo}">
											<img src="${pageContext.request.contextPath}/img/thumbnailimg/${post.thumbnailFile}" width='450px' height='280px' >
										</a>	
								 	</div><!-- col-5 -->
									<div class="col-xl-7">
										<h3>${post.postTitle }</h3>
	          							<p>모임 간단설명 : ${post.postDescr}</p>
	          							<p>모임 카테고리 : ${post.categoryNoTocategoryName(post.categoryCode) }</p>
	          							<p>모임 장소 : ${post.locationNoTolocationName(post.locationCode)} ${post.locationDetail}</p>
	          							<p>현재신청인원 : ${post.currentPeople}</p>
	         							<p>모임일 : ${date}</p>
								 	</div><!-- col-7 -->
								</div><!-- row -->
							</c:if>		
      					</c:forEach>
        	 	<%-- 	</c:otherwise>
				</c:choose> --%>
			
			</div><!-- myJoinMoim_past -->
		</div><!-- container-fluid -->
	</section><!-- myJoinMoim_section -->

</body>
</html>