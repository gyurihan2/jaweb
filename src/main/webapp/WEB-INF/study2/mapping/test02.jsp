<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2>이곳은 test02.jsp 입니다.</h2>
	
	<p>
		<a href="${ctp}/mapping/Test01" class="btn btn-primary">test01.jsp 가기</a>
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