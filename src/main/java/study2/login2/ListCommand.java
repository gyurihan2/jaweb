package study2.login2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ListCommand implements LoginInterface {

	LoginDAO dao = new LoginDAO();
	LoginVO vo;
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		ArrayList<LoginVO> vos = dao.getLoginList();
		request.setAttribute("vos", vos);

	}

}
