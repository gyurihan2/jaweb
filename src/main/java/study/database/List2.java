package study.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/database/List2")
public class List2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		LoginDAO dao = new LoginDAO();
//		ArrayList<LoginVO> vos = dao.getLoginList();
//		
//		//1. 현재 페이지 
//		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
//		
//		//2. 페이지에 출력할 레코드의 수(default : 5)
//		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));;
//		
//		//3. 전체 Record 건수
//		int totRecCnt = vos.size();
//		
//		
//		
//		
//		request.setAttribute("vos", vos);
//		
//		String viewPage = "/study/0428_database/memberList.jsp";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);
	}
}
