<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="../css/client/bootstrap.min.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
 <div class="container">
<script></script>
      <!-- Page Heading -->
      <h1 class="my-4">개설한 모임</h1>
      <hr>
       <c:choose>
        		<c:when test="${empty requestScope.hostList} ">
        			 개설하신 모임이 없습니다
        		</c:when>
        		<c:otherwise>
        			<c:set var="endLoop" value="false"/>
        			<c:forEach items="${requestScope.hostList}" var="hostpost" varStatus="i">
        				<c:if test="${not endLoop }">
        				<div class="col-lg-4 col-md-6 mb-4">
        					<div class="card h-100">
								<a href="#"><img class="card-img-top" src="<%=request.getRealPath("/") %>img/${hostpost.thumbnailFile}" alt=""></a>
									<div class="card-body">
										<h4 class="card-title"><a href="#">${hostpost.postTitle }</a></h4>
										<h5>${hostpost.postDescr }</h5>     
									</div>
							</div>
						</div>
        				<c:if test="${i.count==3 }">
        					<c:set var="endLoop" value = "true"/>
						
						</c:if>
						</c:if>
					</c:forEach>
        		</c:otherwise>
        	</c:choose>
          
      <hr>
   
       <!-- Page Heading -->
      <h1 class="my-4">신청한 모임</h1>
        <hr>
        <div class="row">
        	<c:choose>
        		<c:when test="${empty requestScope.postList} ">
        			 참가하신 모임이 없습니다
        		</c:when>
        		<c:otherwise>
        			<c:set var="endLoop" value="false"/>
        			<c:forEach items="${requestScope.postList}" var="post" varStatus="i">
        			<c:if test="${not endLoop }">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/img/${post.thumbnailFile}" alt=""></a>
									<div class="card-body">
										<h4 class="card-title"><a href="#">${post.postTitle }</a></h4>
										<h5>${post.postDescr }</h5>     
									</div>
							</div>
						</div>
						<c:if test="${i.count==3 }">
        					<c:set var="endLoop" value = "true"/>
						
						</c:if>
						</c:if>
					</c:forEach>
        		</c:otherwise>
        	</c:choose>
      
       <!-- Page Heading -->
       <br>
       <br>
      <h1 class="my-4">모임 통계</h1>
      <hr>
 	  <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">개설한 모임명</a>
                </h4>
                <h5>모임내용입니다</h5>
                
              </div>
   
            </div>
          </div>
      
 </div>
 </div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>