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
		
		long key = dao.getKey(keyIdx);
		
		// 비밀번호 암호화
		long intPwd;
		String strPwd="";
		
		//비밀번호를 아스키코드로 변환 (문자열로 저장)
		for(int i=0; i<pwd.length();i++) {
			intPwd = pwd.charAt(i);  
			strPwd += intPwd;
		}
		
		// 문자열로 저장된 아스키 코드를 int로 변환 및 암호화
		intPwd = Long.parseLong(strPwd);
		long encPwd =  intPwd ^ key;
		
		// 암호화된 값 문자열로 전환
		strPwd= String.valueOf(encPwd); 
		System.out.println(strPwd);
		System.out.println("키 IDX: " + keyIdx +" / 암호화 키: " + key);
		
		//DB저장
		int res = dao.inputData(mid,strPwd,keyIdx);
		
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
