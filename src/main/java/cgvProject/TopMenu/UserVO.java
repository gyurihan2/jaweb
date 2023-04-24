package cgvProject.TopMenu;

public class UserVO {
	private String mid;
	private String pwd;
	private String name;
	private boolean rememberMid;
	
	
	
	public boolean isRememberMid() {
		return rememberMid;
	}
	public void setRememberMid(boolean rememberMid) {
		this.rememberMid = rememberMid;
	}
	public UserVO(String mid, String pwd, String name) {
		this.mid = mid;
		this.pwd = pwd;
		this.name = name;
	}
	public String getMid() {
		return mid;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "UserVO [mid=" + mid + ", pwd=" + pwd + "]";
	}
	
	
}
