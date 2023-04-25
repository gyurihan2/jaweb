package study.t0427;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/0427/ex1Reset")
public class Ex1Reset extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Ex1Save.vos.clear();
		HttpSession session = request.getSession();
		session.removeAttribute("savePaint");
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('초기화 되었습니다.');");
		out.print("location.href='"+request.getContextPath()+"/study/0427/jstl_Ex1.jsp'");
		out.print("</script>");
		
	}
}