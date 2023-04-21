<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw") == null? "": request.getParameter("sw");
	String member = request.getParameter("member") == null ? "" : request.getParameter("member");
	String user = member.equals("ok") ? "정회원" : "비회원";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main.jsp</title>
	<%-- <jsp:include page="<%=request.getContextPath()%>/include/bs4.jsp" /> --%>
	<jsp:include page="/include/bs4.jsp" /> <!-- jsp액션태그 안에서의 '/'는 ContextPath명을 간주 -->
	
</head>
<body>
<p><br/></p>
<div class="container">
<!-- 헤더영역(로고/메뉴) -->
	<div class="text-center" id="header" style="background-color:skyblue">
		<%@include file="menu.jsp" %>	
	</div>
	
<!-- 본문영역 -->
	<div id="content" class="text-center" style="height:800px">
	<% if(sw.equals("guest")){%>
			<%@ include file="guest.jsp" %>
			
	<%	} else if(sw.equals("board")){%>
		<%@ include file="board.jsp" %>
		
	<%	} else if(sw.equals("pds")){%>
		<%@ include file="pds.jsp" %>
		
	<%	} else if(sw.equals("schedule")){%>
		<%@ include file="schedule.jsp" %>
	<%	} else if(sw.equals("login")){%>
		<%@ include file="login.jsp" %>
	<%	} else {%>
	
	
	
		<h2>이곳은 Main입니다.(<%=user%>)</h2>
		<hr/>
		<p><img src="../../images/1.PNG" width="300px"/></p>
	</div>
<%} %>	
<!-- footer영역 : copyright/주소/소속/이메일....-->
	<div id="footer">
		<%@include file="footer.jsp" %>	
	</div>
	
		
</div>
<p><br/></p>
</body>
</html>