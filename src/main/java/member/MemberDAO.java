package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;



public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn=getConn.getconn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	private MemberVO vo;
	
	private String sql ="";

	//아이디 체크 후 자료가 있으면 vo에 개인정볼르 모드 담는다.
	public MemberVO getMemberMidCheck(String mid) {
		vo = null;
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				
				
				
			}
			
			
		}catch (SQLException e) {
			System.out.println("SQL 구문 확인 필요: " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return null;
	}
}
