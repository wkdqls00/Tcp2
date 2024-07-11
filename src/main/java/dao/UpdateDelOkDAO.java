package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateDelOkDAO {
	public static void main(String[] args) {
		UpdateDelOkDAO udoDAO = new UpdateDelOkDAO();
		udoDAO.updateDelOk(1);
	}

    public void updateDelOk(int post_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE post "
        		+ "SET del_ok='Y' "
        		+ "WHERE post_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, post_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}

