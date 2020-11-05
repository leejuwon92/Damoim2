<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.5.4/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<style>
	table {
		width: 800px;
		height: 400px;
	}
	
	tr, th {
		border: 1px solid grey;
	}

	.parent{
	    width: 90%;
	    margin: 10px auto;
	}
	
	.first {
	    border: 1px solid red;
	    float: left;
	    width:30%;
	    box-sizing: border-box;
	}
	
	.second{
	    border: 1px solid green;
	    float: left;
	    margin-left: 5%;
	    width:30%;
	    box-sizing: border-box;
	}
	
	.third{
	    border: 0px solid blue;
	    float: right;
	    width:30%;
	    box-sizing: border-box;
	}
	
	.selector{align-items:rigth;}
</style>
</head>
<body>
<br>
	<form>
		<div class="parent">
			<div class="first" style="text-align: left;">검색 필터</div>
			<div class="third" style='text-align:right;'>
				<select name = "category" id = "category" >
				<option value="0">-- 카테고리 선택 --</option>
				<option value="1">취미1</option>
				<option value="2">취미2</option>
				<option value="3">취미3</option>
			</select>
			<select name = "location" id = "location">
				<option value="0">-- 지역 선택 --</option>
				<option value="1">지역1</option>
				<option value="2">지역2</option>
				<option value="3">지역3</option>
			</select>
			<select name = "date" id = "date">
				<option value="0"> 1개월 </option>
				<option value="1"> 3개월 </option>
				<option value="2"> 6개월 </option>
			</select>
			</div>
		</div>
	</form>
<br>
<br>
<br>
<hr>

<br>

<h4 style="padding-left: 30px;">선택한 select box의 value가 들어갈 장소입니다</h4>
<br>
<hr>
<br><br><br>
<table style="margin: auto;">
	<tr>
		<td colspan="2">1</td>
		<td>3</td>
		<td>4</td>
	</tr>
	<tr>
		<td colspan="2">5</td>
		<td>7</td>
		<td>8</td>
	</tr>
</table>
<br><br><br><br><hr><br>

<div class="container">
	<div class="row">
		<div class="col">
			<ul class="pagination" style="justify-content: center;">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>