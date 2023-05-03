package study2;

public class PassVO {
	int idx, keyIdx;
	String id, encPwd, pwd;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getKeyIdx() {
		return keyIdx;
	}
	public void setKeyIdx(int keyIdx) {
		this.keyIdx = keyIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEncPwd() {
		return encPwd;
	}
	public void setEncPwd(String encPwd) {
		this.encPwd = encPwd;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "PassVO [idx=" + idx + ", keyIdx=" + keyIdx + ", id=" + id + ", encPwd=" + encPwd + ", pwd=" + pwd + "]";
	}
	
	 
	
}
