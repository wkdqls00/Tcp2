package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.ShowInquiryInfoDTO;
import project.DatabaseUtil;

public class InquiryDAO {

	public static void main(String[] args) {

	}

	public void insertinquiry(String category, String email, int reservationnum, String product, String title, String content, String agreecheck, int member_idx, String filename) {
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = 
				"INSERT INTO inquiry (inquiry_idx, type, paynumber, play_name, " + 
				"email, title, content, member_idx, reg_date, process_st, filename) " + 
				"VALUES (seq_inquiry.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setString(1, category);
			pstmt.setInt(2, reservationnum);
			pstmt.setString(3, product);
			pstmt.setString(4, email);
			pstmt.setString(5, title);
			pstmt.setString(6, content);
			pstmt.setInt(7, member_idx);
			pstmt.setString(8, "처리대기");
			pstmt.setNString(9, filename);
			System.out.println(pstmt.executeUpdate() + "행 삽입됨");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt);
		}
		
	}
	public ArrayList<ShowInquiryInfoDTO> showInquiryInfo(int member_idx){
		DatabaseUtil d = new DatabaseUtil();
		ArrayList<ShowInquiryInfoDTO> list = new ArrayList<>();
		Connection conn = d.getConn();
		String sql = 
				"SELECT inquiry_idx, title, content, " + 
				"to_char(reg_date, 'YYYY.MM.DD'), " + 
				"process_st, type " + 
				"FROM inquiry  " + 
				"WHERE member_idx = ? " + 
				"ORDER BY reg_date desc";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		try {
			while(rs.next()) {
				int inquiry_idx = rs.getInt(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String date = rs.getString(4);
				String process_st = rs.getString(5);
				String type = rs.getString(6);
				list.add(new ShowInquiryInfoDTO(inquiry_idx ,title, content, date, process_st, type));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
		
	}
	
}
