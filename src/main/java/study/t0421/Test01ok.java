package study.t0421;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0421/test01ok")
public class Test01ok extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		/*
//		String mid = request.getParameter("mid");
		String mid="";
		if(request.getParameter("mid") != null) mid=request.getParameter("mid");


		String name = request.getParameter("name");

//		if(mid.equals("admin")) {
		if(request.getParameter("mid").equals("admin")) {
			System.out.println("관리자 로그인 했습니다.");
		}
		else {
			System.out.println("방문객입니다.");
		}
		*/

		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String job = request.getParameter("job") == null ? "" : request.getParameter("name");

		System.out.println("mid: "+mid);
		System.out.println("name: "+name);
		System.out.println("job: "+job);

		request.setAttribute("mid", mid);
		request.setAttribute("name", name);
		request.setAttribute("job", job);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0421/test01Res.jsp");
		dispatcher.forward(request, response);
	}
}
