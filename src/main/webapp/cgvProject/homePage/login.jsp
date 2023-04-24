<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/cgvProject/publicPage/topMenu.jsp"/>
<%
	if(session.getAttribute("sMid") != null){
		out.print("<script>");
		out.print("alert('잘못된 접근입니다.');");
		out.print("location.href='home.jsp';");
		out.print("</script>");
	}
	
	String cRemberMid="0";
	String cMid="";
	
	/* 아이디 기억 / 아이디 쿠키값 저장*/
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("cRemeberMid")){
			cRemberMid = cookies[i].getValue();
		}
		else if(cookies[i].getName().equals("cMid")){
			cMid = cookies[i].getValue();
		}
	}
	
	/* 아이디 기억 쿠키값이 1일경우 체크 실행 */
	if(cRemberMid.equals("1")){
		out.print("<script>");
		out.print("$(function(){");
		out.print("$('#rememberMid').prop('checked', true);");
		out.print("$('#rememberMid').val('1');");
		out.print("});");
		out.print("</script>");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 400px;
  padding: 15px;
  margin: 5px 0 22px 20px;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
.cancelbtn, .signupbtn {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
  float: left;
  width: 150px;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */


/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}
</style>
<script>
	/* 아이디 기억 Check박스 체크 여부 */
	$(function(){
		 $('#rememberMid').click(function() {
			 if ($('#rememberMid').is(":checked")) {
				 	$('#rememberMid').val("1");
		     }
			 else{
				 $('#rememberMid').val("0"); 
			 }
		 })
	});
</script>

</head>
<body>

	<form id="loginForm" class="mt-10" action="<%=request.getContextPath()%>/login">
		<div class="container text-center" style="width: 1000px">
			<div class="row justify-content-start">
				<div class="d-flex align-items-center justify-content-end"  style="width: 60px">
					<div><b>ID</b></div>
				</div>
				<div class="d-flex align-self-center">
				  	<input type="text" placeholder="아이디를 입력하세요" id="id" name="mid" required autofocus value="<%=cMid%>">
				</div>
		  	</div>
			<div class="row">
			  	<label for="pwd"><b>Password</b></label>
			  	<input type="password" placeholder="비밀번호를 입력하세요" id="pwd" name="pwd" required>
		  	</div>
		  	<div class="row">
			  	<label>
				<input type="checkbox" name="rememberMid"  id="rememberMid" style="margin-bottom:15px" value="0"> Remember me
			  	</label>
		  	</div >
		  	<p>회원가입 <a href="#" style="color:dodgerblue">Click</a>.</p>
		  	<div class="clearfix row">
				<button type="button" class="cancelbtn">Cancel</button>
				<button type="submit" class="signupbtn">Sign Up</button>
		  	</div>
		</div>
	  </form>
</body>
</html>