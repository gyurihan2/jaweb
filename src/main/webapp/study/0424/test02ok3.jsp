<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 스크릿틀릿 -> jstl 사용 -->
<%-- <% String name = request.getParameter("name"); %> --%>
<c:set var="name" value="${param.name}"/>
<c:set var="age" value="${param.age}"/>
<c:set var="gender" value="${param.gender}"/>
<c:set var="job" value="${param.job}"/>
<c:set var="address" value="${param.address}"/>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1Res.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">

  <h3>처리된 자료를 view에 출력시켜본다.</h3>
  <div>
    <table class="table table-bordered">
      <tr>
        <th>성명</th>
        <td>${name}</td>
      </tr>
      <%-- <tr>
        <th>나이</th>
        <td>${age}</td>
      </tr> --%>
      <tr>
        <th>나이</th>
        <%-- <td><c:out value="${age}"/></td>  표준 jstl el --%>
        <td>${age -1}</td>
      </tr>
      <tr>
        <th>성별</th>
        <td>${gender}</td>
      </tr>
      <tr>
        <th>직업</th>
        <td>${job}</td>
      </tr>
      <tr>
        <th>주소</th>
        <td>${address}</td>
      </tr>
    </table>
    <p>
      <%-- <a href="<%=request.getContextPath()%>/study/0424/test1.jsp" class="btn btn-warning">돌아가기</a> --%>
      <a href="test02.jsp" class="btn btn-warning">돌아가기</a>
    </p>
  </div>
</div>
<p><br/></p>
</body>
</html>