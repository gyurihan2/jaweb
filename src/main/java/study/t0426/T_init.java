package study.t0426;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("") web.xml설정
public class T_init extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service() 입니다.");
		
//		web.xml파일에 저장된 값 저장
		String logoName = getServletContext().getInitParameter("logiName");
		String homeAdderss = getServletContext().getInitParameter("homeAddress");
		
		System.out.println("logoName: " + logoName);
		System.out.println("homeAdderss: " + homeAdderss);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("logoName", logoName);
		session.setAttribute("homeAdderss", homeAdderss);
		
		String viewPage = "/study/0426/t_initRes.jsp";
		
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
}
