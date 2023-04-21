package study.t0421;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0421/Loginok")
public class Loginok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/utf-8; charset=utf-8");
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String member = new String();
		
		System.out.println(mid);
		System.out.println(pwd);
		//회원 인증: admin, hkd1234 비밀번호 1234
		if((!mid.equals("admin")&&!pwd.equals("1234") )|| (!mid.equals("hkd1234")&&!pwd.equals("1234"))) {
			System.out.println("비회원입니다.");
			member="no";
		}
		else {
			System.out.println("정회원입니다.");
			member="ok";
		}
		
		
		response.sendRedirect(request.getContextPath() + "/study/0421include/main.jsp?member="+member);
	}
}
