package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class ChatJoinDAO {
	public static void main(String[] args) {
		ChatJoinDAO cj = new ChatJoinDAO();
		cj.chatJoin(1, 15);
	}

    public void chatJoin(int chat_idx, int member_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"INSERT INTO Chat_member(chat_idx, member_idx, join_date) "
        		+ "VALUES(?,?,sysdate)";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, chat_idx);
			pstmt.setInt(2, member_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
