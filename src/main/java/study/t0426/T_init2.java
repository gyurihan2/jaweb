package study.t0426;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns="/0426/t_init2",initParams= {@WebInitParam(name="iMid",value="admin"),@WebInitParam(name="iPwd",value="4321")})
public class T_init2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service() 입니다.");

		getInitParameter("iMid");
//		System.out.println("logoName: " + logoName);
//		System.out.println("homeAdderss: " + homeAdderss);

		HttpSession session = request.getSession();
		session.setAttribute("iMid",getInitParameter("iMid"));
		session.setAttribute("iPwd",getInitParameter("iPwd"));

//		session.setAttribute("logoName", logoName);
//		session.setAttribute("homeAdderss", homeAdderss);

		String viewPage = "/study/0426/t_initRes2.jsp";

		request.getRequestDispatcher(viewPage).forward(request, response);
//		response.sendRedirect("/javaweb"+viewPage);

	}
}
