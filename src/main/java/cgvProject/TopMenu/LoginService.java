package cgvProject.TopMenu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginService extends HttpServlet{
	private LoginVO vo;
	private TopMenuDAO dao = new TopMenuDAO();
	HttpSession session;

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

			for (Cookie element : cookies) {
				if(element.getName().equals("cRemeberMid")){
					element.setMaxAge(0);
					response.addCookie(element);
					System.out.println("쿠키 기본 경로" + element.getPath());
				}
				else if(element.getName().equals("cMid")) {
					element.setMaxAge(0);
					response.addCookie(element);
				}
			}
		}

		vo = dao.login(mid, pwd);
		PrintWriter out = response.getWriter();

		session = request.getSession();


		// 로그인 되었을경우 Session  생성
		if(vo == null) {
			int loginCnt = session.getAttribute("sLoginCnt") == null ? 0 : (int)session.getAttribute("sLoginCnt");
			session.setAttribute("sLoginCnt", loginCnt+1);

			out.print("<script>");

			if(loginCnt+1 >= 5) out.print("alert('아이디 비밀번호를 5회 이상 틀렸습니다');");
			else out.print("alert('아이디 비밀번호를 확인하세요');");

			out.print("location.href='/javaweb/cgvProject/homePage/login.jsp';");
			out.print("</script>");
		}
		else {
			session.setAttribute("sMid", vo.getMid());
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sLoginCnt", 0);
			String viewPage= request.getContextPath()+"/cgvProject/homePage/home.jsp";
			out.print("<script>");
			out.print("alert('"+vo.getMid()+"님이 로그인 하셨습니다.');");
			out.print("location.href='"+viewPage+"';");
			out.print("</script>");
		}


	}
	@Override
	public void destroy() {
		if(session != null) session.invalidate();
	}
}