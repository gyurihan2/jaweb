<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	String memberMid = session.getAttribute("sMid") == null ? "" : (String)session.getAttribute("sMid");
	
System.out.println("mdi:"+memberMid);
	
	if(memberMid.equals("")){
%>
	<script>
		//location.href="${pageContext.request.contextPath}/";
		location.href="${pageContext.request.contextPath}/study/0428_database/login.jsp";
	</script>

<%}%>