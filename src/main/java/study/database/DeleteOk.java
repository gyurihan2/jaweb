package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/DeleteOk")
public class DeleteOk extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoginDAO dao = new LoginDAO();
		
		String mid = (String)session.getAttribute("sMid");
		
		int res = dao.setDeleteOk(mid);
		
		PrintWriter out = response.getWriter();
		
		if(res == 1) {
			
			out.print("<script>");
			out.print("alert('잘가세요..');");
			out.print("location.href='"+request.getContextPath()+"/database/Logout';");
			out.print("</script>");
		}
		else {
			
			out.print("<script>");
			out.print("alert('탈퇴 실패.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';");
			out.print("</script>");
		}
	}
}