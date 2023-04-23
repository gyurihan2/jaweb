<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    alert("<%=request.getParameter("mid")%>님이 로그인되었습니다.");
    
    location.href="/javaweb/cgvProject/homePage/home.jsp";
</script>