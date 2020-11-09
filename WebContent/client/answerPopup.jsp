<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#answerBtn").click(function(){
		
		if( $("#ansTextArea").val() == "" ){
			alert("내용을 입력해주세요.");
			$("#ansTextArea").focus();
			return false;
		}
		
		$("#answerForm").submit();

		window.opener.location.reload().delay(1000);
		window.close();
	});//questionBtn_click
	
});//ready

</script>

</head>
<body>
	<section class="answer_section">
		<div class="container_fluid">
			<h4>답변하기  </h4>
			<hr width="300px" align="left">
			
			<form id="answerForm" method="post" action="${pageContext.request.contextPath}/front?key=client&mn=clientInsertReply&answer_no=${param.questionNo}">
			<table class="table table-borderless" style="margin-top: 10px">
				<tr>
					<td width="85%">
						<textarea style="width: 100%; height: 50px" id="ansTextArea" name="reply_content"></textarea>		
					</td>	
					<td width="15%">
						<input type="text" name="post_no" value="${param.post_no}" hidden="hidden">
						<input type="text" name="session_userNo" value="${param.session_userNo}" hidden="hidden">
						<input type="text" name="answer_no" value="${param.questionNo}" hidden="hidden">
						<input type="button" class="btn btn-primary" value="답변하기" id="answerBtn" 
						style="padding: 14px 30px 14px 30px">		
					</td>
				</tr>
			</table>
		</form>
	
		</div><!-- container_fluid -->
	</section><!-- answer_section -->
	

</body>
</html>