package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test01")
public class Test01Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은....서블릿의 /mapping/Test01입니다.");

		// 					/WEB-INF/study2/mapping/test01.jsp
		String viewPage = "/WEB-INF/study2/mapping/test01.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
