package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.Area_RankDTO;
import dto.PscriptDTO;
import project.DatabaseUtil;


public class PscriptDAO {

	public static void main(String[] args) throws SQLException {
		
	PscriptDAO sdao = new PscriptDAO();
	ArrayList<PscriptDTO> list = null;
	try {
		list = sdao.pscriptDto(1, "N");
	} catch(SQLException e) {
		e.printStackTrace();
	} catch(NullPointerException e) {
		e.printStackTrace();
	}
		
	for (PscriptDTO scriptDto : list) {
		System.out.println(scriptDto);
	}
	
	
	}
	
	public ArrayList<PscriptDTO> pscriptDto(int play_idx, String del_ok) throws SQLException {
		
		ArrayList<PscriptDTO> list = new ArrayList();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT m.email, pm.pay_date, pm.pay, s.content, s.star_rating, s.title, s.reg_date, s.del_ok "
					+ "FROM script s "
					+ "JOIN member m ON m.member_idx = s.member_idx "
					+ "JOIN payment pm ON pm.member_idx = m.member_idx "
					+ "WHERE s.del_ok = ? "
					+ "AND s.play_idx = ? "
					+ "ORDER BY s.reg_date DESC";
		
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		pstmt.setString(1, del_ok);
		pstmt.setInt(2, play_idx);
		
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
		while (rs.next()) {
			  String email = rs.getString(1);
			  String payDate = rs.getString(2);
			  String pay = rs.getString(3);
			  String content = rs.getString(4);
			  String starRating = rs.getString(5);
			  String title = rs.getString(6);
			  String regDate = rs.getString(7);
			  String delOk = rs.getString(8);
			  PscriptDTO scriptDto = new PscriptDTO(email, payDate, pay, content, starRating, title, regDate, delOk);
			  list.add(scriptDto);
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
}