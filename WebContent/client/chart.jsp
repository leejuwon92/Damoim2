<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="../js/chartjs-plugin-labels.js"></script>
<style type="text/css">
canvas{
margin : auto
}

body{
margin-left: 0px;
margin-bottom: 0px;
margin-right: 0px;
margin-top: 0px;
overflow-y:auto;
overflow-x:hidden;
}
</style>

</head>
<body>
<br>
<h1 align="center">나의 모임 한눈에 보기 </h1>
<br>

<canvas id = "hostchart" width="1000" height="500" style="border:1px solid #000000;"  ></canvas>
<canvas id = "clientchart" width="1000" height="500" style="border:1px solid #000000;" ></canvas>
<script type="text/javascript">
$(function(){
	var host;
	var client;
	 function hostchart(){
		 $.ajax({
				type :"post" , //전송방식(get,post,put,delete,)
				url : "../hostChart", //서버주소
				 async:false,
				dataType : "json", //응답데이터의 타입(text,json,html,xml) 기본값 -text
				success : function(result){//요청결과가 성공했을 때 호출될 callback함수
					host=result;
					console.log(result);
				
				},
				error : function(err){ //요청결과가 실패했을 때 호출될 함수
					console.log(err+"예외발생.");
				}
			});//ajax끝
	 }
	 
	 function clientchart(){
		 $.ajax({
				type :"post" , //전송방식(get,post,put,delete,)
				url : "../clientChart", //서버주소
				 async:false,
				dataType : "json", //응답데이터의 타입(text,json,html,xml) 기본값 -text
				success : function(result){//요청결과가 성공했을 때 호출될 callback함수
					console.log(result);
					client=result;
				},
				error : function(err){ //요청결과가 실패했을 때 호출될 함수
					console.log(err+"예외발생.");
				}
			});//ajax끝
	 }
	 hostchart();
	 clientchart();
/////////////////////////////////////////////////////////////////////////
 var ctx = document.getElementById('hostchart');
var hostchart = new Chart(ctx, {
	 showTooltips: false,
    type: 'pie',
    data: {
        labels: ['댄스', '스포츠', '독서', '음악', '외국어', '공예','봉사활동','여행','사진','요리','반려동물'],
        datasets: [{
            data: host,
            
            backgroundColor: [
                'rgba(255, 000, 000, 0.2)',//1
                'rgba(255, 153, 000, 0.2)',//2
                'rgba(255, 255, 000, 0.2)',//3
                'rgba(000, 153, 000, 0.2)',//4
                'rgba(153, 102, 255, 0.2)',//5
                'rgba(051, 000, 102, 0.2)',//6
                'rgba(102, 051, 000, 0.2)',//7
                'rgba(255, 159, 64, 0.2)',//8
                'rgba(153, 204, 000, 0.2)',//9
                'rgba(255, 102, 000, 0.2)',//10
                'rgba(000, 000, 000, 0.2)'//
                
            ],
            borderColor: [
                'rgba(255, 000, 000, 1)',
                'rgba(255, 153, 000, 1)',
                'rgba(255, 255, 000, 1)',
                'rgba(000, 153, 000, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(051, 000, 102, 0.2)',
                'rgba(102, 051, 000, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(153, 204, 000, 0.2)',//9
                'rgba(255, 102, 000, 0.2)',//10
                'rgba(000, 000, 000, 0.2)'//
                
            ],
            borderWidth: 1
        }]
    },
    options: {
    	
    	responsive:false,
    	title:{
    		display : true,
    		text : '내가 개설한 모임',
    		fontSize: '30'
    	
    	},
    	legend:{
    		labels : {fontSize : 15,
    			boxWidth : 100,
    		      boxHeight: 10,
    			padding : 20},
    		display : true,
    		position : 'right',
    	},
    	
    
    layout: {
        padding: {
            left: '0',
            right:'0',
            top: '10',
            bottom: '10'
        }
    }
    }
});



var ctx = document.getElementById('clientchart');
var clientchart = new Chart(ctx, {
	 showTooltips: false,
    type: 'pie',
    data: {
        labels: ['댄스', '스포츠', '독서', '음악', '외국어', '공예','봉사활동','여행','사진','요리','반려동물'],
        datasets: [{
        	url :"${pageContext.request.contextPath}/front?key=client&mn=clientSelectChart",
            data: client,
            backgroundColor: [
                'rgba(255, 000, 000, 0.2)',//1
                'rgba(255, 153, 000, 0.2)',//2
                'rgba(255, 255, 000, 0.2)',//3
                'rgba(000, 153, 000, 0.2)',//4
                'rgba(153, 102, 255, 0.2)',//5
                'rgba(051, 000, 102, 0.2)',//6
                'rgba(102, 051, 000, 0.2)',//7
                'rgba(255, 159, 64, 0.2)',//8
                'rgba(153, 204, 000, 0.2)',//9
                'rgba(255, 102, 000, 0.2)',//10
                'rgba(000, 000, 000, 0.2)'//
                
            ],
            borderColor: [
                'rgba(255, 000, 000, 1)',
                'rgba(255, 153, 000, 1)',
                'rgba(255, 255, 000, 1)',
                'rgba(000, 153, 000, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(051, 000, 102, 0.2)',
                'rgba(102, 051, 000, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(153, 204, 000, 0.2)',//9
                'rgba(255, 102, 000, 0.2)',//10
                'rgba(000, 000, 000, 0.2)'//
                
            ],
            borderWidth: 1
        }]
    },
    options: {
    	responsive:false,
    	title:{
    		display : true,
    		text : '내가 신청한 모임',
    		fontSize: '30'
    	},
    	legend:{
    		labels : {fontSize : 15,
    			boxWidth : 100,
    		      boxHeight: 10,
    			padding : 20},
    		display : true,
    		position : 'right',
    	},
    	pieceLabel: { mode:"value", position:"outside", fontSize:100, fontStyle: 'bold'},
    	   layout: {
    	        padding: {
    	            left: '0',
    	            right:'0',
    	            top: '10',
    	            bottom: '10'
    	        }
    	    }
    }
});

});
</script>

</body>
</html>