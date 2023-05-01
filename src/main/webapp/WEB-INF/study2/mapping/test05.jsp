<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test05.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<h2>이곳은 test05.jpg입니다.</h2>
	<hr/>
	<p><img src="${ctp}/images/5.jpg" width="350px"/></p>
	<p>
		<a href="${ctp}/mapping/Test05_2.do" class="btn btn-primary">test5_2호출</a>
		<a href="${ctp}/mapping/Test05_3.do" class="btn btn-secondary">test5_3호출</a>
		<a href="${ctp}/mapping/Test05_4.do" class="btn btn-success">test5_4호출</a>
		<a href="${ctp}/mapping/Test05_5.do" class="btn btn-success">test5_5호출</a>
	</p>
	<hr/>
	<div>
		<form name="myform" method="get" action="${ctp}/mapping/Test05_5.do">
			<div>
				첫번째 수: <input type="number" name="su1" value="0" class="form-control"/>
			</div>
			<div>
				연산자: <select  name="op" class="form-control">
					<option selected>+</option>
					<option>-</option>
					<option>*</option>
					<option>/</option>
					<option>%</option>
				</select>
			</div>
			<div>
				두번째 수: <input type="number" name="su2" value="0" class="form-control"/>
			</div>
			<div>
				<input type="submit"  value="계산" class="btn btn-success"/>
			</div>
			
		</form>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>