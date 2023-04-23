package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0420/test07ok")
public class Test07ok extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name"); 
		String part = request.getParameter("part"); 
		String[] products = request.getParameterValues("product"); 
		String[] prices = request.getParameterValues("price"); 
		String[] sus = request.getParameterValues("su"); 
		int totalPrice = 0;
		
		int [] res = new int[products.length];
		
		System.out.println("작성자: " + name);
		System.out.println("구분: " + part);
		
		for(int i=0; i<res.length; i++) {
			res[i] = Integer.parseInt(sus[i])*Integer.parseInt(prices[i]);
			totalPrice += res[i];
			
			System.out.print((i+1)+".상품명:" + products[i] + "\t");
			System.out.print("가격 "+prices[i] + "\t");
			System.out.print("수량 "+sus[i] + "\t");
			System.out.print("총 합계  "+res[i] + "\n");
		}
		System.out.println("총 합계: "+ totalPrice);
		
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('작업완료"+request.getContextPath()+"');");
		out.print("location.href= '"+request.getContextPath()+"/study/0420/test07.jsp';");
		out.print("</script>");
		
		
	
	}
}
