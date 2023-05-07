package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test04")
public class Test04Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 서블릿 /mapping/Test04 입니다.");

		int su1 = request.getParameter("su1") == null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2") == null ? 0 : Integer.parseInt(request.getParameter("su2"));

		Test04Service t4 = new Test04Service(su1, su2);
		int hap = t4.test4Calc();
		int cha = t4.test4cha();

		request.setAttribute("hap", hap);
		request.setAttribute("cha", cha);



		String viewPage="/WEB-INF/study2/mapping/test01.jsp";

		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
