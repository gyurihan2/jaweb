package study.t0424;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0424/test01ok")
public class Test01ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * request.setCharacterEncoding("utf-8");
		 * response.setContentType("text/html; charset=utf-8");
		 */
		//한글처리를 필터에서 처리하게되면 2줄 생략가능
		
		// Null 체크...
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		
		// DB에 삽입 처리....하고자 한다면 입력받은 변수의 값을 vo에 담아서 처리한다.
		Test01VO vo = new Test01VO();
		
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setJob(job);
		vo.setAddress(address);
		
		// vo에 담긴 자료를 DB에 저장하는 작업처리가 일어난다.
		
		// 처리된 자료들을 view에 보여주기위해서는 저장소(request)에 담아서 넘겨준다.
		request.setAttribute("vo", vo);
		
		System.out.println(vo.getName());
		
		String viewPage = "/study/0424/test01Res.jsp";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
