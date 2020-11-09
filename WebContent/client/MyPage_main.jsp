<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

html,body{
margin:0;
padding:0;
height: 100vh;
overflow: hidden;
}
div{
 padding: 10px; height: auto;overflow: auto;

}
</style>
<link rel="stylesheet" href="../css/client/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	var userNo = '${session_userNo}';
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
							str+="<div class='row'><div class='col-md-7'>";
		   					str+="<a href='${pageContext.request.contextPath}/front/key=user&mn=userSelectBoard?postNo="+item.postNo+"'><img class='img-fluid rounded mb-3 mb-md-0' src='${pageContext.request.contextPath}/img/";
		   					str+=item.thumbnailFile+ "' alt=''></a></div>";
		   					str+="<div class='col-md-5'><h4>";
								str+=item.postTitle+"</h4><h5>";
								str+=item.postDescr+"</h5></div></div>";
						}
						
					});
					$("#createMoim").after(str);
				},
				error : function(err){ //요청결과가 실패했을 때 호출될 함수
					console.log(err+"예외발생.");
				}
			});//ajax끝
	 }
	joinList();
	
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
						str+="<div class='row'><div class='col-md-7'>";
   					str+="<a href='${pageContext.request.contextPath}/front/key=user&mn=userSelectBoard?postNo="+item.postNo+"'><img class='img-fluid rounded mb-3 mb-md-0' src='${pageContext.request.contextPath}/img/";
   					str+=item.thumbnailFile+ "' alt=''></a></div>";
   					str+="<div class='col-md-5'><h4>";
						str+=item.postTitle+"</h4><h5>";
						str+=item.postDescr+"</h5></div></div>";
						}
						
					});
					$("#joinMoim").after(str);
				},
				error : function(err){ //요청결과가 실패했을 때 호출될 함수
					console.log(err+"예외발생.");
				}
			});//ajax끝
	 }
	createList();
	
	
	
})

</script>
</head>
<body>
 <div class="container">
      <!-- Page Heading -->
      <h1 class="my-4" id="createMoim">개설한 모임</h1>
      <hr>
      
      <hr>
   
       <!-- Page Heading -->
      <h1 class="my-4" id="joinMoim">신청한 모임</h1>
        <hr>
        	
      
 </div>


</body>
</html>