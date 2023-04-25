<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>ArrayList 등록된 자료 출력</h2>
	<p>vos: ${vos}</p>
	<hr/>
	<p>
		vo[0] : ${vos[0]}
	</p>
	<p>
		vo[1] : ${vos[1]}
	</p>
	<p>
		vo[2] : ${vos[2]}
	</p>
	<hr/>
	<p>
		${vos[0].name} ${vos[0].address} ${vos[0].age} ${vos[0].job}
	</p>
	<hr/>
	<p><a href="${pageContext.request.contextPath}/t0427/el03" class="btn btn-primary">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>