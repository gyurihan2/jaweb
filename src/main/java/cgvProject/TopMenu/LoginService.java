package cgvProject.TopMenu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TopMenuService")
public class LoginService extends HttpServlet{
	private UserVO vo;
	private TopMenuDAO dao = new TopMenuDAO();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html ;charset=utf-8");
		String mid = request.getParameter("mid") == null ? "" :  request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" :  request.getParameter("pwd");
		
		vo = dao.login(mid, pwd);
		PrintWriter out = response.getWriter();
		
		if(vo == null) {
			out.print("<script>");
			out.print("alert('아이디 비밀번호를 확인하세요');");
			out.print("location.href='/javaweb/cgvProject/homePage/login.jsp';");
			out.print("</script>");
		}
		else {
			System.out.println(vo.getMid());
			request.setAttribute("mid", vo.getMid());
			request.setAttribute("name", vo.getName());
			
			System.out.println("테스트: "+vo.getName());
			
			String viewPage="/cgvProject/homePage/home.jsp";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);	
		}
		
		
	}
}
