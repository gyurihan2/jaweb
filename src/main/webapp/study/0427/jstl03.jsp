<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl03.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>Function 라이브러리</h2>
	<pre>
		사용법: $ { fn: 함수명(변수/값/.....)}   EL표기법과 비슷(function라이브러리 만)
	</pre>
<%
	             //012345678901234567890123456789
	String atom = "welcome to my Homepage~!";
	String atom2 = "welcome to my Homepage~!";
	pageContext.setAttribute("atom", atom);
	pageContext.setAttribute("atom2", atom);
	
	String[] hobbys = {"등산","낚시","수영","바둑","싸이클","독서"};
	pageContext.setAttribute("hobbys", hobbys);
%>

<p>
	atom변수의 값? ${atom}<br/>
	
	1-1. atom 변수의 길이 : ${fn:length(atom)}  /  <%=atom.length() %><br/> 
	1-2. hobbys 변수의 길이 : ${fn:length(hobbys)}  /  <%=hobbys.length %><br/> 
	2. 대문자변환(toUpperCase()) : ${fn:toUpperCase(atom)}  /  <%=atom.toUpperCase() %><br/> 
	3. 소문자변환(toLowerCase()) : ${fn:toLowerCase(atom)}  /  <%=atom.toLowerCase() %><br/> 
	4-1. 문자열추출(substring()) : ${fn:substring(atom,0,3)}  /  <%=atom.substring(0,3) %><br/> 
	4-2. 문자열추출(substring()) : ${fn:substring(atom,2,5)}  /  <%=atom.substring(2,5) %><br/> 
	4-3. 문자열추출(substring()) : <%-- ${fn:substring(atom,2)} --%>  /  <%=atom.substring(2) %><br/> 
	4-4. 문자열추출(substring()) : ${fn:substring(atom,2,fn:length(atom))}  /  <%=atom.substring(2) %><br/> 
							    ${fn:substring(atom,2,-1)}<br/> 
	5-1. 특정 문자열 위치 검색(indexOf()) :${fn:indexOf(atom,"o")}  /  <%=atom.indexOf("o") %><br/>					   
	5-2. 특정 문자열 위치 검색(lastIndexOf()) : <%-- ${fn:lastIndexOf(atom,"o")} --%>  /  <%=atom.lastIndexOf("o") %><br/>					   
	atom 변수에 기억되어있는 'o' 문자의 위취를 모두 출력 <br/>
	<c:forEach var="i" begin="0" end="${fn:length(atom)-1}" varStatus="st">
		반복 횟수 : ${st.index} 비교문자: ${fn:substring(atom,i,i+1)}<br/>
		<c:if test="${fn:substring(atom,i,i+1) == 'o'}">
			'o'의 위치 ${i} <br/>
		</c:if>
	</c:forEach>
	
	6. 문자열추출(substringBefore() / substringAfter())<br/>
		문자열 'o' 앞의 문자열 출력 ${fn:substringBefore(atom,'o')}<br/>
		문자열 'o' 뒤의 문자열 출력 ${fn:substringAfter(atom,'o')}<br/>
		
	7. 문자열분리(split(변수,분리한 문자)) : 문자 분리 후 분리된 문자들은 변수(배열)에 저장해야된다.
	예) atom변수의 문자중 'o' 문자 기준으로 분리
	<c:set var="atoms" value="${fn: split(atom,'o')}"/><br/>
	<c:forEach var="atom" items="${atoms}" varStatus="st">
		${st.count} : ${atom}
	</c:forEach><br/>
	
	atom변수 저장된 'o'의 개수는? ${fn:length(atoms)-1}
	
	8.문자열 치환(replace())<br/>
	예) atom뱐수의 'my'를 'your'로 변경하세요<br/>
	<c:set var="temp" value="${fn:replace(atom2,'my','your')}"/>
	<%-- <%= atom.replace("my", "your") %> --%> /  ${temp}<br/>
	
	9.특정 문자 포함유무 
	예 atom2변수에 'o'를 포함하고 있느냐 ${fn:contains(atom2,'o')}
	예 atom2변수에 'my'를 포함하고 있느냐 ${fn:contains(atom2,'my')}
	
	
</p>
</div>
<p><br/></p>
</body>
</html>