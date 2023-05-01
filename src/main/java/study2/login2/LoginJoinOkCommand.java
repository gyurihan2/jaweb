package study2.login2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

public class LoginJoinOkCommand implements LoginInterface {

	LoginDAO dao = new LoginDAO();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo2 = dao.getMidCheck(mid);
		
		
		String msg ="",url=""; 
		if(vo2.getMid() != null) {
			// 아이디가 중복되었음.
			msg = "아이디가 중복 되었습니다.";
			url = "/Join.aa";
		}
		else {
			// 아이디가 중복되어 있지 않기에 DB에 정보를 저장시킨다.
			dao.setJoinOk(vo);
			msg = "회원 가입되었습니다.";
			url = "/Login.aa";
			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", request.getContextPath()+url);

	}

}
