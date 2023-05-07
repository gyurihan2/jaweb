package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.mem")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage="/WEB-INF/member";

		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));

		// 로그인 페이지
		if(com.equals("/MemberLogin")) {
			viewPage += "/memberLogin.jsp";
		}
		//로그인 처리
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		//로그아웃 처리
		else if(com.equals("/MemberLogoutOk")) {
			command = new MemberLogoutOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		//아이디 찾기 페이지
		else if(com.equals("/MemberMidSearch")) {
			viewPage += "/memberMidSearch.jsp";
		}
		// 아이디 찾기 처리
		else if(com.equals("/MemberSearchOk")) {
			command = new MemberSearchOkCommand();
			command.execute(request, response);
			viewPage += "/memberMidSearch.jsp?res=1";
		}
		//회원가입 페이지
		if(com.equals("/MemberJoin")) {
			viewPage += "/memberJoin.jsp";
		}
		// 회원 가입 처리
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 아이디 중복 체크(회원가입 페이지)
		else if(com.equals("/MemberIdCheck")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			viewPage += "/memberIdCheck.jsp";
		}
		//닉네임 중복 체크
		else if(com.equals("/MemberNickNameCheck")) {
			command = new MemberNickNameCheckCommand();
			command.execute(request, response);
			viewPage += "/memberNickNameCheck.jsp";
		}
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "/memberList.jsp";
		}
		else if(com.equals("/TestPage")) {
			viewPage += "/testPage.jsp";
		}


		request.getRequestDispatcher(viewPage).forward(request, response);

	}
}