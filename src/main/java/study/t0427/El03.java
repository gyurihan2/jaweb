package study.t0427;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0427/el03")
public class El03 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		El03VO vo = new El03VO();
		
		List<El03VO> vos = new ArrayList<>();
		
		vo.setName("홍길동");
		vo.setAddress("청주");
		vo.setAge(20);
		vo.setGender("남자");
		vo.setJob("학생");
		vos.add(vo);
		
		vo = new El03VO();
		vo.setName("김말숙");
		vo.setAddress("서울");
		vo.setAge(22);
		vo.setGender("여자");
		vo.setJob("대학생");
		vos.add(vo);
		
		vo = new El03VO();
		vo.setName("이기자");
		vo.setAddress("청주");
		vo.setAge(30);
		vo.setGender("남자");
		vo.setJob("교사");
		vos.add(vo);
		
		System.out.println("vos의 자료들");
		
		for(int i=0; i<vos.size();i++) {
			System.out.print("vos["+i+"]: " + vos.get(i).getName()+"/");
			System.out.print("vos["+i+"]: " + vos.get(i).getAddress()+"/");
			System.out.print("vos["+i+"]: " + vos.get(i).getAge()+"/");
			System.out.print("vos["+i+"]: " + vos.get(i).getGender()+"/");
			System.out.print("vos["+i+"]: " + vos.get(i).getJob()+"/");
			System.out.println();
		}
		
		request.setAttribute("vos", vos);
		String viewPage ="/study/0427/el03Res.jsp";
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
