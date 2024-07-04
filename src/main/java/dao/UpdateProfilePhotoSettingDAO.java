package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateProfilePhotoSettingDAO {
	public static void main(String[] args) {
		UpdateProfilePhotoSettingDAO UUMdao = new UpdateProfilePhotoSettingDAO();
		UUMdao.updateProfilePhotoSetting("profile_03.png", 3, 3);
	}

    public void updateProfilePhotoSetting(String profile, int member_idx, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet_member "
        		+ "SET profile = ? "
        		+ "WHERE member_idx = ? "
        		+ "AND meet_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, profile);
			pstmt.setInt(2, member_idx);
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
