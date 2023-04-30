package cgvProject.TopMenu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cgvProject/signService")
public class SignService extends HttpServlet{
	LoginVO vo;
	TopMenuDAO dao=new TopMenuDAO();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid= request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd"); // 2개가 넘어옴 나중에 처리 필요
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String[] identiNums = request.getParameterValues("identiNum");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String[] phones = request.getParameterValues("phone");
		String address = request.getParameter("address") == null ? "" : request.getParameter("address");
		PrintWriter out = response.getWriter();
		
		vo = new LoginVO();
		
		try {
			vo.setMid(mid);
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setIdentiNum(identiNums[0]+"-"+identiNums[1]);
			vo.setEmail(email);
			vo.setPhone(phones[0]+"-"+phones[1]+"-"+phones[2]);
			vo.setAddress(address);
			
		}catch (NullPointerException e) {
			System.out.println("회원가입 Nullpoint 오류 : " + e.getMessage());
			out.print("<script>");
			out.print("alert('입력값을 확인하세요');");
			out.print("location.href='"+request.getContextPath()+"/cgvProject/homePage/signUp.jsp';");
			out.print("</script>");
		}
		
		if(dao.setSignUp(vo) > 0) {
			out.print("<script>");
			out.print("alert('회원가입 완료되었습니다');");
			out.print("location.href='"+request.getContextPath()+"/cgvProject/homePage/home.jsp';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('회원가입이 불가능합니다.(다시 가입하시거나 관리자에게 문의하세요)');");
			out.print("location.href='"+request.getContextPath()+"/cgvProject/homePage/home.jsp';");
			out.print("</script>");
		}
		
	}
}
