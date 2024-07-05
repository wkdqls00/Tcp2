package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateMeetInfoWriteDAO {
	public static void main(String[] args) {
		UpdateMeetInfoWriteDAO umiwDAO = new UpdateMeetInfoWriteDAO();
		umiwDAO.updateMeetInfoTitle("우리 밴드 조하여", 2);
		umiwDAO.updateMeetInfoArea("경기도 파주시", 2);
	}

    public void updateMeetInfoTitle(String title, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet_rec_write "
        		+ "SET title = ? "
        		+ "WHERE meet_idx = ? ";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, title);
        	pstmt.setInt(2, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
    public void updateMeetInfoArea(String area, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet "
        		+ "SET area = ? "
        		+ "WHERE meet_idx = ? ";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, area);
        	pstmt.setInt(2, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
