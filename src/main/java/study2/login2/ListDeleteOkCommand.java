package study2.login2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListDeleteOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoginDAO dao = new LoginDAO();
		
		String mid = (String)session.getAttribute("sMid");
		
		int res = dao.setDeleteOk(mid);
		
		if(res == 1) {
			
			request.setAttribute("msg", "탈퇴 완료");
			request.setAttribute("url", request.getContextPath()+"/Logout.aa");	
		}
		else {
			request.setAttribute("msg", "탈퇴 실패");
			request.setAttribute("url", request.getContextPath()+"/Update.aa");		
		}

	}

}
