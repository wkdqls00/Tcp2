package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class MeetCommentDeleteUpdateDAO {
	public static void main(String[] args) {
		MeetCommentDeleteUpdateDAO mcddao = new MeetCommentDeleteUpdateDAO();
		   mcddao.meetCommentDeleteUpdate(3);
	   }

	    public void meetCommentDeleteUpdate(int meet_comment_idx) {
	        DatabaseUtil d = new DatabaseUtil();
	        Connection conn = d.getConn();

	        String sql = 
	              "UPDATE meet_comment "
	              + "SET delete_ok = 'Y' "
	              + "WHERE meet_comment_idx = ?";
	        
	        PreparedStatement pstmt = d.getPstmt(conn, sql);
	        try {
		        pstmt.setInt(1, meet_comment_idx);
		        
		        int result = pstmt.executeUpdate();
		        System.out.println(result + "행 성공적으로 업데이트됨");
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         d.close(conn, pstmt);
		      }
	    }
}
