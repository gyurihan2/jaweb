package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0420/test04ok")
public class Test04ok extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] hobbys= request.getParameterValues("hobby");
		
		String str="";
		
		for(String i : hobbys){
			str += i+", ";
		}
		str = str.substring(0,str.length()-2);
//		String path= request.getContextPath()+"/study/0420/test04Res.jsp";
		System.out.println("이름: " + name);
		System.out.println("나이: " + age);
		System.out.println("성별: " + gender);
		System.out.println("취미: " + str);
		
		
		String hostIp = request.getParameter("hostIp");
		//request 저장소
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("gender", gender);
		request.setAttribute("str", str);
		request.setAttribute("hostIp", hostIp);
		
//		처리 후 view로 이동
		// 경로를 다른곳(직렬화 X)
//		response.sendRedirect(path);
		//직렬화
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test04Res.jsp");
		dispatcher.forward(request, response);
	}
}
