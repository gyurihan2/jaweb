<!-- t2_SessionSave.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid") == null ? "admin" : request.getParameter("mid");
	String nickname = request.getParameter("nickname") == null ? "관리맨" :request.getParameter("nickname");
	String name = request.getParameter("name") == null ? "관리자" : request.getParameter("name");
	
	/* pageContext.setAttribute(name, value); */
	
	session.setAttribute("sMid", mid);
	session.setAttribute("sNickname", nickname);
	session.setAttribute("sName", name);
%>

<script>
	alert("세션 저장 완료 !!! 세션값: ${sMid}");
	location.href="t2_SessionMain.jsp";
</script>