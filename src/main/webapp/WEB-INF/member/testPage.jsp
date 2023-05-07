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
<jsp:include page="/include/header.jsp" />
<p><br/></p>

세션 아이디: ${pageContext.session.id}<br/>
로그인 ID: ${sMid}<br/>
<input type="button" class="btn btn-success" value="로그아웃" onclick="location.href='${ctp}/MemberLogoutOk.mem'"/>

<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>