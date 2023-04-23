<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("name", request.getParameter("name"));
	
%>

<script>
	alert('${name}로그아웃');
	location.href='${pageContext.request.contextPath}/study/0420/test04.jsp';
</script>