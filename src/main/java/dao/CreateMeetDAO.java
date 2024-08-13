package dao;

import project.DatabaseUtil;

import java.sql.*;

public class CreateMeetDAO {

	    public void createMeet(String name, String url, int member_idx, String sub_q, String nickname) {
	        DatabaseUtil d = new DatabaseUtil();
	        Connection conn = d.getConn();

	        String sql = 
	             "INSERT ALL "
	             + "INTO meet(meet_idx, name, url, join_ok, sub_qok, public_ok, sub_q, meet_area_idx) "
	             + "VALUES(seq_meet.nextval, ?, ?, 'Y', 'Y', 'Y',?, 1) "
	             + "INTO meet_member(meet_member_idx, member_idx, meet_idx, admin_ok, leave_ok, join_wait, nickname) "
	             + "VALUES(seq_meet_member.nextval, ?, seq_meet.nextval, 'Y', 'N', 'N', ?) "
	             + "INTO meet_rec_write(meet_rec_write_idx, meet_idx, title) "
	             + "VALUES(seq_meet_rec_write.nextval, seq_meet.nextval, '저희 밴드에 오신걸 환영합니다^-^') "
	             + "SELECT * FROM DUAL";
	        PreparedStatement pstmt = d.getPstmt(conn, sql);
	        try {
		        pstmt.setString(1, name);
		        pstmt.setString(2, url);
		        pstmt.setString(3, sub_q);
		        pstmt.setInt(4, member_idx);
		        pstmt.setString(5, nickname);
		        
		        
		        int result = pstmt.executeUpdate();
		        System.out.println(result + "행 성공적으로 업데이트됨");
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         d.close(conn, pstmt);
		      }
	    }
	}
