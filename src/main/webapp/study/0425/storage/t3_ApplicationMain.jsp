<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t3_ApplicationMain.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>Application 연습 메인 메뉴</h2>
	<form id="myform" method="post" action="t3_ApplicationSave.jsp">
		<div>
			아이디:
			<input type="text" name="mid" value="${aMid}" autofocus class="form-control"/> 
		</div>
		<div>
			닉네임:
			<input type="text" name="nickname" value="${aNickname}"  class="form-control"/> 
		</div>
		<div>
			성명:
			<input type="text" name="name" value="${aName}"  class="form-control"/> 
		</div>
		<hr/>
		<div class="row">
			<div class="col"><a href="t3_ApplicationSave.jsp" class="btn btn-success form-control">Application 저장(Get)</a></div>
			<div class="col"><button  type="submit" class="btn btn-success form-control">Application 저장(Post)</button></div>
			<!-- <div class="col"><a href="t3_SessionDelete.jsp" class="btn btn-success form-control">Application 삭제</a></div> -->
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>