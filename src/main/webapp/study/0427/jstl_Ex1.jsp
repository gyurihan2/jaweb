<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"/>
<script>
	'use strict';
	
	$(function(){
		$("#imgName").change(function(){
			$("#demo").html("<img src='/javaweb/images/"+$(this).val()+".jpg' width='300px'/>");
		});
		
		$("#print").click(function() {
			$("#demo2").css("display","block");
		});
	});
	
</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<p>콤보상자에 숫자 1~6까지를 기억 시키고 화면에 보여준다
	이때 숫자를 선택하면 아래쪽으로 선택한 숫자의 그림파일을 출력한다.
	콤포상자 옆에 텍스트박스를 위치시키고 해당 그림의 그림명을 입력 받아 저장 버튼을 클릭하면
	그림명과 그림파일명을 저장시켜준다 출력 버튼을 클릭하면 출력
	</p>
	
<form id="myform" action="<%=request.getContextPath()%>/0427/ex1Save">
	<select id="imgName" name="imgName" >
	<c:forEach var="i" begin="1" end="6">
	    <option value="${i}">${i}</option>
	</c:forEach>
  	</select>
  	<input type="text" id="paintName" name="paintName" required/>
	<input type="submit" value="저장"/>
	<input type="button" value="출력" id="print" name="print"/>
	<input type="button" value="초기화" onclick="location.href='<%=request.getContextPath()%>/0427/ex1Reset'"/>
	
 </form>
  <div id="demo"><img src="<%=request.getContextPath()%>/images/1.jpg" width="300px"></div>
  <hr/>
  <div id="demo2" style="display:none">
	 <c:if test="${savePaint != null}">
		<c:forEach var="i" items="${savePaint}" varStatus="st">
			 <p><b>저장한 그림 이름: ${i[1]}</b></p>
			<img src="<%=request.getContextPath()%>/images/${i[0]}.jpg" width="300px">
			<br/>
		</c:forEach>
	 </c:if>
  </div>
</div>
<p><br/></p>
</body>
</html>