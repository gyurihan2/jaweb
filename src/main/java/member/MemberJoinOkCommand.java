package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");

		String[] pwds = request.getParameterValues("pwd");

		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");

		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String email1 = request.getParameter("email1") == null ? "" : request.getParameter("email1");
		String email2 = request.getParameter("email2") == null ? "" : request.getParameter("email2");

		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday") == null ? "" : request.getParameter("birthday");

		String tel1 = request.getParameter("tel1") == null ? "": request.getParameter("tel1");
		String tel2 = request.getParameter("tel2") == null ? "": request.getParameter("tel2");
		String tel3 = request.getParameter("tel3") == null ? "": request.getParameter("tel3");

		// 주소
		String postcode= request.getParameter("postcode") == null ? "" : request.getParameter("postcode");
		String roadAddress= request.getParameter("roadAddress") == null ? "" : request.getParameter("roadAddress");
		String detailAddress= request.getParameter("detailAddress") == null ? "" : request.getParameter("detailAddress");
		String extraAddress= request.getParameter("extraAddress") == null ? "" : request.getParameter("extraAddress");

		String homePage = request.getParameter("homePage") == null ? "" : request.getParameter("homePage");
		String job =  request.getParameter("job") == null ? "" : request.getParameter("job");

		String[] hobbys= request.getParameterValues("hobby");

		String content = request.getParameter("content") == null ? "" :  request.getParameter("content");
		String userInfor = request.getParameter("userInfor") == null ? "" :  request.getParameter("userInfor");

		String fName = request.getParameter("fName") == "" ? "noimage.jpg" :  request.getParameter("fName");

		// 입력값 vo 저장
		MemberVO vo = new MemberVO();
		vo.setMid(mid);

		if(pwds[0].equals(pwds[1])) vo.setPwd(pwds[0]);

		vo.setNickName(nickName);
		vo.setName(name);
		vo.setEmail(email1+"@"+email2);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel1+"-"+tel2+"-"+tel3);
		// 우편번호 / 주소 / 상세주소 / 참고항목 구분자 '/'
		vo.setAddress(postcode+"/"+roadAddress+"/"+detailAddress+"/"+extraAddress);
		vo.setHomePage(homePage);
		vo.setJob(job);

		String hobby="";
		for(int i=0; i<hobbys.length ; i++) {
			if(hobbys[i] != null)  {
				//구분자 '/'
				hobby += hobbys[i]+"/";

				// i 값이 마지막일경우 vo에 값 저장
				if(i==hobbys.length-1) vo.setHobby(hobby.substring(0, hobby.length()-1));
			}

		}
		vo.setContent(content);
		vo.setUserInfor(userInfor);

		vo.setPhoto(fName);
		System.out.println("photo: " +fName );
		System.out.println(vo);
		MemberDAO dao = new MemberDAO();

		int res = dao.setMemberCreate(vo);
		if(res == 1 ) {
			request.setAttribute("msg", "계정 생성되었습니다.");
		}
		else {
			request.setAttribute("msg", "계정 생성 실패.");
		}

		request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");

	}

}
