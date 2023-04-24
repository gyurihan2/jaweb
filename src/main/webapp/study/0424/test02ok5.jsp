<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 스크릿틀릿 -> jstl 사용 -->
<%-- <% String name = request.getParameter("name"); %> --%>

<!-- jsp에서 객체를 사용하기 위해선 해당 객체를 생성해야한다(jsp 액션 태그(useBean)사용). -->
<!-- Atom atom = new Atom(); -->
<!-- id -> atom = class-> Atom() -->
<jsp:useBean id="vo" class="study.t0424.Test01VO" />

<!-- getProperty(= getter()) / setProperty(= setter())를 이용하여 값을 저장/불러온다 -->
<%-- <jsp:setProperty property="name" value="name" name="vo"/> --%>
<!-- property : vo의 변수  value: form태그에서 넘온값 name: 변수명-->
<%-- <jsp:setProperty property="name" value="name" name="vo"/>
<jsp:setProperty property="age" value="age" name="vo"/>
<jsp:setProperty property="gender" value="gender" name="vo"/>
<jsp:setProperty property="job" value="job" name="vo"/>
<jsp:setProperty property="address" value="address" name="vo"/> --%>

<!-- property value가 같으면 생략 가능하며 * 사용시 모든 변수를 저장-->
<jsp:setProperty property="*" name="vo"/>

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
        <td>${name} / <jsp:getProperty property="name" name="vo"/></td>
      </tr>
      <%-- <tr>
        <th>나이</th>
        <td>${age}</td>
      </tr> --%>
      <tr>
        <th>나이</th>
        <%-- <td><c:out value="${age}"/></td>  표준 jstl el --%>
        <td>${age -1} / <jsp:getProperty property="age" name="vo"/></td>
      </tr>
      <tr>
        <th>성별</th>
        <td>${gender} / <jsp:getProperty property="gender" name="vo"/></td>
      </tr>
      <tr>
        <th>직업</th>
        <td>${job} / <jsp:getProperty property="job" name="vo"/></td>
      </tr>
      <tr>
        <th>주소</th>
        <td>${address} / <jsp:getProperty property="address" name="vo"/></td>
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