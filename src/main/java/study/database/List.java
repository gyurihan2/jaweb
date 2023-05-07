package study.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/database/List")
public class List extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();

		//1. 현재 페이지
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));

		//2. 페이지에 출력할 레코드의 수(default : 5)
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));

		//3. 전체 Record 건수
		int totRecCnt = dao.getListCnt();

		//4. 총 페이지를 구한다.
		int totPage = (totRecCnt % pageSize)== 0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;

		//5. 현재 페이지의 시작 레코드 인텍스번호를 구한다.
		int startIndexNo = (pag-1)*pageSize;

		//6. 현재 화면에 표시할 시작 번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;




		int blockSize=5;

		//2. 현재페이지가 속한 블록 번호를 구한다.(ex: 1~3page : 0block, 4~6 : 1block)
		int curBlock = (pag-1) / blockSize;

		//3 마지막 블록을 구한다.
		int lastBlock = (totPage-1)/blockSize;


		ArrayList<LoginVO> vos = dao.getLoginList(startIndexNo,pageSize);
		request.setAttribute("vos", vos);

		request.setAttribute("pag", pag); // 현재 페이지
		request.setAttribute("totPage", totPage); // 총 페이지
		request.setAttribute("pageSize", pageSize); // 한페이지에 표시할 레코드수
		request.setAttribute("curScrStartNo", curScrStartNo); // 현재 화면에 표시할 시작 번호를 구한다.

		request.setAttribute("blockSize", blockSize); // 블록 사이즈
		request.setAttribute("curBlock", curBlock); // 현재 블록 위치
		request.setAttribute("lastBlock", lastBlock); // 마지막 블록 위치

		String viewPage = "/study/0428_database/memberList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
