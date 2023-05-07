package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberSearchOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");

		MemberDAO dao = new MemberDAO();

		String mid = dao.getMemberMidSearch(name,email);

		if(mid != null) {
			request.setAttribute("rMid", mid);
		}

	}

}
