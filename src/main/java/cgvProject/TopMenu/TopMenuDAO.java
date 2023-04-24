package cgvProject.TopMenu;

public class TopMenuDAO {
	private UserVO vo;
	private String[][] user = {{"admin","1234","관리자"},{"test","test","user"}};
	
	public UserVO login(String mid, String pwd) {
		vo = null;
		for(int i=0; i<user.length; i++) {
			if(mid.equals(user[i][0]) && pwd.equals(user[i][1])) {
				vo = new UserVO(user[i][0],user[i][1],user[i][2]);
				break;
			}
		}
		
		return vo;
	}
}
