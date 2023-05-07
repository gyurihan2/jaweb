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
	private PassVO vo;
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
	public String getKey(int idx) {
		String keyStr="";

		try {
			sql ="select * from pwdKey where idx=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, idx);

			rs= pstmt.executeQuery();

			if(rs.next()) keyStr=rs.getString("hKey");

		} catch (SQLException e) {
			System.out.println("sql 구문 확인 필요: " + e.getMessage());
		}finally {
			getConn.rsClose();
		}

		return keyStr;
	}

	// 저장
	public int inputData(String mid, String strPwd, int keyIdx,String pwd) {
		int res =0;

		try {
			sql ="insert into EncLogin values(default,?,?,?,?)";
			pstmt= conn.prepareStatement(sql);

			pstmt.setInt(1, keyIdx);
			pstmt.setString(2, mid);
			pstmt.setString(3, strPwd);
			pstmt.setString(4, pwd);

			res=pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("sql 구문 확인 필요: " + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}

		return res;
	}

	//계정 정보 확인
	public PassVO getPassUser(String id) {
		vo=null;
		try {
			sql = "select * from EncLogin where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs= pstmt.executeQuery();

			if(rs.next()) {
				vo = new PassVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setKeyIdx(rs.getInt("keyIdx"));
				vo.setId(rs.getString("id"));
				vo.setEncPwd(rs.getString("encPwd"));
				vo.setPwd(rs.getString("pwd"));

				return vo;
			}
		} catch (SQLException e) {
			System.out.println("sql 구문 확인 필요: " + e.getMessage());
		}finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 로그인이 통과 될경우 비밀번호 업데이트
	public int setPassUpdate(int keyIdx, String chkPass, String mid) {
		int res =0;

		try {
			sql ="update EncLogin set keyIdx=?, encPwd=? where id=?";
			pstmt= conn.prepareStatement(sql);

			pstmt.setInt(1, keyIdx);
			pstmt.setString(2, chkPass);
			pstmt.setString(3, mid);


			res=pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("sql 구문 확인 필요: " + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}

		return res;
	}



}
