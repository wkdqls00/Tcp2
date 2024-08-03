package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project.DatabaseUtil;

public class InsertPostGoodDAO {
	public static void main(String[] args) {
		InsertPostGoodDAO udoDAO = new InsertPostGoodDAO();
		try {
			udoDAO.insertPostGood(2, 3);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

    public void insertPostGood(int post_idx, int meet_member_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        String selCount = "SELECT COUNT(*) "
        		+ "FROM post_good "
        		+ "WHERE post_idx = ? "
        		+ "AND meet_member_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, selCount);
       
        int selcnt = 0;
        try {
        	pstmt.setInt(1, post_idx);
			pstmt.setInt(2, meet_member_idx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				selcnt = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        // SELECT COUNT(*) WHERE ... ---> 0 또는 1
        // 1 이면 ---> 0으로 만듦 : DELETE FROM ...
        // 0 이면 ---> 1로 만듦 : INSERT (이미 밑에...)
        
        String sql = "";
        if (selcnt == 1) {
        	sql = "DELETE "
        			+ "FROM post_good "
        			+ "WHERE post_idx = ? "
        			+ "AND meet_member_idx = ?";
        } else {
        	sql = "INSERT INTO post_good(post_idx, meet_member_idx) "
        					+ "VALUES (?,?)";
        }
        
        PreparedStatement pstmt1 = d.getPstmt(conn, sql);
        try {
        	pstmt1.setInt(1, post_idx);
        	pstmt1.setInt(2, meet_member_idx);
			int result = pstmt1.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmt1.close();
			conn.close();
		}
    }
}
