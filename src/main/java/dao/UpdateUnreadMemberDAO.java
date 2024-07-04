package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateUnreadMemberDAO {
	public static void main(String[] args) {
		UpdateUnreadMemberDAO UUMdao = new UpdateUnreadMemberDAO();
		UUMdao.updateUnreadMember(13,10);
	}

    public void updateUnreadMember(int unread_member_idx, int message_idx) {
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"INSERT  INTO READ_OK (UNREAD_MEMBER_IDX,MESSAGE_IDX) "
        		+ "VALUES (?,?)";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, unread_member_idx);
			pstmt.setInt(2, message_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
