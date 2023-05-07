package study2.login2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginSearchCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");

		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getMidCheck(mid);

		if(vo != null) request.setAttribute("loginsearchVo", vo);
		else {
			request.setAttribute("url", request.getContextPath()+"/MemberMain.aa");
			request.setAttribute("msg", "검색하신 ID: "+request.getParameter("mid")+"가 없습니다.");
		}



	}

}
