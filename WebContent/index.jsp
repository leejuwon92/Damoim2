<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index/indexstyle.css">
<link rel="stylesheet" href="css/index/bootstrap.min.css">
<script type="text/javascript">
	console.log(sessionStorage.getItem("session_userNo"));
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	<!-- Banner Location : Start -->
	<div class="banner-loc">
		<div class=".banner-backImg">
			<a href="#"><img alt="" src="img/bannerimg/sample_banner.jpg"></a>
		</div>
	</div>
	<!-- banner-loc -->
	<hr>
	<div class="category-section>">
		<div class="category-header">
			<h2>카테고리 1</h2>
		</div><!-- category-header -->
		<div class="category-content">
			<div class="row">
				<div class="single-package-item">
					<img src="img/packages/g1.jpg" alt="package-place">
					<h3>제목 <span class="pull-right"> 제목~~~~ </span></h3>
					<div class="packages-para">
						<h3>소개 <span class="pull-right"> 소개~~~~ </span></h3>
						<h3>장소 <span class="pull-right"> 장소~~~~ </span></h3>
						<h3>인원 <span class="pull-right"> 인원~~~~ </span></h3>
						<h3>마감일 <span class="pull-right"> 마감일~~~~ </span></h3>
					</div><!-- packages-para -->
				</div><!-- single-package-item -->
				
				<div class="single-package-item">
					<img src="img/packages/g1.jpg" alt="package-place">
					<h3>제목 <span class="pull-right"> 제목~~~~ </span></h3>
					<div class="packages-para">
						<h3>소개 <span class="pull-right"> 소개~~~~ </span></h3>
						<h3>장소 <span class="pull-right"> 장소~~~~ </span></h3>
						<h3>인원 <span class="pull-right"> 인원~~~~ </span></h3>
						<h3>마감일 <span class="pull-right"> 마감일~~~~ </span></h3>
					</div><!-- packages-para -->
				</div><!-- single-package-item -->
				
				
				<div class="single-package-item">
					<img src="img/packages/g1.jpg" alt="package-place">
					<h3>제목 <span class="pull-right"> 제목~~~~ </span></h3>
					<div class="packages-para">
						<h3>소개 <span class="pull-right"> 소개~~~~ </span></h3>
						<h3>장소 <span class="pull-right"> 장소~~~~ </span></h3>
						<h3>인원 <span class="pull-right"> 인원~~~~ </span></h3>
						<h3>마감일 <span class="pull-right"> 마감일~~~~ </span></h3>
					</div><!-- packages-para -->
				</div><!-- single-package-item -->
				
				
			</div><!-- row -->
		</div><!-- category-content -->
	</div><!-- category-section -->
	
	<hr>
		<div class="category-section>">
		<div class="category-header">
			<h2>카테고리 2</h2>
		</div><!-- category-header -->
		<div class="category-content">
			<div class="row">
				<div class="single-package-item">
					<img src="img/packages/g1.jpg" alt="package-place">
					<h3>제목 <span class="pull-right"> 제목~~~~ </span></h3>
					<div class="packages-para">
						<h3>소개 <span class="pull-right"> 소개~~~~ </span></h3>
						<h3>장소 <span class="pull-right"> 장소~~~~ </span></h3>
						<h3>인원 <span class="pull-right"> 인원~~~~ </span></h3>
						<h3>마감일 <span class="pull-right"> 마감일~~~~ </span></h3>
					</div><!-- packages-para -->
				</div><!-- single-package-item -->
				
				<div class="single-package-item">
					<img src="img/packages/g1.jpg" alt="package-place">
					<h3>제목 <span class="pull-right"> 제목~~~~ </span></h3>
					<div class="packages-para">
						<h3>소개 <span class="pull-right"> 소개~~~~ </span></h3>
						<h3>장소 <span class="pull-right"> 장소~~~~ </span></h3>
						<h3>인원 <span class="pull-right"> 인원~~~~ </span></h3>
						<h3>마감일 <span class="pull-right"> 마감일~~~~ </span></h3>
					</div><!-- packages-para -->
				</div><!-- single-package-item -->
				
				
				<div class="single-package-item">
					<img src="img/packages/g1.jpg" alt="package-place">
					<h3>제목 <span class="pull-right"> 제목~~~~ </span></h3>
					<div class="packages-para">
						<h3>소개 <span class="pull-right"> 소개~~~~ </span></h3>
						<h3>장소 <span class="pull-right"> 장소~~~~ </span></h3>
						<h3>인원 <span class="pull-right"> 인원~~~~ </span></h3>
						<h3>마감일 <span class="pull-right"> 마감일~~~~ </span></h3>
					</div><!-- packages-para -->
				</div><!-- single-package-item -->
				
				
			</div><!-- row -->
		</div><!-- category-content -->
	</div><!-- category-section -->
	
	<hr>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>