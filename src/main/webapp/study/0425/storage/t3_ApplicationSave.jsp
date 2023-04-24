<!-- t3_ApplicationSave.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	System.out.println(request.getParameter("mid"));
	String mid = request.getParameter("mid") == null ? "admin" : request.getParameter("mid");
	String nickname = request.getParameter("nickname") == null ? "관리맨" :request.getParameter("nickname");
	String name = request.getParameter("name") == null ? "관리자" : request.getParameter("name");
	
	/* pageContext.setAttribute(name, value); */
	
	application.setAttribute("aMid", mid);
	application.setAttribute("aNickname", nickname);
	application.setAttribute("aName", name);
%>

<script>
	alert("t3_Application 저장 완료 !!! 세션값: ${aMid}");
	location.href="t3_ApplicationMain.jsp";
</script>