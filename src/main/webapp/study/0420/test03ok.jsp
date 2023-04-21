<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String[] hobbys= request.getParameterValues("hobby");
	
	String str="";
	
	for(String i : hobbys){
		str += i+", ";
	}
	str = str.substring(0,str.length()-2);	
	
	/*
		서버 저장소 종류 (MVC에 M을 의미): 내장객체
		pageContext
		request
		session
		application
		
		클라이언트 저장소: 내장객체
		Cookie
	*/
	
	pageContext.setAttribute("name", name); //(저장소이름, 값)
	pageContext.setAttribute("age", age);
	pageContext.setAttribute("gender", gender);
	pageContext.setAttribute("hoddy", str);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test03ok</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>전송된 값 출력하기</h2>
    <table class="table table-border">
        <tr>
            <th>성명</th>
            <td>${name}</td>
        </tr>
        <tr>
            <th>나이</th>
            <td>${age}</td>
        </tr>
        <tr>
            <th>성별</th>
            <td>${gender}</td>
        </tr>
        <tr>
            <th>취미</th>
            <td>
            ${hoddy}
			</td>
        </tr>

    </table>
    <p>
        <a href="test03.jsp" class="btn btn-success">돌아가기</a>
    </p>
</div>
<p><br/></p>
</body>
</html>