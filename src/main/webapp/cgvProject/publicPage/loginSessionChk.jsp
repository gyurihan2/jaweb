<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<c:if test="${empty sMid}">
	<script>
		location.href="${pageContext.request.contextPath}/cgvProject/homePage/home.jsp";	
	</script>
</c:if>
</body>
</html>