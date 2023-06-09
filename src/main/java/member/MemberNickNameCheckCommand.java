package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberNickNameCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");

		MemberDAO dao = new MemberDAO();

		int res = dao.getMemberNickNameCheck(nickName.trim());

		if(res == 0) {
			request.setAttribute("res", 1);	// 사용 가능한 아이디.
		}
		else {
			request.setAttribute("res", 0);	// 이미 사용중인 아이디.
		}
		request.setAttribute("nickName", nickName);
	}
}
