package cgvProject.TopMenu;

public class LoginVO {
	private String mid,pwd,name,identiNum,email,phone,address;
	private String gender;
	// 회원 등급, 가입일자, 비밀번호 생성(변경일자) 추가필요

	public LoginVO() {
		// TODO Auto-generated constructor stub
	}
	public LoginVO(String mid, String pwd, String name) {
		this.mid = mid;
		this.pwd = pwd;
		this.name = name;
	}
	public String getMid() {
		return mid;
	}

	public String getIdentiNum() {
		return identiNum;
	}
	public void setIdentiNum(String identiNum) {
		this.identiNum = identiNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
		return "LoginVO [mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", identiNum=" + identiNum + ", email="
				+ email + ", phone=" + phone + ", address=" + address + ", gender=" + gender + "]";
	}



}
