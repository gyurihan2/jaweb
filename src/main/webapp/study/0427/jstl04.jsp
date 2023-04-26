<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	int won = 7654321;
	pageContext.setAttribute("won", won);
%>
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
	<h2>Format 라이브러리</h2>
	<pre>
		사용용도: 형식문자열을 지정할때 사용(쉼표,화폐단위,백분율...)
		사용법: < fmt : 명령어 value="$ {값 / 변수 } " pattern="표현패턴" type="화폐단위" >  
	</pre>
	
	<div>
		1-1. 천단위 쉼표 표시<br>
		<fmt:formatNumber>100000000000000000</fmt:formatNumber> <br/>
		<fmt:formatNumber value="123456789"/><br/>
		<fmt:formatNumber value="${won}"/><br/>
		<fmt:formatNumber value="7654.321" pattern="0,000,000.0000000000000"/><br/>	
		<fmt:formatNumber value="7654.321" pattern="#,###,##0.0##"/><br/>
		1-2 화폐단위	
		원화 : <fmt:formatNumber value="${won}" type="currency"/><br/>
		달러 : <fmt:formatNumber value="${won}" type="currency" currencyCode="USD"/><br/>
		
		1-3 백분율<br>
		<c:set var="su1" value="0.9456"/>
		<fmt:formatNumber value="${su1}" type="percent"/><br/>
		
		2. 날짜<br/>
			<c:set var="today" value="<%=new Date() %>" />
			오늘날짜 : ${today}<br/>
			<fmt:formatDate value="${today}"/><br/>
			<fmt:formatDate value="${today}" pattern="YYYY/MM/dd-HH:mm:ss"/><br/>
			<fmt:formatDate value="${today}" pattern="YYYY년MM월dd일 HH:mm:ss"/><br/>
		
		3.국가별 설정(Locale)<br/>
		톰캣서버의 기본 로케일 : <%=response.getLocale()%><br>
		톰갯서버의 기본 로케일변경(미국) : <fmt:setLocale value="en_US"/><br/>
		<fmt:formatNumber value="${won}" type="currency"/><br/>
		
		4.url 이동 : location.href = ''<br/>
		<%-- jstl3.jsp로 이동하기 : <c:redirect url="jstl03.jsp"/> --%>
		
		5.절대 경로: <br/>
		<img src="<%=request.getContextPath()%>/images/1.jpg" width="150px"/><br/>
		<img src="${ctp}/images/1.jpg" width="150px"/><br/>
		
		6.import: <br/>
		<c:import url="/include/bs4.jsp"/>
		
	</div>
	
</div>
<p><br/></p>
</body>
</html>