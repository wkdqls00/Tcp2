package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project.DatabaseUtil;

public class GetSeatImg {

	public static void main(String[] args) {
		System.out.println(new GetSeatImg().getSeatImg(14));
	}

	public String getSeatImg(int playhall_idx) {
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = "SELECT image_url FROM playhall WHERE playhall_idx = ?";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, playhall_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);
		String image_url = "";
		try {
			while (rs.next()) {
				image_url = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return image_url;
	}
}
