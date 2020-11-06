<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<h1 align="center">나의 모임 한눈에 보기 </h1>
<canvas id = "hostchart" ></canvas>
<script type="text/javascript">
$(function(){
	console.log("${requestScope.hostchart}");
var ctx = document.getElementById('hostchart');
var hostchart = new Chart(ctx, {
	 showTooltips: false,
    type: 'pie',
    data: {
        labels: ['댄스', '스포츠', '독서', '음악', '외국어', '공예','봉사활동','여행','사진','요리','반려동물'],
        datasets: [{
           url : ${pageContext.request.contextPath}+"/front?key=client&mn=clientUpdateClientInform}",
            data: ${requestScope.hostchart},
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
    	title:{
    		display : true,
    		text : '내가 개설한 모임',
    		fontSize: '30'
    	},
    	legend:{
    		display : true,
    		position : 'right',
  
    	},
    	pieceLabel: { mode:"percentage", position:"outside", fontSize: 11, fontStyle: 'bold' }
    }
});
})
</script>


<canvas id = "clientchart" ></canvas>
<script>
console.log("${requestScope.hostchart}");
var ctx = document.getElementById('clientchart');
var clientchart = new Chart(ctx, {
	 showTooltips: false,
    type: 'pie',
    data: {
        labels: ['댄스', '스포츠', '독서', '음악', '외국어', '공예','봉사활동','여행','사진','요리','반려동물'],
        datasets: [{
        	url :"${pageContext.request.contextPath}/front?key=client&mn=clientSelectChart",
            data: [${clientchart}],
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
    	title:{
    		display : true,
    		text : '내가 신청한 모임',
    		fontSize: '30'
    	},
    	legend:{
    		display : true,
    		position : 'right',
  
    	},
    	pieceLabel: { mode:"percentage", position:"outside", fontSize: 11, fontStyle: 'bold' }
    }
});

</script>

</body>
</html>