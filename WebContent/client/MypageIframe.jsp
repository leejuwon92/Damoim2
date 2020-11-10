<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/client/mypageleft.css">
<script type="text/javascript">
	$(document).ready(function(){
		
		//메인페이지 출력
		$("#mypage_rigth").empty();
		$("#mypage_rigth").load("../client/MyPage_main.jsp");
		
		//회원정보 수정
		$(document).on("click","#updateClientInfo",function(){
			$("#mypage_rigth").empty();
			$("#mypage_rigth").load("${pageContext.request.contextPath}/client/clientUpdate.jsp");
			
		});//"#updateClientInfo"_click
		
		//개설한 모임
		$(document).on("click","#myHostMoim",function(){
			$("#mypage_rigth").empty();
			$("#mypage_rigth").load("${pageContext.request.contextPath}/front?key=client&mn=hostSelectMoimByMe");
			
		});//"#updateClientInfo"_click
		
		//신청한 모임
		$(document).on("click","#myClientMoim",function(){
			$("#mypage_rigth").empty();
			$("#mypage_rigth").load("${pageContext.request.contextPath}/front?key=client&mn=clientSelectMoimByMe");
			
		});//"#updateClientInfo"_click
		
		//내모임 한눈에 보기
		$(document).on("click","#myMoimChart",function(){
			$("#mypage_rigth").empty();
			$("#mypage_rigth").load("${pageContext.request.contextPath}/client/chart.jsp");
			
		});//"#updateClientInfo"_click
		
		
	});//ready
</script>
</head>
<body>
<jsp:include page="../header.jsp"/>

<section class="mypageFrame_section">
	<div class="container_fluid" style="height: auto;">
		<div class="row">
			<div class="col-xl-3">
			
				<ul>
              		<li>
                		<div class="k" style="margin-top: 20px">회원정보설정</div>
                		<ul>
                			<li><a href="#" id="updateClientInfo">회원정보수정</a></li>
                		</ul>
                	<li>
                  		<div class="k" style="margin-top: 20px">신청내역관리</div>
                  		<ul>
                    		<li><a href="#" id="myHostMoim">개설한 모임</a></li>
                    		<li><a href="#" id="myClientMoim">신청한 모임</a></li>
                  		</ul>
                	</li>
                	<li>
                  		<div class="k" style="margin-top: 20px">내모임 한눈에 보기</div>
                  		<ul>
	                   		<li><a href="#" id="myMoimChart">한눈에 보기</a></li>
                  		</ul>
                	</li>
              	</ul>
              	
			</div><!-- col-3 -->
			<div class="col-xl-9">
				<div id="mypage_rigth">
				
				</div>
			</div><!-- col-9 -->
		</div><!-- row -->	
	</div><!-- container_fluid -->
</section><!-- mypageFrame_section -->

<jsp:include page="../footer.jsp"/>
</body>
</html>