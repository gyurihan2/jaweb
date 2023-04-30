<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String text = request.getParameter("test")==null ? "" : request.getParameter("test");
	pageContext.setAttribute("pText", text);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/include/bs4.jsp" />
<script>
	"use strict";
	function chkFnc(){
		let test =$("#test").val();
		
	}
</script>
</head>
<body>
<h2>검색하신  문장의 'o'단어의 3번째 위치를 찾습니다.</h2>

	<form>
		문장 : <input type="text" name="test" id="test">
		<input type="submit" value="실행"/>
	</form>
	
	<!-- 넘겨 받은 값이 있을경우 -->
	<c:if test="${!empty pText}">
		<hr/>
		<c:set var="text" value="${pText}"/>
		<c:set var="res" value="0"/>
		<c:set var="cnt" value="0"/>
		
		<h4>검색한 문장 : <c:out value="${text}"/></h4><br/>
		
		<c:forEach begin="0" end="${fn:length(text)-1}">
			<c:if test="${cnt < 3 }">
				<c:if test="${fn:indexOf(text,'o') != -1}">
					<h5><c:out value="${cnt+1}"/>번째 검색 위치: 
					<c:set var="res" value="${res+fn:indexOf(text,'o')+1}"/>
					<c:set var="text" value="${fn:substring(text,fn:indexOf(text,'o')+1,fn:length(text))}"/>
					<c:out value="${res}"/><br/>
					</h5>
					<c:set var="cnt" value="${cnt+1}"/>
				</c:if>
			</c:if>
		</c:forEach>
		
	</c:if>
</body>
</html>