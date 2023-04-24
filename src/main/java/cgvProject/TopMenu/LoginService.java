package cgvProject.TopMenu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginService extends HttpServlet{
	private UserVO vo;
	private TopMenuDAO dao = new TopMenuDAO();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" :  request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" :  request.getParameter("pwd");
		String rememberMid = request.getParameter("rememberMid") == null ? "" : request.getParameter("rememberMid");
		
		//아이디 기억 체크가 되어있을경우 쿠키 생성
		if(rememberMid.equals("1")) {
			Cookie cRememberMid = new Cookie("cRemeberMid",rememberMid);
			Cookie cMid = new Cookie("cMid",mid);
			
			cRememberMid.setMaxAge(60*60*24*31);
			cMid.setMaxAge(60*60*24*31);
			response.addCookie(cRememberMid);
			response.addCookie(cMid);
			
		}
		else{
			Cookie[] cookies = request.getCookies();

			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("cRemeberMid")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);	
				}
				else if(cookies[i].getName().equals("cMid")) {
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		}
		
		vo = dao.login(mid, pwd);
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();

		
		// 로그인 되었을경우 Session  생성
		if(vo == null) {
			out.print("<script>");
			out.print("alert('아이디 비밀번호를 확인하세요');");
			out.print("location.href='/javaweb/cgvProject/homePage/login.jsp';");
			out.print("</script>");
		}
		else {
			session.setAttribute("sMid", vo.getMid());
			session.setAttribute("sPwd", vo.getName());
			
			
			String viewPage= request.getContextPath()+"/cgvProject/homePage/home.jsp";
			out.print("<script>");
			out.print("alert('"+vo.getMid()+"님이 로그인 하셨습니다.');");
			out.print("location.href='"+viewPage+"';");
			out.print("</script>");
				
		}
		
		
	}
}
