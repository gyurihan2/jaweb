package study2.login2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.aa")
public class LoginController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginInterface command = null;

		String viewPage = "/WEB-INF/study2/login2";
		String com= request.getRequestURI();

		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));

		if(com.equals("/Login")) {
			viewPage += "/login.jsp";
		}
		else if(com.equals("/Join")) {
			viewPage += "/join.jsp";
		}
		else if(com.equals("/JoinOk")) {
			command = new LoginJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/LoginOk")) {
			command = new LoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberMain")) {

			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/Logout")) {
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		//회원 전체 조회
		else if(com.equals("/List")) {
			command = new ListCommand();
			command.execute(request, response);
			viewPage += "/memberList.jsp";
		}
		//회원 개별 조회
		else if(com.equals("/LoginSearch")) {
			command = new LoginSearchCommand();
			command.execute(request, response);

			if(request.getAttribute("loginsearchVo") != null) viewPage +="/memberSearch.jsp";
			else viewPage = "/include/message.jsp";

		}
		//회원 수정창
		else if(com.equals("/Update")) {
			command = new ListUpdateCommand();
			command.execute(request, response);
			viewPage += "/update.jsp";
		}
		else if(com.equals("/UpdateOk")) {
			command = new ListUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		//회원 삭제
		else if(com.equals("/DeleteOk")) {
			command = new ListDeleteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}

		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
