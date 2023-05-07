package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class Test05Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri = request.getRequestURI();

		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		System.out.println(com);

		String viewPage="/WEB-INF/study2/mapping";

		if(com.equals("/Test05")) {
			viewPage += "/test05.jsp";
		}
		else if(com.equals("/Test05_1")) viewPage += "/test05_1.jsp";
		else if(com.equals("/Test05_2")) viewPage += "/test05_2.jsp";
		else if(com.equals("/Test05_3")) viewPage += "/test05_3.jsp";
		else if(com.equals("/Test05_4")) viewPage += "/test05_4.jsp";
		else if(com.equals("/Test05_5")) {
			int su1 = request.getParameter("su1") == null ? 0 : Integer.parseInt(request.getParameter("su1"));
			int su2 = request.getParameter("su2") == null ? 0 : Integer.parseInt(request.getParameter("su2"));
			String op = request.getParameter("op") == null ? "%" :request.getParameter("op");

			Test05Service t5 = new Test05Service();
			int res = t5.test5Calc(su1, su2, op);

			request.setAttribute("su1", su1);
			request.setAttribute("su2", su2);
			request.setAttribute("op", op);
			request.setAttribute("res", res);

			viewPage += "/test05_5.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
