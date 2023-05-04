<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardList.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		"use strict";
		function pageCheck() {
			let pageSize = $("#pageSize").val();
			location.href = "${ctp}/BoardList.bo?pag=1&pageSize="+pageSize;
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2 class="text-center">게 시 판 List</h2>
	
	<table class="table table-boderless">
		<tr>
			<td><a href="${ctp}/BoardInput.bo" class="btn btn-primary btn-sm">글쓰기</a></td>
			<td class="text-right">
		    	<select name="pageSize" id="pageSize" onchange="pageCheck()">
			    		<option <c:if test="${pageSize==3}">selected</c:if>>3</option>
			    		<option <c:if test="${pageSize==5}">selected</c:if>>5</option>
			    		<option <c:if test="${pageSize==10}">selected</c:if>>10</option>
			    		<option <c:if test="${pageSize==15}">selected</c:if>>15</option>
			    		<option <c:if test="${pageSize==20}">selected</c:if>>20</option>
		    	</select> 건
    		</td>
		</tr>
	</table>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>글 번호</th>
			<th>글 제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>추천</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${curScrStartNo-st.index}</td>
				<td>
					${vo.title}
					<c:if test="${vo.hour_diff <= 24}">
						<img src="${ctp}/images/new.gif"/>
					</c:if>
				</td>
				<td>${vo.nickName}</td>
				<td>
					
					<!-- 24시간 이내는 시간만 표시, 이후는 날짜 시간 표시 -->
					<c:if test="${vo.hour_diff <= 24}">
						${vo.day_diff == 0 ? fn:substring(vo.wDate,11,16) : fn:substring(vo.wDate,0,19) }
					</c:if>
					
					<c:if test="${vo.hour_diff gt 24}">
						${fn:substring(vo.wDate,0,19)}	
					</c:if>				
				</td>
				<td>${vo.readNum}</td>
				<td>${vo.good}</td>
			</tr>
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>
	<br/>
	<!-- 블록 페이징 -->
	<div class="text-center">
  	<ul class="pagination justify-content-center">
	  	<c:if test="${curBlock*pageSize > 1}">
	  		 <li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=1">첫페이지</a></li>
	  	</c:if>
	  	<c:if test="${curBlock > 0 }">
	  		 <li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${((curBlock-1)*blockSize)+blockSize}">이전블록</a></li>
	  	</c:if>
	  	<c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize+ blockSize}" varStatus="st">
	  		<c:if test="${i<=totPage && i==pag}">
	  			 <li class="page-item active"><a class="page-link text-white bg-secondary">${i}</a></li>
	  		</c:if>
	  		<c:if test="${i<=totPage && i!=pag}">
	  			 <li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li>
	  		</c:if>
	  	</c:forEach>
	  	<c:if test="${curBlock < lastBlock }">
	  		 <li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${((curBlock+1)*blockSize)+1}">다음블록</a></li>
	  	</c:if>
	  	<c:if test="${(curBlock+1)*pageSize < totPage}">
	  		 <li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${totPage}">마지막 페이지</a></li>
	  	</c:if>
  	</ul>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>