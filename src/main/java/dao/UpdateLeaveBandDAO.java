package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateLeaveBandDAO {
	public static void main(String[] args) {
		UpdateLeaveBandDAO ulbdao = new UpdateLeaveBandDAO();
		ulbdao.updateLeaveBand(1,2);
	}

    public void updateLeaveBand(int meet_idx, int member_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet_member "
        		+ "SET leave_ok= 'Y' "
        		+ "WHERE meet_idx = ? "
        		+ "AND member_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, meet_idx);
        	pstmt.setInt(2, member_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
