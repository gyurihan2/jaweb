<!-- t2_SessionDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate();  // 현재 브라우저를 통해 저잔된 세션 모두 삭제
%>

<script>
	alert("세션 모두 삭제완료 !!! 세션값: ${sMid}");
	location.href="t2_SessionMain.jsp";
</script>