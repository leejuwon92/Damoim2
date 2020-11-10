<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	var userNo = '${session_userNo}';
	
	function createList(){
		 $.ajax({
				type :"get" , //전송방식(get,post,put,delete,)
				url : "../createMain", //서버주소
				 async:false,
				dataType : "json", //응답데이터의 타입(text,json,html,xml) 기본값 -text
				success : function(result){//요청결과가 성공했을 때 호출될 callback함수
					var str="";
					$.each(result,function(index,item){
						if(index<=2){
							
							str += "<div class='row' style='padding: 20px'>";
							str += "<div class='col-xl-5'>";
							str += "<a href='${pageContext.request.contextPath}/front?key=user&mn=userSelectBoard&postNo=" + item.postNo + "'>";
							str += "<img src='${pageContext.request.contextPath}/img/uploadImg/" + item.thumbnailFile + "' alt='' width='450px' height='150px'>";
							str += "</a>";
							str += "</div>";
							str += "<div class='col-xl-7'>";
							str += "<div style='text-align: left;'><h5><b>제목 : " + item.postTitle + "</b></h5></div>";
							str += "<br>"
							str += "<div style='text-align: left;'><h5><b>설명 : " + item.postDescr + "</b></h5></div>";
							str += "</div>";
							str += "<hr>";
							str += "</div>";
						}
						
					});
					
					$("#createMoim").append(str);
				},
				error : function(err){ //요청결과가 실패했을 때 호출될 함수
					console.log(err+"예외발생.");
				}
			});//ajax끝
	 }
	createList();
	
	 function joinList(){
		 $.ajax({
				type :"get" , //전송방식(get,post,put,delete,)
				url : "../joinMain", //서버주소
				async:false,
				dataType : "json", //응답데이터의 타입(text,json,html,xml) 기본값 -text
				success : function(result){//요청결과가 성공했을 때 호출될 callback함수
					var str="";
					$.each(result,function(index,item){
						if(index<=2){
							$("#joinMoim").empty();
							
							str += "<div class='row' style='padding: 20px'>";
							str += "<div class='col-xl-5'>";
							str += "<a href='${pageContext.request.contextPath}/front?key=user&mn=userSelectBoard&postNo=" + item.postNo + "'>";
							str += "<img src='${pageContext.request.contextPath}/img/uploadImg/" + item.thumbnailFile + "' alt='' width='450px' height='150px'>";
							str += "</a>";
							str += "</div>";
							str += "<div class='col-xl-7'>";
							str += "<div style='text-align: left;'><h5><b>제목 : " + item.postTitle + "</b></h5></div>";
							str += "<br>"
							str += "<div style='text-align: left;'><h5><b>설명 : " + item.postDescr + "</b></h5></div>";
							str += "</div>";
							str += "<hr>";
							str += "</div>";
						}
					});
					$("#joinMoim").append(str);
				},
				error : function(err){ //요청결과가 실패했을 때 호출될 함수
					console.log(err+"예외발생.");
				}
			});//ajax끝
	 }
	joinList();
	
})

</script>
</head>
<body>
	<section class="mypageMain_section">
		<div class="container-fluid">	
		
			<div style="text-align: left; margin-top: 35px" >
				<h3><b>개설한 모임</b></h3>
				<hr width="300px" align="left">
			</div>
			<div id="createMoim"></div>
			
			<div style="text-align: left; margin-top: 35px" >
				<h3><b>신청한 모임</b></h3>
				<hr width="300px" align="left">
			</div>
			<div id="joinMoim"></div>
		</div><!-- container -->
	</section><!-- mypageMain_section -->
      
</body>
</html>