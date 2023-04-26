<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>회원전용방</h2>
	<p>${sName}님 로그인중입니다.</p>
	<hr/>
	<p>보유 포인트 : ${sPoint} / 최종 접속일 ${fn:substring(sLastDate,0,16)} / 오늘 접속 횟수 ${sTodayCount}</p>
	<p><img src="${ctp}/images/2.jpg" width="300px"></p>
	<hr/>
	<div>
		<a href="${ctp}/database/logout" class="btn btn-danger">로그아웃</a>
	</div>
</div>
<p><br/></p>
</body>
</html>