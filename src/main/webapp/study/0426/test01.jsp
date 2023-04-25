<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test01.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSP/Servlet Life Cycle</h2>
	<form name="myform" method="post" action="${pageContext.request.contextPath}/0426/test01ok">
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="Servelt에서의 메소드 생명주기" size="60" class="form-control"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" name="content" class="form-control">서블릿 메소드 생명주기 연습입니다.</textarea>
				</td>
			</tr>
			<tr>
				
				<td colspan="2">
					<input type="submit" value="전송"/>
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
</body>
</html>