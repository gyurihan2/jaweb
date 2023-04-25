<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
<h2>JSTL(Java Standard Tag Library)</h2>
<h3>반복처리(Core라이브러리) forEach문</h3>
<pre>
	사용법 1)	< c : foreEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수" >
	사용법 2)	< c : foreEach var="변수" items="$ {배열/객체명 }" varStatus="매개변수" >
	사용법 3)	< c : foreTokens var="변수" items="$ {배열/객체명 }" delims="구분기호" >
</pre>

<hr/>
<p>사용예1-1 : <br/>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i}.안녕~~~<br/>
	</c:forEach>
	
<p>사용예1-2 : <br/>
	<c:forEach var="i" begin="5" end="10" step="1" varStatus="st">
		${i} : ${st.index} : ${st.count} : ${st.first} : ${st.last } 안녕~~~ /
	</c:forEach>
	
</p>
<br/>
<hr/>
<p>사용예2-1:<br/>
	<% 
		String[] cards = {"국민","BC","농협","비자","LG","삼성"};
		
		String hobbys ="등산/낚시/수영/바둑/영화감상/음악감상";
		
		pageContext.setAttribute("cards", cards);
		pageContext.setAttribute("hobbys", hobbys);
		
	%>
	
	<c:forEach var="card" items="${cards}">
		${card}/
	</c:forEach>
</p>
<p>사용예2-2:<br/>
	
	<c:forEach var="card" items="${cards}" varStatus="st">
<%-- 		${st.index} : ${card}/ --%>
		${st.count} : ${card}/
	</c:forEach>
</p>

<br/>
<hr/>
<p>사용예3-1:<br/>
	<c:forTokens var="i" items="${hobbys}" delims="/">
		${i}:
	</c:forTokens>
</p>
<p>사용예3-3:<br/>
	<c:forTokens var="i" items="${hobbys}" delims="/" varStatus="st">
		${st.count} ${i}:
	</c:forTokens>
</p>
<p>문제1: 전송된 취미중에서 바둑은 빨강생 수영은 파랑색 나머지는 그대로</p>
<c:forTokens var="hobby" items="${hobbys}" delims="/" varStatus="st">
	<c:choose>
		<c:when test="${hobby == '바둑'}"><font color='red'>바둑</font></c:when>
		<c:when test="${hobby == '수영'}"><font color='blue'">수영</font></c:when>
		<c:otherwise><p>${hobby}</p></c:otherwise>
	</c:choose>
</c:forTokens>
<br/>
<hr/>
<h3>구구단 연습</h3>
<c:forEach var="i" begin="1" end="9">
	7 * ${i} = ${i*7}<br/>
</c:forEach>

<h3>이중 forEach문을 활용한 구구단</h3>
<c:forEach var="i" begin="1" end="7">
	<c:forEach var="j" begin="1" end="9">
		${i} * ${j} = ${j*i} <br/>
	</c:forEach>
</c:forEach>
<br/>
<hr/>

<h3>그림 6장을 1줄에 3장씩 </h3>
<c:forEach var="i" begin="1" end="6">
	<img src="${pageContext.request.contextPath}/images/${i}.PNG" width="100px">
	<c:if test="${i%3 == 0}"><br/></c:if>
</c:forEach>


<c:forEach var="i" begin="1" end="2">
	<c:forEach var="j" begin="1" end="3">
	<img src="${pageContext.request.contextPath}/images/${i*j}.PNG" width="100px">
	</c:forEach>
	<br/>
</c:forEach>


</div>
<p><br/></p>
</body>
</html>