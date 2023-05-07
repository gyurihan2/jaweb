package study.t0427;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0427/el2Ok")
public class El2Ok extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewPage = "/study/0427/el2.jsp";

		String[] hobbys = request.getParameterValues("hobby");
		String name = request.getParameter("name");

		System.out.println("name: " + name);
		System.out.println("hobbys: " + hobbys);

		for(String i : hobbys) System.out.println(i);

		request.setAttribute("hobbys", hobbys);
		request.setAttribute("name", name);

		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
