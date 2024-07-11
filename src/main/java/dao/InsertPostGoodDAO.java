package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class InsertPostGoodDAO {
	public static void main(String[] args) {
		InsertPostGoodDAO udoDAO = new InsertPostGoodDAO();
		udoDAO.insertPostGood(1, 4);
	}

    public void insertPostGood(int post_idx, int meet_member_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        // SELECT COUNT(*) WHERE ... ---> 0 또는 1
        // 1 이면 ---> 0으로 만듦 : DELETE FROM ...
        // 0 이면 ---> 1로 만듦 : INSERT (이미 밑에...)
        
        String sql = 
        		"INSERT INTO post_good(post_idx, meet_member_idx) "
        		+ "VALUES (?,?)";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, post_idx);
        	pstmt.setInt(2, meet_member_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
