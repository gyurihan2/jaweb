package study.t0427;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/0427/ex1Save")
public class Ex1Save extends HttpServlet{
	public static List<String[]> vos = new ArrayList<>();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imgName = request.getParameter("imgName") == null ? "" : request.getParameter("imgName");
		String paintName = request.getParameter("paintName") == null ? "" : request.getParameter("paintName");
		
		
		PrintWriter out = response.getWriter();
		if(imgName.equals("") || paintName.equals("")) {
			out.print("<script>");
			out.print("alert('입력값을 확인하세요');");
			out.print("location.href='"+request.getContextPath()+"/study/0427/jstl_Ex1.jsp'");
			out.print("</script>");
		}
		else {
			HttpSession session = request.getSession();
			
			System.out.println("세션 시작"+session.getAttribute("savePaint"));
			if(session.getAttribute("savePaint") == null) {
				session.setAttribute("savePaint", vos);
				vos.clear();
			}
			String[] savePaint = {imgName,paintName};
			vos.add(savePaint);
			
		}
		out.print("<script>");
		out.print("alert('값이 저장되었습니다');");
		out.print("location.href='"+request.getContextPath()+"/study/0427/jstl_Ex1.jsp'");
		out.print("</script>");
	}
}
