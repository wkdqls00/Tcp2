package dao;

import project.DatabaseUtil;

import java.sql.*;

public class CreateMeetDAO {

	    public void createMeet(String name, String url, int member_idx, String sub_q) {
	        DatabaseUtil d = new DatabaseUtil();
	        Connection conn = d.getConn();

	        String sql = 
	             "INSERT ALL "
	             + "INTO meet(meet_idx, name, url, join_ok, sub_qok, public_ok, sub_q) "
	             + "VALUES(seq_meet.nextval, ?, ?, 'Y', 'Y', 'Y',?) "
	             + "INTO meet_member(meet_member_idx, member_idx, meet_idx, admin_ok, leave_ok, join_wait) "
	             + "VALUES(seq_meet_member.nextval, ?, seq_meet.nextval, 'Y', 'N', 'N') "
	             + "SELECT * FROM DUAL";
	        PreparedStatement pstmt = d.getPstmt(conn, sql);
	        try {
		        pstmt.setString(1, name);
		        pstmt.setString(2, url);
		        pstmt.setString(3, sub_q);
		        pstmt.setInt(4, member_idx);
		        
		        
		        int result = pstmt.executeUpdate();
		        System.out.println(result + "행 성공적으로 업데이트됨");
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         d.close(conn, pstmt);
		      }
	    }
	}
