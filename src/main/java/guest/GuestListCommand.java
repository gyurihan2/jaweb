package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		
		
		// 1. 현재 페이지 번호를 구한다.
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// 2. 한페이지 분량을 결정한다.
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));;
		
		//3. Record 건수
		int totRecCnt = dao.getTotRecCnt();
		
		//4. 총 페이지 건수를 구한다.
		int totPage = (totRecCnt % pageSize)== 0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
		
		//5. 현재 페이지의 시작 인텍스번호를 구한다.
		int startIndexNo = (pag-1)*pageSize;
		
		//6. 현재 화면에 표시할 시작 번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;
		
		
		//블록 페이징 처리 블록의 시작번호는 0부터
		
		// 1.블록의 크기를 결정
		int blockSize=5;
		
		//2. 현재페이지가 속한 블록 번호를 구한다.(ex: 1~3page : 0block, 4~6 : 1block)
		int curBlock = (pag-1) / blockSize;
		
		//3 마지막 블록을 구한다.
		int lastBlock = (totPage-1)/blockSize;
		
		
		
		
		
		//지정된 페이지의 자료를 요청한 한페이지 분량을 가져온다
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo,pageSize);
		request.setAttribute("vos", vos);
		
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("blockSize", blockSize);
		
	}

}
