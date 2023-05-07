package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PassLoginOkCommand implements StudyIngerface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd").toUpperCase();

		PassDAO dao = new PassDAO();
		PassVO vo = dao.getPassUser(mid);

		EncDec test = new EncDec();
		String chkPass = test.passEnc(vo.getKeyIdx(), pwd);

		//입력한 값을 암호화한 값과 DB에 저장된 암호화 값이 일치 하는경우
		if(vo.getEncPwd().equals(chkPass)) {
			System.out.println("============ 통 과 ===============");
			//패스워드 업데이트 진행
			// 암호화 키 선택
			int keyCnt = dao.getkeyCnt();
			int keyIdx = (int)(Math.random()*keyCnt)+1;

			// 랜덤으로 받은 keyIdx로 다시 암호화하여 저장
			String newPass = test.passEnc(keyIdx, pwd);

			int res = dao.setPassUpdate(keyIdx,newPass,mid);

			if(res == 1) {
				System.out.println("입력값(암호화): " + chkPass);
				System.out.println("DB에저장된 값: " + vo.getEncPwd());
				System.out.println("새로 DB에저장된 값: " + newPass);
				request.setAttribute("msg", "통과.");
				request.setAttribute("url", request.getContextPath()+"/Password.st");
			}
			else {
				System.out.println("DB에저장된 값: " + vo.getEncPwd());
				System.out.println("입력값(암호화): " + chkPass);
				request.setAttribute("msg", "통과했지만 update안됨");
				request.setAttribute("url", request.getContextPath()+"/Password.st");
			}
		}
		else {
			System.out.println("============ 차 단 ===============");
			System.out.println("DB에저장된 값: " + vo.getEncPwd());
			System.out.println("입력값(암호화): " + chkPass);
			request.setAttribute("msg", "차단");
			request.setAttribute("url", request.getContextPath()+"/Password.st");
		}

	}

}
