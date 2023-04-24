<!-- t2_SessionMidDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("sMid");
	session.removeAttribute("sName");
	
%>
<script>
	alert("세션저장된 ID/Name 삭제완료 !!! 세션값: ${sMid}");
	location.href="t2_SessionMain.jsp";
</script>