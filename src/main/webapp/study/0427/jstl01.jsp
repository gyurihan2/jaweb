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
	<table class="table table-border">
		<tr class="table table-borer table-hover">
			<th>라이브러리명</th>
			<th>주소(URL)</th>
			<th>접두어</th>
			<th>기본문법</th>
		</tr>
		<tr>
			<td>Core</td>
			<td>http://java.sun.com/jsp/jstl/core</td>
			<td>c</td>
			<td> c: 태그명.. </td>
		</tr>
		<tr>
			<td>formatting</td>
			<td>http://java.sun.com/jsp/jstl/fmt</td>
			<td>fmt</td>
			<td> fmt: 태그명.. </td>
		</tr>
		<tr>
			<td>Function</td>
			<td>http://java.sun.com/jsp/jstl/function</td>
			<td>fn</td>
			<td>  fn: 태그명 </td>
		</tr>
		<tr>
			<td>SQL</td>
			<td>http://java.sun.com/jsp/jstl/sql</td>
			<td>sql</td>
			<td>  sql : 태그명 ...   </td>
		</tr>
		<tr><td colspan="4" class="m-0 p-0"></tr>
	</table>
	<br/><hr/><br/>
	
	<h3>Core 라이브러리: 변수(선언/할당/출력/제거), 제어문(조건,반복문)-제어문안의 변수로 활용</h3>
	<pre>
		변수 선언 :  c : var="변수명" value="값" /		
		변수 출력 :  c : out value="변수명/값 /
		변수 제거 :  c : remove var="변수명" /
	</pre>
	
	<p>라이브러리를 사용할경우 jsp지시자(taglib) 상단에 선언</p>
	
	<p>
		su1변수에 값 할당 <c:set var="su1" value="100"></c:set>
		su1 변수의 값을 출력 <c:out value="${su1}"></c:out>
		su1변수 값에 100 더하여 su2변수에 할당
		<c:set var="su2" value="${su1+100}"></c:set>
		su2 값 : <c:out value="${su2}"></c:out><br/>
		c: out은 el변수로 대체할수있음  --- -> <%-- ${su2} el표현식은 JSP 주석으로 --%>
	</p>
	<hr/>
	<h4>JSTL 제어문(core라이브러리를 활용)</h4>
	<p>사용법 : < c : if test="$ {조건식 }" > 조건식의 내용이 참일때 수행 < / c : if ></p>
	<div>일반적인 비교연산 수행시 문자로 비교처리한다.</div>
	<div>숫자로 비교연산하러면 '숫자'로 변형(문자변수 + 0)해서 비교처리</div>
	<div>
	<hr/>
		예제: su3는 100일, su4는 200으로 저장하하고 두값을 비교해보자
		<c:set var="su3" value="100"></c:set>
		<c:set var="su4" value="200"></c:set>
		1.su3 == su4  :
		<c:if test="${su3 == su4}">su3와 su4는 같다</c:if> 
		<c:if test="${su3 != su4}">su3와 su4는 다르다</c:if><br/> 
		 
		2.su3>su4 <br/>
		<c:if test="${su3 > su4}">su3는 su4는 크다</c:if> 
		<c:if test="${su3 < su4}">su3는 su4는 작다</c:if><br/> 
		<c:if test="${su3 == su4}">su3는 su4는  같다</c:if><br/>
		
		3-1 su3 > su4 : <c:if test="${su3+0 > su4+0}">su3가 su4보다 크다</c:if><br/>
		3-3 su3 > su4 : <c:if test="${su3+0 <= su4+0}">su3가 su4보다 작거나 같다</c:if>	 
	</div>
	<div>예제 URL에 jumsu를 입력 받아서 학점을 구하세요</div>
	<c:set var="jumsu" value="${param.jumsu}"></c:set>
	
	<c:if test="${jumsu > 60 }"><c:if test="${jumsu<70}">D학점</c:if></c:if>
	<c:if test="${jumsu > 70 }"><c:if test="${jumsu<80}">C학점</c:if></c:if>
	<c:if test="${jumsu > 80 }"><c:if test="${jumsu<90}">B학점</c:if></c:if>
	<c:if test="${jumsu >= 90 }">A학점</c:if>
	<c:if test="${jumsu < 60 }">F학점</c:if>
	<br/>
	<hr/>
	
	<h3>다중조건비교: choose ~ when</h3>
	<pre>
		사용법:
	
		< c : choose >
			< c : when test="조건식" > 1수행할 내용 < / c : when>
			< c : when test="조건식" > 2수행할 내용 < / c : when>
			< c : when test="조건식" > 3수행할 내용 < / c : when>
			~~~
			< c : otherwise > 기타 수행할 내용 < / c : when>
		< / c : choose >
	</pre>
	<c:choose>
		<c:when test="${jumsu >= 90 }">A</c:when>
		<c:when test="${jumsu >= 80 }">B</c:when>
		<c:when test="${jumsu >= 70 }">C</c:when>
		<c:when test="${jumsu >= 60 }">D</c:when>
		<c:otherwise>F</c:otherwise>
	</c:choose>
</div>
<p><br/></p>
</body>
</html>
