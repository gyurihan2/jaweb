package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/loginOk")
public class LoginOk extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "":request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "":request.getParameter("pwd");
		
		LoginDAO dao= new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid,pwd);
		
		PrintWriter out = response.getWriter();
		
		if(vo != null) {
			
			//방문 포인트  + 최종접속일 처리 + 방문 카운트
			dao.setPointPlus(mid);
			
			// 로그인 인증 후 세션에 저장할 값
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint()+10);
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("sTodayCount", vo.getTodayCount()+1);
			
			out.print("<script>");
			out.print("alert('"+vo.getName()+"님 로그인 성공');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';");
			out.print("</script>");
			
			
		}
		else {
			out.print("<script>");
			out.print("alert('로그인 실패');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
			out.print("</script>");
		}
		
	}
}
