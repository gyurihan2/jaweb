<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("cMid")){
				pageContext.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t5_login.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
<style>
	div{
		margin: 10px;
	}
</style>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>로 그 인</h2>
	<p>샘플 : admin(1234), hkd1234(1234)</p>
	<form id="myform" method="post" action="<%=request.getContextPath()%>/0424/t6_LoginOk">
		<div>
			아이디 
			<input type="text" name ="mid" class="form-control" value="${mid}"/>
		</div>
		<div>
			비밀번호 
			<input type="text" name ="pwd" class="form-control"/>
		</div>
		<div>
			<button type="submit"  class="btn btn-success"> 로그인</button>
			<button type="reset"  class="btn btn-warning"> 다시입력</button>
			<input type ="checkbox" name="idSave" checked/> 아이디 저장
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>