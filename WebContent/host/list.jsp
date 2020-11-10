<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/jqgrid/ui.jqgrid.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/jqgrid/ui.jqgrid-bootstrap-ui.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/jqgrid/ui.jqgrid-bootstrap4.css" />
    <script src="../js/jquery-3.5.1.js"></script>
    <script src="../js/jquery-1.11.0.min.js"></script>
    <script src="../js/jquery.jqGrid.min.js"></script>
    <script src="../js/grid.locale-kr.js"></script>
<script type="text/javascript">
$(function(){
	var postNo = '${param.post_no}';
	console.log(postNo);
	var userList;
	 function userList(){
		 $.ajax({
				type :"get" , //전송방식(get,post,put,delete,)
				url : "../userList", //서버주소
				 async:false,
				 data:{"post_no" : postNo},
				dataType : "json", //응답데이터의 타입(text,json,html,xml) 기본값 -text
				success : function(result){//요청결과가 성공했을 때 호출될 callback함수
					userList=result;
					console.log(userList);
				},
				error : function(err){ //요청결과가 실패했을 때 호출될 함수
					console.log(err+"예외발생.");
				}
			});//ajax끝
	 }
	userList();
	
	
	$("#jqGrid").jqGrid({

        data : userList,
        datatype: "local",
        colNames: ['NO','ID','NAME','E-MAIL','PHONE'],
        colModel: [

            { name: 'userNo', index: 'userNo', width: 55, key: true, align: "center" },
            { name: 'userId', index: 'userId', width: 100, align: "center" },
            { name: 'userName', index: 'userName', width: 100 },
            { name: 'userEmail', index: 'userEmail', width: 100 },
            { name: 'phoneNo', index: 'phoneNo', width: 100 },
        ],
		align:"right",
		width: 1000,
        height: 400,
        rowNum: 30,//한페이지에서 볼수있는 데이터 수 
        rowList: [30,60],//한번에 볼수 있는거
       	emptyrecords:"신청자가 존재하지 않습니다.",
        rownumber: true,
        

        viewrecords: true,
        caption: "신청자 명단"
    });
});
	
	



</script>
</head>
<body>

 <div class="row" id ="grid" align="center">
        <div>
            <table id="jqGrid"></table>
           
        </div>
    </div>

   

</body>
</html>