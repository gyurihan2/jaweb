package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/UpdateOk")
public class UpdateOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String mid = (String) session.getAttribute("sMid");
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setName(name);
		vo.setPwd(pwd);
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setUpdateOk(vo);
		
		PrintWriter out = response.getWriter();
		
		if(res == 1) {
			session.setAttribute("sName", name);
			
			out.print("<script>");
			out.print("alert('회원 정보가 수정 되었습니다..');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';");
			out.print("</script>");
		}
		else {
			
			out.print("<script>");
			out.print("alert('회원정보 수정 실패.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/Update';");
			out.print("</script>");
		}
		
		
	}
}
