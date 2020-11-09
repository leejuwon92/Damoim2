<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/client/mypageleft.css">

<style>
  table{width: 100%; height:100% ; border:0;
      border-collapse:collapse; 
      }
  th,td{border: 0px gray solid;}
 
 table td:first-child {
	margin-top:20px;
	margin-left:20px;
 	position:absolute;
	height: 100%;
}
table td.gt(0){
display:inline;
position:relative;
width:100vh;
margin-left: 300px;
}

</style>
<script type="text/javascript">
function calcHeight() 
{ 
  //find the height of the internal page 
  var the_height= 
    document.getElementById('the_iframe').contentWindow. 
      document.body.scrollHeight; 
  
  //change the height of the iframe 
  document.getElementById('the_iframe').height= 
      the_height; 
}  
</script>
</head>
<body>

<jsp:include page="../header.jsp"/>

 <table>
 <tr>
<TD><jsp:include page="../client/left.jsp"/><TD>
  <td id="second"><iframe id="the_iframe" width="100%" onLoad="calcHeight();" src="../client/MyPage_main.jsp" name="center" frameborder="0" scrolling="no" height="1"></iframe></td>
 </tr>
</table>
<jsp:include page="../footer.jsp"/>


</body>
</html>