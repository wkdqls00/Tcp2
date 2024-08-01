package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class NewChatRoomDAO {
	public static void main(String[] args) {
		NewChatRoomDAO ncr = new NewChatRoomDAO();
		ncr.newChatRoom(11, "6조짱", 3);
	}

    public void newChatRoom(int member_idx, String title, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"INSERT INTO CHAT (CHAT_IDX, MEMBER_IDX, CHAT_DATE, TITLE, meet_idx)  "
        		+ "VALUES (seq_chat.nextval,?,sysdate,?,?) ";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, member_idx);
			pstmt.setString(2, title);
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
