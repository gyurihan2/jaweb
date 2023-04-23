package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0420/test03ok2")
public class Test03ok2 extends HttpServlet{

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
		String context= request.getContextPath()+"/study/0420/test03.jsp";
		System.out.println("이름: " + name);
		System.out.println("나이: " + age);
		System.out.println("성별: " + gender);
		System.out.println("취미: " + str);
		
		out.print("<script>");
		out.print("alert('완료');");
		out.print("location.href='"+context+"'");
		out.print("</script>");
		
	}
}
