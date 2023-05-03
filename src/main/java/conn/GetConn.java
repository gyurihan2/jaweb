package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConn {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url ="jdbc:mysql://localhost:3306/javaweb";
	private String user="root";
	private String password="root";
	
	private static GetConn instance= new GetConn();
	
	//Getconn객체를 싱글톤으로 사용하고자한다. 따라서 외부에서 생성할수 없도록 한다.
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("Dirver 확인필요" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB 접속 정보 확인 필요"+e.getMessage());
		}
	}
	
	//Getconn 객체를 외부에서 열결하여 사용하기위한 메소드 생성
	 public Connection getconn() {
		 return conn;
	 }
	 
	 
	
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
	
	public static GetConn getInstance() {
		return instance;
	}
}
