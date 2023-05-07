package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave") == null ? "off" : request.getParameter("idSave");

		MemberDAO dao = new MemberDAO();

		int res = dao.getMemberLogin(mid, pwd);

		if(res == 1) {
			request.setAttribute("msg", mid+"님 로그인 되었습니다. ");
			request.setAttribute("url", request.getContextPath()+"/TestPage.mem");

			// 로그인 유지를 위한 세션 처리
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);

		}
		else {
			request.setAttribute("msg", "아이디 또는 비밀번호를 확인하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
		}

		//아이디 기억 쿠키 처리
		if(idSave.equals("on")) {
			Cookie cSaveMid = new Cookie("cSaveMid","1");
			Cookie cMid = new Cookie("cMid",mid);

			cSaveMid.setMaxAge(60*60*24*30);
			cMid.setMaxAge(60*60*24*30);

			cSaveMid.setPath(request.getContextPath());
			cMid.setPath(request.getContextPath());

			response.addCookie(cSaveMid);
			response.addCookie(cMid);
		}
		else {
			Cookie[] cookies = request.getCookies();
			int cCnt=0; // 생성된 쿠키값 카운트

			for (Cookie element : cookies) {
				String cookieName = element.getName();

				if(cookieName.equals("cSaveMid")) {
					element.setMaxAge(0);
					response.addCookie(element);
					cCnt++;
				}
				else if(cookieName.equals("cMid")) {
					element.setMaxAge(0);
					response.addCookie(element);
					cCnt++;
				}

				if(cCnt==2) break;

			}
		}
	}

}
