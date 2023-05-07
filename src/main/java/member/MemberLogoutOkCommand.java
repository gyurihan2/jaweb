package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sMid = (String)session.getAttribute("sMid");

		if(sMid != null) {
			session.removeAttribute("sMid");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			request.setAttribute("msg", sMid+"님 로그아웃 되었습니다.");
		}
		else{
			request.setAttribute("msg", "잘못된 접근입니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
		}
	}

}
