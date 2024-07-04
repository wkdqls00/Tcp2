package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateJoinBandSettingDAO {
	public static void main(String[] args) {
		UpdateJoinBandSettingDAO ujbsdao = new UpdateJoinBandSettingDAO();
		ujbsdao.updateJoinBandSetting("F", 1996, 5);
	}

    public void updateJoinBandSetting(String gender, int age, int meet_idx) {
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet "
        		+ "SET gender = ?, "
        		+ "age = ? "
        		+ "WHERE meet_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, gender);
			pstmt.setInt(2, age);
			pstmt.setInt(3, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
