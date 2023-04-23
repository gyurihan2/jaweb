<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
	<style>
		div{
			margin: 10px;
		}
	</style>
	<script>
		'use strict'
		function fCheck(){
			let name= myform.name.value;
			let age= document.getElementById("age").value;

			if(name == ""){
				alert("성명을 입력하세요");
				myform.name.focus();
			}
			else if(age <20){
				alert("20세 이상만 가입 가능");
				myform.name.focus();
			
			}
			else{
				myform.submit();
			}


		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>값 전송 연습</h2>
	<form name="myform" method="post" action="test02ok.jsp">
		<div class="border">
			<div>
				성명 <input type="text" name="name" id="name" value="Hong Kil Dong" class="form-control"/>
			</div>
			<div>
				나이 <input type="number" name="age" id="age" value="25" class="form-control"/>
			</div>
			<div>
				성별: <input type="radio" name="gender" value="남자" checked/>남자&nbsp;
					<input type="radio" name="gender" value="여자" />여자
			</div>
			<div>
				<input type="checkbox" name="hobby" value="등산" checked/>등산
				<input type="checkbox" name="hobby" value="축구" />축구
				<input type="checkbox" name="hobby" value="낚시" />낚시
				<input type="checkbox" name="hobby" value="독서" />독서
				<input type="checkbox" name="hobby" value="영화" />영화
				<input type="checkbox" name="hobby" value="음악감상" />음악감상
			</div>
		</div>
		<div class="text-center">
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-success mr-3"/>
			<input type="reset" value="다시입력" class="btn btn-warning mr-3"/>
		</div>
	
	</form>
</div>
<p><br/></p>
</body>
</html>