package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoginDAO dao = new LoginDAO();

		String mid = (String)session.getAttribute("sMid");

		dao.setDeleteOk(mid);

		request.setAttribute("msg", "탈퇴처리되었습니다.");
		request.setAttribute("url", request.getContextPath()+"/Login.re");

	}

}
