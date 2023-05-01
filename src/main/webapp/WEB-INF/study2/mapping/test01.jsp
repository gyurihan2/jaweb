<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test01.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2>이곳은 /WEB-INF/study2/mapping/test01.jsp</h2>
	<div>
		<div>두수의 합: ${hap}</div>
		<div>두수의 차: ${cha}</div>
	</div>
	
	<p>
		<a href="${ctp}/mapping/Test02" class="btn btn-success">test02.jsp 가기</a>
	</p>
	<p>
		<a href="${ctp}/mapping/Test03" class="btn btn-danger">test03.jsp 가기</a>
	</p>
	<p>
		<a href="${ctp}/mapping/Test04?su1=100&su2=50" class="btn btn-danger">test04.jsp 가기</a>
	</p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>