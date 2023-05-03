package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PassOk1Command implements StudyIngerface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd").toUpperCase();
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		System.out.println("==== 원본 자료 ====");
		System.out.println("mid: "+ mid);
		System.out.println("pwd"+ pwd);
		System.out.println("idx: "+ idx);
		
		if(idx == 1) {
			//숫자만 넘오 올경우
			//암호화를 위한 키 설정(0x1234ABCD) 16진수
			int key = 0x1324ABCD;
			int encPwd, decPwd;
			
			//암호화 EOR : ^
			encPwd = Integer.parseInt(pwd)^key;
			System.out.println("==== 암호화된 자료 ====");
			System.out.println("encPwd: "+ encPwd);
			System.out.println("암호화된 비밀번호를 DB에 저장시킨후.... 인증을 위해 다시 불러와서 복호화 한다.~~~~~~~~~~");
			
			decPwd = encPwd^key;
			System.out.println("==== 복호화된 자료 ====");
			System.out.println("decPwd: "+ decPwd);
			
		}
		else {
			// 혼합.. (영문 소문자 입력시에는 대문자로 변경해서 처리)
			long intPwd;
			String strPwd="";
			
			for(int i=0; i<pwd.length();i++) {
				intPwd = pwd.charAt(i);  //변수값이 클수도있음
				strPwd += intPwd;
			}
			System.out.println("아스키코드로 변환된 비밀번호: " + strPwd );
			
			intPwd = Long.parseLong(strPwd);
			
			long encPwd;
			long key = 0x1234ABCD;
			 
			encPwd =  intPwd ^ key;
			strPwd= String.valueOf(encPwd); //디비 저장시 값이(long) 커서 문자화 시켜 저장
			System.out.println("암호화된 비밀번호: " + strPwd);
			
			//DB에 저장된 암호를 다시 불러와서 복화화
			long decPwd;
			intPwd = Long.parseLong(strPwd);
			decPwd = intPwd^key;
			System.out.println("복호화된 아스키코드: "+decPwd);
			
			//복원된 비밀번호를(아스키코드) 문자화 
			strPwd = String.valueOf(decPwd);
			
			char ch;
			String res="";
			for(int i=0; i<strPwd.length(); i+=2) {
				ch = (char)Integer.parseInt(strPwd.substring(i, i+2));
				res += ch;
			}
			System.out.println("복호화된 아스키코드를 문자화 결과: " + res);
		}
	}

}
