package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PassInputOkCommand implements StudyIngerface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd").toUpperCase();

		PassDAO dao = new PassDAO();

		// 암호화 키 선택
		int keyCnt = dao.getkeyCnt();
		int keyIdx = (int)(Math.random()*keyCnt)+1;

		// 암호화 처리
		EncDec test = new EncDec();
		String strPwd = test.passEnc(keyIdx, pwd);

		//DB저장
		int res = dao.inputData(mid,strPwd,keyIdx,pwd);

		if(res==1) {
			request.setAttribute("msg", "저장되었습니다");
			request.setAttribute("url", request.getContextPath()+"/Password.st");
		}
		else {
			request.setAttribute("msg", "저장실패");
			request.setAttribute("url", request.getContextPath()+"/Password.st");
		}

	}

}
