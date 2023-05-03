package study2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class PassDAO {
	
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getconn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql="";
	
	
	// 등록된 키의 갯수
	public int getkeyCnt() {
		int res =0;
		
		try {
			sql = "select count(*) as cnt from pwdKey";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) res = rs.getInt("cnt");
			
			
		} catch (SQLException e) {
			System.out.println("sql 구문 확인 필요: " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return res;
	}

	// 등록된 키 전달
	public long getKey(int idx) {
		long keyStr=0;
		
		try {
			sql ="select * from pwdKey where idx=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) keyStr=rs.getLong("hKey");
			
		} catch (SQLException e) {
			System.out.println("sql 구문 확인 필요: " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return keyStr;
	}

	// 저장
	public int inputData(String mid, String strPwd, int keyIdx) {
		int res =0;
		
		try {
			sql ="insert into EncLogin values(default,?,?,?)";
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, keyIdx);
			pstmt.setString(2, mid);
			pstmt.setString(3, strPwd);
			
			res=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			System.out.println("sql 구문 확인 필요: " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		
		return res;
	}
	
	
	
}
