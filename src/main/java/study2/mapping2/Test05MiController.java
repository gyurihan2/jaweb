package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.mi")
public class Test05MiController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test05MiInterface command = null;
		String viewPage="/WEB-INF/study2/mapping2";


		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));



		if(com.equals("/Test05")) {
			viewPage += "/test05.jsp";
		}
		else if(com.equals("/Test05_1")) viewPage += "/test05_1.jsp";
		else if(com.equals("/Test05_2")) viewPage += "/test05_2.jsp";
		else if(com.equals("/Test05_3")) {

			command  = new Test05DanCommand();
			command.execute(request, response);
			viewPage += "/test05_3.jsp";
		}
		else if(com.equals("/Test05_4")) {
			command  = new Test05MsgCommand();
			command.execute(request, response);
			viewPage += "/test05_4.jsp";
		}
		else if(com.equals("/Test05_5")) {
			command = new Test05MiCommand();
			command.execute(request, response);
			viewPage += "/test05_5.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
