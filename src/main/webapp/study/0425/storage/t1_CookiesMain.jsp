<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t1_CookiesMain.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>쿠키 연습 메인 메뉴</h2>
	<hr/>
	<div class="row">
		<div class="col"><a href="t1_CookiesSave.jsp" class="btn btn-success form-control">쿠키저장</a></div>
		<div class="col"><a href="t1_CookiesCheck.jsp" class="btn btn-success form-control">쿠키확인</a></div>
		<div class="col"><a href="t1_CookiesDelete.jsp" class="btn btn-success form-control">쿠키삭제</a></div>
		<div class="col"><a href="t1_CookiesMidDelete.jsp" class="btn btn-success form-control">쿠키 아이디 삭제</a></div>
	</div>
</div>
<p><br/></p>
</body>
</html>