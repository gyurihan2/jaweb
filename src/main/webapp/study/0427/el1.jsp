<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>el1.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>EL(Expression Language)</h2>
	<p>저장소에 저장된 자료를 처리 할수있다.</p>
	<pre>
		용도: 사용자가 '값/변수/수식/객체'등을 전송받은후 저장 또는 처리 가능
		저장소 : request / pageContext / session / application
	</pre>
	<hr/>
	<% 
	String atom="Seoul"; 
	String name="홍길동";
	int su1=100, su2=200;
	
	%>
	<h4>스크립틀릿을 이용하는 방법과 EL 방법 비교</h4>
	<div>스크립틀릿</div>
	atom : <%=atom %> <br/>
	name : <%=name %> <br/>
	su1 : <%=su1 %> <br/>
	su2 : <%=su2 %> <br/>
	<div>EL표기법</div><br/>
	<%
		/* //저장소 저장 */
		pageContext.setAttribute("atom", atom);
		pageContext.setAttribute("name", name);
		pageContext.setAttribute("su1", su1);
		pageContext.setAttribute("su2", su2);
	%>
	atom : ${atom} <br/>
	name : ${name} <br/>
	su1 : ${su1} <br/>
	su2 : ${su2 } <br/>
	<br/>
	<h4>파라미터를 통해서 넘온 값으 처리(form / get방식)</h4>
	<div>Form 태크의 get/post방식으로 전송이나 url을 통한 get방식의 전송처리(http://test.com/test?dfs=123&test1=222)</div>
	mbc: ${param.mbc}<br>
	kbs: ${param.kbs}<br>
	<%
	String mid = request.getParameter("mid")== null ? "" : request.getParameter("mid");
	pageContext.setAttribute("mid", mid);
	%>
	
	<hr/>
	<form action="">
		<div>아이디 : <input type="text" name="mid" value="${mid}"/></div>
		<div><input type="submit" value="전송"/></div>
	</form>
	
	
</div>
<p><br/></p>
</body>
</html>