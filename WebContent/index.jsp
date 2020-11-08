<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.category1_section{
  font-family: 'Rubik', sans-serif;
}

</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- Banner -->
	<section class="banner">
		<div id="demo" class="carousel slide" data-ride="carousel">

  			<!-- Indicators -->
			<ul class="carousel-indicators">
   				<li data-target="#demo" data-slide-to="0" class="active"></li>
    			<li data-target="#demo" data-slide-to="1"></li>
    			<li data-target="#demo" data-slide-to="2"></li>
    			<li data-target="#demo" data-slide-to="3"></li>
  			</ul>

			<!-- The slideshow -->
  			<div class="carousel-inner">
  				<c:forEach items="${requestScope.bannerList}" var="bannerlist" varStatus="index" >
  					<c:choose>
  						<c:when test="${index.count == 1}">
  							<div class="carousel-item active">
  								<a href="front?key=user&mn=userSelectBoard&postNo=${bannerlist.postNo}">
      								<img src="${pageContext.request.contextPath}/img/bannerimg/${bannerlist.bannerFile}" alt="" width="1920" height="400">
      							</a>
    						</div>
  						</c:when >
  						<c:when test="${index.count != 1}">
  							<div class="carousel-item ">
  								<a href="front?key=user&mn=userSelectBoard&postNo=${bannerlist.postNo}">
      								<img src="${pageContext.request.contextPath}/img/bannerimg/${bannerlist.bannerFile}" alt="" width="1920" height="400">
      							</a>
    						</div>
  						</c:when>
  					</c:choose>
  				</c:forEach>
  			</div>
  
 		 	<!-- Left and right controls -->
  			<a class="carousel-control-prev" href="#demo" data-slide="prev">
    			<span class="carousel-control-prev-icon"></span>
  			</a>
  			<a class="carousel-control-next" href="#demo" data-slide="next">
    			<span class="carousel-control-next-icon"></span>
  			</a>
	
		</div>
	</section><!-- Banner -->
	
	<hr>
	<div class="container">
		<div style="text-align: left" >
			<h2>Best MoIm</h2>
			<hr width="300px" align="left">
		</div>
	</div>
		
	<!-- category1_section -->
	<section class="category1_section">
		<div class="container">
			<div class="row">
			
				<c:forEach items="${requestScope.bestList}" var="bestlist" varStatus="index" >
					<div class="col-xl-3">
						<a href="front?key=user&mn=userSelectBoard&postNo=${bestlist.postNo}">
      						<img src="${pageContext.request.contextPath}/img/thumbnailimg/${bestlist.thumbnailFile}" width="280px" height="150px">
      					</a>
      					<hr>
      					<h5 style="text-align: center;"><b>${bestlist.postTitle}</b></h5>
      					<div style="text-align: right">
      						<fmt:parseDate value="${bestlist.meetingDate}" var="meetingDate" pattern="yyyy-MM-dd HH:mm:ss" />
      						모임일 : <fmt:formatDate value="${meetingDate}" pattern="yyyy-MM-dd"/><br>
      						장소 : ${bestlist.locationDetail}
      					</div>
      				</div>
  				</c:forEach>
			
			</div><!-- row -->
		</div><!-- container -->
	</section><!-- category1_section -->
	
	<hr>
	
	<div class="container">
		<div style="text-align: left" >
			<h2>Today's MoIm</h2>
			<hr width="300px" align="left">
		</div>
	</div>
		
	<!-- category2_section -->
	<section class="category2_section">
		<div class="container">
			<div class="row">
			
					<c:forEach items="${requestScope.todayList}" var="todayList" varStatus="index" >
					<div class="col-xl-3">
						<a href="front?key=user&mn=userSelectBoard&postNo=${todayList.postNo}">
      						<img src="${pageContext.request.contextPath}/img/thumbnailimg/${todayList.thumbnailFile}" width="280px" height="150px">
      					</a>
      					<hr>
      					<h5 style="text-align: center;"><b>${todayList.postTitle}</b></h5>
      					<div style="text-align: right">
      						<fmt:parseDate value="${todayList.meetingDate}" var="todaymeetingDate" pattern="yyyy-MM-dd HH:mm:ss" />
      						모임일 : <fmt:formatDate value="${todaymeetingDate}" pattern="yyyy-MM-dd"/><br>
      						장소 : ${todayList.locationDetail}
      					</div>
      				</div>
  				</c:forEach>
  				
			</div><!-- row -->
		</div><!-- container -->
	</section><!-- category2_section -->
	
	
	<jsp:include page="footer.jsp"></jsp:include> 
</body>
</html>