package study2;

public class EncDec {

	public String passEnc(int keyIdx,String pwd) {
		
		PassDAO dao = new PassDAO();
		String keyStrTmp = dao.getKey(keyIdx);
		String key="";
		for(int i=0; i<keyStrTmp.length(); i++) {
			key += Integer.toHexString(keyStrTmp.charAt(i));
		}

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
		
		
		long encPwd =  intPwd ^ Long.parseLong(key);
		
		// 암호화된 값 문자열로 전환
		strPwd= String.valueOf(encPwd); 
		
		return strPwd;
	}
}
