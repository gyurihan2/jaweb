package study2.mapping;

import javax.servlet.ServletContext;

public class Test04Service {
	int su1, su2;
	public Test04Service(int su1, int su2) {
		this.su1 = su1;
		this.su2 = su2;
	}
	
	
	public int test4Calc() {
		int res= su1 + su2;
		return res;
	}
	public int test4cha() {
		int res= su1 - su2;
		return res;
	}
}