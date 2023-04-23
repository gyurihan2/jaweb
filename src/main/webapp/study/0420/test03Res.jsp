<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
//	String name = request.getParameter("name"); 
	String name = request.getParameter("name");
	
%>
<script>
	alert('<%=name%>'+'완료');
	location.href='<%=request.getContextPath()%>/study/0420/test03.jsp';
	
</script>
