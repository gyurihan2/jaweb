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
<div>${su[0]}</div>
<div>${su[1]}</div>
<div>${su[2]}</div>
<div>${su[3]}</div>
<div>${su[4]}</div>
	
<p><br/></p>
</body>
</html>