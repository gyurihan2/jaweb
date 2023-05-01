package study2.login2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ListUpdateOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String mid = (String) session.getAttribute("sMid");

		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setName(name);
		vo.setPwd(pwd);
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setUpdateOk(vo);
		
		if(res == 1) {
			session.setAttribute("sName", name);
			request.setAttribute("msg", "회원정보 수정 완료");
			request.setAttribute("url", request.getContextPath()+"/MemberMain.aa");
			
		}
		else {
			request.setAttribute("msg", "회원정보 수정 실패");
			request.setAttribute("url", request.getContextPath()+"/Update.aa");
			
		}
	}

}
