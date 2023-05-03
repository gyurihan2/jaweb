<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>password.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict';
		
		function pwdCheck(idx) {
			let pwd = myform.pwd.value.trim();
			myform.idx.value= idx;
			
			if(pwd == ""){
				alert("비밀번호를 입력하세요");
				myform.pwd.focus();
			}
			else{
				if(idx == 1){
					myform.action="${ctp}/PassOk1.st"
				}
				else if(idx==2){
					myform.action="${ctp}/PassOk1.st"
				}
				else if(idx==4){
					myform.action="${ctp}/PassInputOk.st"
				}
				else if(idx==5){
					myform.action="${ctp}/PassLoginOk.st"
				}
				else{
					myform.action="${ctp}/PassOk2.st"
				}
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2>비밀번호 암호화 연습</h2>
	<p>(10자리 이내)</p>
	<form name="myform" method="post">
		<table	class="table table-bodered">
			<tr><td><p>아이디: <input type="text" name="mid" id="mid" value="hkd1234" class="form-control"/></p></td></tr>
			<tr><td><p>비밀번호: <input type="password" name="pwd" id="pwd" maxlength="9" class="form-control" autofocus/></p></td></tr>
			<tr><td><p>
				<input type="button" value="확인(숫자비번)" onclick="pwdCheck(1)" class="btn btn-success"/>
				<input type="button" value="확인" onclick="pwdCheck(2)" class="btn btn-warning"/>
				<input type="button" value="확인(SHA-256)" onclick="pwdCheck(3)" class="btn btn-warning"/>
				<input type="button" value="확인(연습)" onclick="pwdCheck(4)" class="btn btn-warning"/>
				<input type="button" value="확인(연습 체크)" onclick="pwdCheck(5)" class="btn btn-warning"/>
			</p></td></tr>
			
		</table>
		<input type="hidden" name="idx"/>
	</form>
	<h3>SHA(Secure Hash Algorithm)</h3>
	<pre>
		SHA: 단방향 암호화 기반, 암호학적 해시함수들의 모임이다.
		일반적으로 복호화 할 수 없도록 만든 알고리즘을 SHA-2라고한다.
		해시함수가 출력하는 암축된 문장을 다이제스트(Digest)라고 하는데,
		이때 SHA-2가 생성해주는 다이제스트의 출력 길이는 256, 512Bit가 있다.
		이떄 256bit의 출력길이를 갖는 SHA-2암호화를 SHA-256암호 방식이라 한다.
	</pre>
	
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>