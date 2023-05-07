package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class BoardDAO {
	//싱글톤으로 선언된 DB연결객체(GetConn)을 연결한다.

	GetConn getConn = GetConn.getInstance();

	private Connection conn=getConn.getconn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	private BoardVO vo;

	private String sql ="";

	// 게시글 전체 조회
	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> vos = new ArrayList<>();

		try {
			sql="select * from board order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));

				vos.add(vo);
			}


		}catch (SQLException e) {
			System.out.println("SQL 구문 확인 필요 - " + e.getMessage());
		}finally {
			getConn.rsClose();
		}

		return vos;
	}

	public ArrayList<BoardVO> getBoardList(int start, int end) {
		ArrayList<BoardVO> vos = new ArrayList<>();

		try {
			sql="select *,TIMESTAMPDIFF(hour,wDate,now()) as hour_diff, datediff(wDate,now()) as day_diff from board order by idx desc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();

			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));

				// DB Alias
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDay_diff(rs.getInt("day_diff"));

				vos.add(vo);
			}


		}catch (SQLException e) {
			System.out.println("SQL 구문 확인 필요 - " + e.getMessage());
		}finally {
			getConn.rsClose();
		}

		return vos;
	}

	public int setBoardInputOk(BoardVO vo) {
		int res = 0;

		try {
			sql="insert into board values(default,?,?,?,?,?,?,?,default,?,default,default)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getHomePage());
			pstmt.setString(6, vo.getContent());
			pstmt.setString(7, vo.getHostIp());
			pstmt.setString(8, vo.getOpenSw());

			res = pstmt.executeUpdate();



		} catch (SQLException e) {
			System.out.println("SQL 구문 확인 필요 - " + e.getMessage());
		}finally {
			getConn.pstmtClose();
		}


		return res;
	}

	public int getListCnt() {
		int res = 0;

		try {
			sql="select count(*) as cnt from board";

			pstmt =conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) res = rs.getInt("cnt");

		} catch (SQLException e) {
			System.out.println("SQL 구문 확인 필요 - " + e.getMessage());
		}finally {
			getConn.rsClose();
		}

		return res;
	}




}
