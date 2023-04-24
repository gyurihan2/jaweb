<!-- t1_CookiesSave.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String mid = "hkd1234";
	String pwd ="1234";
	String job = "학생";
	
	/* 쿠키 객체 생성 */
	Cookie cookieMid = new Cookie("cMid",mid);
	Cookie cookiePwd = new Cookie("cPwd",pwd);
	Cookie cookieJob = new Cookie("cJob",job);
	/* 쿠키 생명주기 */
	cookieMid.setMaxAge(60*60*24); //쿠키 만료 시간: 단위(초) 1일(60*60*24)
	cookiePwd.setMaxAge(60*60*24);
	cookieJob.setMaxAge(60*60*24);
	/* 쿠키를 클라이언트(PC)에 저장하기 */
	response.addCookie(cookieMid);
	response.addCookie(cookiePwd);
	response.addCookie(cookieJob);
	
%>
<script>
	alert("쿠키 생성 !!!");
	location.href="t1_CookiesMain.jsp";
</script>