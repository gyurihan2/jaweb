package study.t0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/0424/t5_LoginOk")
public class T5_LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "":request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "":request.getParameter("pwd");
		String viewPage="";
		PrintWriter out = response.getWriter();
		 HttpSession session  = request.getSession();
		
		if((mid.equals("admin") && pwd.equals("1234"))|| (mid.equals("hkd1234") && pwd.equals("1234"))){
			viewPage="/study/0425/storage/t5_member.jsp";
			
			session.setAttribute("sMid",mid);
			
			out.print("<script>");
			out.print("alert('로그인 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0425/storage/t5_member.jsp'");
			out.print("</script>");
//			request.getRequestDispatcher(viewPage).forward(request,response);
		}
		else {
			viewPage= "/study/0425/storage/t5_login.jsp";
			request.getRequestDispatcher(viewPage).forward(request,response);
		}
	}
}
