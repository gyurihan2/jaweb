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
    <script>
    	function fCheck(){
    		let su = myform.su;
    		
    		su.each((index,val)=>{
    			if(isNaN(val)){
					alert("정수만 입력하세요");
    				return false;
    			}
    		});
    	}
    </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form id="myform" action="../../0420/test05">
		<div>
			수1: <input type="number" name="su">
		</div>
		<div>
			수2: <input type="number" name="su">
		</div>
		<div>
			수3: <input type="number" name="su">
		</div>
		<div>
			수4: <input type="number" name="su">
		</div>
		<div>
			수5: <input type="number" name="su">
		</div>
		<div>
			<input type="button" value="전송"/>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>