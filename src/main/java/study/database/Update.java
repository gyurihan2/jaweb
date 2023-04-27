package study.database;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/Update")
public class Update extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoginDAO dao = new LoginDAO();
		
		
		String mid = (String)session.getAttribute("sMid");
		
		LoginVO vo = dao.getMidCheck(mid);
		
		request.setAttribute("vo", vo);
		
		String viewPage="/study/0428_database/update.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
