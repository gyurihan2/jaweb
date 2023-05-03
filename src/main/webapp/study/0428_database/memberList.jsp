<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp" />
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
   <script>
  	'use strcit';
  	function pageCheck() {
		let pageSize = $("#pageSize").val();
		location.href = "${ctp}/database/List?pag=1&pageSize="+pageSize;
	}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <h2>전 체 회 원 리 스 트</h2>
  <table class="table table-hover text-center">
  	<tr>
  		<td>
    	<select name="pageSize" id="pageSize" onchange="pageCheck()">
	    		<option <c:if test="${pageSize==3}">selected</c:if>>3</option>
	    		<option <c:if test="${pageSize==5}">selected</c:if>>5</option>
	    		<option <c:if test="${pageSize==10}">selected</c:if>>10</option>
	    		<option <c:if test="${pageSize==15}">selected</c:if>>15</option>
	    		<option <c:if test="${pageSize==20}">selected</c:if>>20</option>
    	</select> 건
    	</td>
  	</tr>
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>아이디</th>
      <th>성명</th>
      <c:if test="${sMid == 'admin'}">
	      <th>비밀번호</th>
	      <th>포인트</th>
	      <th>최종방문일</th>
      </c:if>
      <th>오늘방문횟수</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${curScrStartNo-st.index}</td>
	      <td>${vo.mid}</td>
	      <td>${vo.name}</td>
	      <c:if test="${sMid == 'admin'}">
		      <td>${vo.pwd}</td>
		      <td>${vo.point}</td>
		      <td>${fn:substring(vo.lastDate,0,16)}</td>
	      </c:if>
	      <td>${vo.todayCount}</td>
	    </tr>
    </c:forEach>
    <tr><td colspan="7" class="m-0 p-0"></td></tr>
  </table>
 
  <div class="text-center">
  	<c:if test="${curBlock*pageSize > 1}">
  		[<a href="${ctp}/database/List?pageSize=${pageSize}&pag=1">첫페이지</a>]
  	</c:if>
  	<c:if test="${curBlock > 0 }">[<a href="${ctp}/database/List?pageSize=${pageSize}&pag=${((curBlock-1)*blockSize)+blockSize}">이전블록</a>]</c:if>
  	<c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize+blockSize}" varStatus="st">
  		<c:if test="${i<=totPage && i==pag}">[<font color="red">${i}</font>]</c:if>
  		<c:if test="${i<=totPage && i!=pag}">[<a href="${ctp}/database/List?pageSize=${pageSize}&pag=${i}">${i}</a>]</c:if>
  	</c:forEach>
  	<c:if test="${curBlock < lastBlock }">[<a href="${ctp}/database/List?pageSize=${pageSize}&pag=${((curBlock+1)*blockSize)+1}">다음블록</a>]</c:if>
  	<c:if test="${(curBlock+1)*pageSize < totPage}">
  		[<a href="${ctp}/database/List?pageSize=${pageSize}&pag=${totPage}">마지막 페이지</a>]
  	</c:if>
  </div>
  
  <br/>
  <div>
    <a href="${ctp}/study/0428_database/memberMain.jsp" class="btn btn-success">돌아가기</a>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>