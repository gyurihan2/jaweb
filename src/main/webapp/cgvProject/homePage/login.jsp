<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="loginForm" method="post" action="<%=request.getContextPath()%>/TopMenuService">
	아이디 <input type="text" name="mid">
	비밀번호 <input type="text" name="pwd">
	<button type="submit"> 로그인 </button>
</form>
</body>
</html>