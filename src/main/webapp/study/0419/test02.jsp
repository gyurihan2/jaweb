<!-- 지시자(Directive) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>JSP 문법</h2>		
		<%-- JSP 주석 --%>
		<%
			//스크립틀릿(자바 코드를 작성하는 영역)
			/* 
				자바 여러줄 주석
			*/
			System.out.println("이곳은 JSP 파일 안입니다.");
		
			out.println("<font color='red'>이곳은 JSP안에서의 HTML코드입니다.</font>");
			int i=100;
		%>
		
		<hr/>
		<%="안녕하세요. 이 곳은 표현식(Expression) 내부입니다." %>
		
	</div>
	<p><br/></p>
</body>
</html>