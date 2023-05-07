<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberIdCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 아이디 사용 버트
    function sendCheck() {
    	//부모창에 값 넣기
    	opener.window.document.myform.mid.value = '${mid}';
    	$(opener.document).find("#pwd").focus();
    	
    	// 중복 확인 상태창
    	$(opener.document).find("#dupulMid").css("display","inline");
    	$(opener.document).find("#regMid").html("<font color='green'>아이디 중복 확인 되었습니다.</font>");
    	
    	window.close();
    }
    
    function idCheck() {
    	let mid = childForm.mid.value;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요!");
    		childForm.mid.focus();
    	}
    	else {
    		childForm.submit();
    	}
    }
    
    jQuery(function(){
    	if(${res} == 1){
    		$("#mid").val("${param.mid}");
    	}
    	
    });
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h3>아이디 체크폼</h3>
  <form name="childForm" method="post" action="${ctp}/MemberIdCheck.mem">
	  <c:if test="${res == 1}">
	    <h4><font color="blue"><b>${mid}</b></font>아이디는 사용 가능합니다.</h4>
	    <p>
	    	<input type="text" name="mid" id="mid"/>
	    	<input type="button" value="아이디 사용" onclick="sendCheck()" class="btn btn-success btn-sm"/>
	    	<input type="button" value="아이디 재검색" onclick="idCheck()" class="btn btn-primary btn-sm"/>
	    	<input type="button" value="창닫기" onclick="window.close()" class="btn btn-secondary btn-sm"/>
	    </p>
	  </c:if>
	  <c:if test="${res != 1}">
	    <h4><font color="blue"><b>${mid}</b></font>아이디는 이미 사용중인 아이디입니다.</h4>
	    	<p>
	    	  <input type="text" name="mid"/>
	    	  <input type="button" value="아이디 재검색" onclick="idCheck()" class="btn btn-success btn-sm"/>
	    	  <input type="button" value="창닫기" onclick="window.close()" class="btn btn-secondary btn-sm"/>
	    	</p>
	  </c:if>
  </form>
</div>
<p><br/></p>
</body>
</html>