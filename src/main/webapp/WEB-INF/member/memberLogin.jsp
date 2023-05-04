<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberLogin.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<div class="modal-dialog">
		<div class="modal-content">
		<h2 class="text-center modar-content">회원 로그인</h2>
		<P>회원 아이디와 비밀번호를 입력해주세요</P>
		<form name="myform" method="post" action="${ctp}/MemberInputOk.mem"  class="was-validated">
		    <div class="form-group">
	  			<label for="mid">회원 아이디</label>
			    <input type="text" class="form-control" name="mid" id="mid" value="${cMid}" placeholder="Enter your ID" required autofocus/>
			    <div class="valid-feedback">OK~!.</div>
			    <div class="invalid-feedback">아이디를 입력하세요.</div>
			</div>
		    <div class="form-group">
	  			<label for="pwd">패스워드</label>
			    <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter your Password" required/>
			    <div class="valid-feedback">OK~!.</div>
			    <div class="invalid-feedback">비밀번호를 입력하세요.</div>
			</div>
	    	<div class="form-group text-center">
	    		<button type="submit" class="btn btn-primary mr-1">로그인</button>
	    		<button type="reset" class="btn btn-warning mr-1">다시입력</button>
	    		<button type="button" onclick="location.href='${ctp}/'" class="btn btn-danger mr-1" >돌아가기</button>
	    		<button type="button" onclick="location.href='${ctp}/MemberJoin.mem'" class="btn btn-success mr-1" >회원가입</button>
	    	</div>
	    	<div class="row">
	    		<span class="col">
		    		<input type="checkbox" name="idSave" id="idSave" checked/>아이디 저장
	    		</span>
	    		<span class="col text-center" style="font-size:12px;">
		    		[<a href="#">아이디 찾기</a>]
		    		[<a href="#">비밀번호 찾기</a>]
	    		</span>
	    	</div>
		</form>
		</div>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>