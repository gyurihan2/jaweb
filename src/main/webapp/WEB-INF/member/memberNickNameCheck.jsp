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
    
    function sendCheck() {
    	opener.window.document.myform.nickName.value = '${nickName}';
    	$(opener.document).find("#name").focus();
    	
    	$(opener.document).find("#dupulNickName").css("display","inline");
    	$(opener.document).find("#regNickName").html("<font color='green'>닉네임 중복 확인 되었습니다.</font>");
    	
    	window.close();
    }
    
    function nickNameCheck() {
    	let nickName = childForm.nickName.value;
    	
    	if(nickName.trim() == "") {
    		alert("닉네임을 입력하세요!");
    		childForm.nickName.focus();
    	}
    	else {
    		childForm.submit();
    	}
    }
    
    jQuery(function(){
    	if(${res} == 1){
    		$("#nickName").val("${param.nickName}");
    	}
    	
    });
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h3>닉네임 체크폼</h3>
  <form name="childForm" method="post" action="${ctp}/MemberNickNameCheck.mem">
	  <c:if test="${res == 1}">
	    <h4><font color="blue"><b>${nickName}</b></font>닉네임은 사용 가능합니다.</h4>
	    <p>
	    	<input type="text" name="nickName" id="nickName"/>
	    	<input type="button" value="닉네임 사용" onclick="sendCheck()" class="btn btn-success btn-sm"/>
	    	<input type="button" value="닉네임 재검색" onclick="nickNameCheck()" class="btn btn-primary btn-sm"/>
	    	<input type="button" value="창닫기" onclick="window.close()" class="btn btn-secondary btn-sm"/>
	    </p>
	  </c:if>
	  <c:if test="${res != 1}">
	    <h4><font color="blue"><b>${nickName}</b></font>닉네임은 이미 사용중입니다..</h4>
	    	<p>
	    	  <input type="text" name="nickName"/>
	    	  <input type="button" value="닉네임 재검색" onclick="nickNameCheck()" class="btn btn-success btn-sm"/>
	    	  <input type="button" value="창닫기" onclick="window.close()" class="btn btn-secondary btn-sm"/>
	    	</p>
	  </c:if>
  </form>
</div>
<p><br/></p>
</body>
</html>