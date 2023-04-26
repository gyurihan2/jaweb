package study.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private LoginVO vo = null;
	
	String sql="";
	
	public LoginDAO() {
		String url="jdbc:mysql://localhost:3306/javaweb";
		String user = "root";
		String password= "1234";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패~~");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB연결 실패~~");
			e.printStackTrace();
		}
	}
	
	// 사용한 객체의 반납(해제)
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}

	//로그인 체크
	public LoginVO getLoginCheck(String mid, String pwd) {
		vo=null;
		
		sql="select * from login where mid=? and pwd=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCount(rs.getInt("todayCount"));
			}
		} catch (SQLException e) {
			System.out.println("로그인 체크 sql구문 확인 필요" + e.getMessage());
			e.printStackTrace();
		}finally {
			rsClose();
		}
		
		
		return vo;
	}

	//방문포인트 증가 시키기
	public void setPointPlus(String mid) {
		try {
			sql = "update login set point = point+10, lastDate = now(), todayCount = todayCount+1 where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("로그인 체크 sql구문 확인 필요" + e.getMessage());
			e.printStackTrace();
		}finally {
			pstmtClose();
		}
		
	}
	
	
}
















