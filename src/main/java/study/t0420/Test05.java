package study.t0420;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0420/test05")
public class Test05 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String[] suStr= request.getParameterValues("su");
		int[] su = new int[suStr.length];
		
		for(int i=0;i<suStr.length;i++) {
			su[i] = Integer.parseInt(suStr[i]);
		}
		
		Arrays.sort(su);
		
		for(int i=0; i<su.length;i++) {
			System.out.println(su[i]);
		}
		
		request.setAttribute("su", su);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test05res.jsp");
		dispatcher.forward(request, response);
	}
}
