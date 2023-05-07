package study.t0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/0424/t5_LoginOut")
public class T5_LoginOut extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String mid = (String)session.getAttribute("sMid");

		session.invalidate();

		out.print("<script>");
		out.print("alert('"+mid+"로그아웃 되었습니다.');");
		out.print("location.href='"+request.getContextPath()+"/study/0425/storage/t5_login.jsp'");
		out.print("</script>");
	}
}
