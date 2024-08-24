package dao;

import java.sql.*;
import project.DatabaseUtil;

public class MeetAreaDto22 {

	public static void main(String[] args) {
	}
	
	public int updateMeetArea(int member_idx) {
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = "SELECT address FROM member WHERE member_idx = ?";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		String address = "";
		try {
			rs.next();
			address = rs.getString(1);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		String[] adrarr = address.split(" ");
		int area_idx = 0;
		switch(adrarr[1].substring(0,2)) {
		case "서울" : area_idx = 1; break;
		case "부산" : area_idx = 2; break;
		case "대구" : area_idx = 3; break;
		case "인천" : area_idx = 4; break;
		case "광주" : area_idx = 5; break;
		case "대전" : area_idx = 6; break;
		case "울산" : area_idx = 7; break;
		case "세종" : area_idx = 8; break;
		case "경기" : area_idx = 9; break;
		case "강원" : area_idx = 10; break;
		case "충북" : area_idx = 11; break;
		case "충남" : area_idx = 12; break;
		case "전북" : area_idx = 13; break;
		case "전남" : area_idx = 14; break;
		case "경북" : area_idx = 15; break;
		case "경남" : area_idx = 16; break;
		case "제주" : area_idx = 17; break;
		}
		sql = "SELECT meet_area_idx FROM meet_area WHERE area_detail like ? AND area_idx = ?";
		pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setString(1,adrarr[2]);
			pstmt.setInt(2, area_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		rs = d.getRs(pstmt);
		int meet_area_idx = 0;
		try {
			rs.next();
			meet_area_idx = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(meet_area_idx);
		
		sql = "UPDATE MEMBER SET meet_area_idx = ? WHERE member_idx = ?";
		pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, meet_area_idx);
			pstmt.setInt(2, member_idx);
			System.out.println(pstmt.executeUpdate() + "행 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return meet_area_idx;
	}
}

