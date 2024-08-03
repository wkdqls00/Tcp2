package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dto.ScriptwriteDTO;
import project.DatabaseUtil;

public class ScriptwriteDAO {

	public static void main(String[] args) {
		
	//	ArrayList<ScriptwriteDTO> swd = new ScriptwriteDAO().scriptwriteDto(486);	
			
		ArrayList<ScriptwriteDTO> swd = new ScriptwriteDAO().getscriptwriteByPageNum(1, 486);	
		for (ScriptwriteDTO scriptwriteDto : swd) {
			System.out.println(scriptwriteDto);
		}		
    }
	
	public ArrayList<ScriptwriteDTO> scriptwriteDto(int play_idx)  {
		
		ArrayList<ScriptwriteDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT m.email, s.content, s.star_rating, s.title, TO_CHAR(s.reg_date, 'YYYY-MM-DD HH24:MM'), s.del_ok, s.script_idx "
					+ "FROM script s "
					+ "JOIN member m ON m.member_idx = s.member_idx "
					+ "WHERE s.del_ok = 'N' "
					+ "AND s.play_idx = ? "
					+ "ORDER BY s.reg_date DESC";
		
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, play_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
		while (rs.next()) {
			  String email = rs.getString(1);
			  String content = rs.getString(2);
			  String starRating = rs.getString(3);
			  String title = rs.getString(4);
			  String regDate = rs.getString(5);
			  String delOk = rs.getString(6);
			  int script_idx = rs.getInt(7);
			  ScriptwriteDTO scriptwriteDto = new ScriptwriteDTO(email, content, starRating, title, regDate, delOk, script_idx);
			  list.add(scriptwriteDto);
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<ScriptwriteDTO> getscriptwriteByPageNum(int pageNum, int play_idx) {
		ArrayList<ScriptwriteDTO> listRet = new ArrayList<ScriptwriteDTO>();
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		int endNum = pageNum * 10;
		int startNum = endNum - 9;
		
		String sql = "SELECT s2.* "
				   + "FROM     (SELECT rownum rnum, s1.* "
				   + "          FROM    (SELECT m.email, s.content, s.star_rating, s.title, TO_CHAR(s.reg_date, 'YYYY-MM-DD HH24:MM') AS reg_date, s.del_ok, s.script_idx  "
				   + "                   FROM script s  "
				   + "                   JOIN member m ON m.member_idx = s.member_idx "
				   + "                   WHERE s.del_ok = 'N' "
				   + "                   AND s.play_idx = ? "
				   + "                   ORDER BY s.reg_date DESC) s1) s2 "
				   + "WHERE rnum >= ? AND rnum <= ? ";
		  
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, play_idx);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ResultSet rs = d.getRs(pstmt);
		
		try {
			while (rs.next()) {
				  String email = rs.getString("email");
				  String content = rs.getString("content");
				  String starRating = rs.getString("star_rating");
				  String title = rs.getString("title");
				  String regDate = rs.getString("reg_date");
				  String delOk = rs.getString("del_ok");
				  int script_idx = rs.getInt("script_idx");
				  ScriptwriteDTO scriptwriteDto = new ScriptwriteDTO(email, content, starRating, title, regDate, delOk, script_idx);
				  listRet.add(scriptwriteDto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		return listRet;
	}
	
	public int getLastPageNum() {
		DatabaseUtil d = new DatabaseUtil();
		
		String sql = "SELECT COUNT(*) FROM script ";
		
		Connection conn = d.getConn();
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		ResultSet rs = d.getRs(pstmt);
		int countRet = -1;

		try {
			if (rs.next()) {
				countRet = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
	
		return countRet/10 + (countRet%10>0 ? 1: 0);
	}
	
}