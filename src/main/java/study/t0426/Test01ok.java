package study.t0426;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/0426/test01ok")
public class Test01ok extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doGet()입니다.");

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		System.out.println("title(doGet): " + title);
		System.out.println("content(doGet): " + content);

		request.setAttribute("title", title);
		request.setAttribute("content", content);
		String viewPage="/study/0426/test01Res.jsp";

		request.getRequestDispatcher(viewPage).forward(request, response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doPost()입니다.");

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		System.out.println("title(doPost): " + title);
		System.out.println("content(doPost): " + content);
		doGet(request, response);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service()입니다.");
		doPost(request,response);
	}

	@Override
	public void init() throws ServletException {
		System.out.println("이곳은 init()입니다.");
	}

	@Override
	public void destroy() {
		System.out.println("이곳은 destroy()입니다.");
	}
}
