<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="UTF-8">
    <title>jQuery Pagination plugin</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
    <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>
</head>
<style>
	table {
		width: 1000px; height: 100px;
	}
	
	tr, th, td {
		border: 1px solid gray;
	}
</style>
<body>
<table id="table">
  	  <tr>
  	  	<th>No</th>
		<th>title</th>
		<th>description</th>
		<th>content</th>
		<th>asd</th>
		<th>asd</th>
		<th>설명</th>
		<th>설명</th>
		<th>설명</th>
  	  </tr>
  </table>
<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination"></ul>
    </nav>
</div>
<script type="text/javascript">
    $(function () {
    	$('#pagination').twbsPagination({
		    totalPages: 10,	// 총 페이지 번호 수
		    visiblePages: 7,	// 하단에서 한번에 보여지는 페이지 번호 수
		    startPage : 1, // 시작시 표시되는 현재 페이지
		    initiateStartPageClick: true,	// 플러그인이 시작시 페이지 버튼 클릭 여부 (default : true)
		    first : "첫 페이지",	// 페이지네이션 버튼중 처음으로 돌아가는 버튼에 쓰여 있는 텍스트
		    prev : "이전 페이지",	// 이전 페이지 버튼에 쓰여있는 텍스트
		    next : "다음 페이지",	// 다음 페이지 버튼에 쓰여있는 텍스트
		    last : "마지막 페이지",	// 페이지네이션 버튼중 마지막으로 가는 버튼에 쓰여있는 텍스트
		    nextClass : "page-item next",	// 이전 페이지 CSS class
		    prevClass : "page-item prev",	// 다음 페이지 CSS class
		    lastClass : "page-item last",	// 마지막 페이지 CSS calss
		    firstClass : "page-item first",	// 첫 페이지 CSS class
		    pageClass : "page-item",	// 페이지 버튼의 CSS class
		    activeClass : "active",	// 클릭된 페이지 버튼의 CSS class
		    disabledClass : "disabled",	// 클릭 안된 페이지 버튼의 CSS class
		    anchorClass : "page-link",	//버튼 안의 앵커에 대한 CSS class
		    
		    onPageClick: function (event, page) {
		    	redraw(page);	
		    }
		});
		
    	var flag = true;
    	
		function redraw(page) {
			$("#table tr:gt(0)").empty();
			if(flag){
				flag = false;
				$.ajax({
					type: "get",
					url : "moimList",
					data: {"page" : page, "pageSize" : 5},
					dataType:"json",
					contextType : "application/json",
					success: function(result){
						$("#pagination").twbsPagination("changeTotalPages", result[0], page);
						var text = "";
						for(var i in result[1]){
							text += "<tr><th>"+ result[1][i].postNo +"</th>";
							text += "<th><a href='#'>"+ result[1][i].userNo+"</a></th>";
							text += "<th>" + result[1][i].postTitle + "</th>";
							text += "<th>" + result[1][i].postDescr + "</th>";
							text += "<th>" + result[1][i].postContent + "</th>";
							text += "<th>" + result[1][i].thumbnailFile + "</th>";
							text += "<th><input type='button' id="+1+" value = '삭제'></th>";
							text += "</tr>";
						}
						
						$("#table tr:first").after(text);
					},
					complete: function(){	// 이부분 중요
						flag = true;	//호출 완료되면 flag 값을 사용가능하게 변경
					}
				}); 
			}
		} // redraw end
		
		redraw(1);
    });
</script>


</body>
</html>
