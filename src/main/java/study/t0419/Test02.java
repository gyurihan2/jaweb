package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Test02 extends HttpServlet {
	//web.xml 매핑 필요
	//Form 태그에서 받은 값을 받는 기본 폼(예전 방법)
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		// 브라우저에 출력
		PrintWriter out = response.getWriter();
		out.println("서블릿에서의 출력입니다.<br/>");
		out.println("Welcome to Servlet!!!<br/>");
	}
}
