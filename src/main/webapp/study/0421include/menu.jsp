<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String member2 = request.getParameter("member") == null ? "" : request.getParameter("member");
%>
<%-- <%@ include file="<%=request.getcontextPath()%>/include/bs4.jsp" %> 지시자 안에 지시자 사용 불가--%>
<jsp:include page="/include/bs4.jsp"/><!-- jsp 액션 태그 -->
<div style="height:130px; text-align:center">
<br/><br/>
	<a href="main.jsp" class="btn btn-outline-primary">홈</a> |
	<a href="main.jsp?sw=guest?member=<%=member2%>>" class="btn btn-outline-primary">방명록</a> |
	<a href="main.jsp?sw=board" class="btn btn-outline-primary">게시판</a> |
	<%if(member2.equals("ok")){ %>
	<a href="main.jsp?sw=pds" class="btn btn-outline-primary">자료실</a> |
	<a href="main.jsp?sw=schedule" class="btn btn-outline-primary">스케줄관리</a> |
	<a href="main.jsp?sw=photo&member=<%=member2%>" class="btn btn-outline-primary">포토갤러리</a> |
	<a href="main.jsp?sw=logout" class="btn btn-outline-primary">로그아웃</a> 
	<%}else{%>
	<a href="main.jsp?sw=login" class="btn btn-outline-primary">로그인</a> 
	<%}%>
</div>

