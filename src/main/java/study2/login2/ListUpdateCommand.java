package study2.login2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class ListUpdateCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoginDAO dao = new LoginDAO();

		String mid = (String)session.getAttribute("sMid");
		LoginVO vo = dao.getMidCheck(mid);

		request.setAttribute("vo", vo);

	}

}
