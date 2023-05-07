package study.t0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/0424/t6_LoginOk")
public class T6_LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "":request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "":request.getParameter("pwd");
		String idSave = request.getParameter("idSave") == null ? "off":request.getParameter("idSave");
		String viewPage="";
		PrintWriter out = response.getWriter();
		HttpSession session  = request.getSession();
		Cookie cookieMid = new Cookie("cMid", mid);

		cookieMid.setPath("/"); // 전체 경로에서 쿠기 확인 가능(다른 경로 설정가능)
		if(idSave.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);
		}
		else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);

		if((mid.equals("admin") && pwd.equals("1234"))|| (mid.equals("hkd1234") && pwd.equals("1234"))){
			viewPage="/study/0425/storage/t6_member.jsp";

			session.setAttribute("sMid",mid);

			out.print("<script>");
			out.print("alert('로그인 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0425/storage/t6_member.jsp'");
			out.print("</script>");
//			request.getRequestDispatcher(viewPage).forward(request,response);
		}
		else {
			viewPage= "/study/0425/storage/t5_login.jsp";
			request.getRequestDispatcher(viewPage).forward(request,response);
		}
	}
}
