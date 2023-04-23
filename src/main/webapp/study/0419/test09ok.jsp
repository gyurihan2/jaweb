<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	
	
	
	//admin hkd1234  1234
	
	if((mid.equals("admin") || mid.equals("hkd1234")) && pwd.equals("1234")) {
		System.out.println("회원인증 성공");
		out.println("<script>");
		out.println("alert('회원 인증 성공');");
		out.println("location.href='test09Success.jsp;'");
		out.println("</script>");
	}
	else{
		System.out.println("회원 인증 실패");
		out.println("<script>");
		out.println("alert('회원 인증 실패');");
		out.println("</script>");
		
	}
%>
