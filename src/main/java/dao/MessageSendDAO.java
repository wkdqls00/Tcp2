package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class MessageSendDAO {
	public static void main(String[] args) {
		MessageSendDAO MSdao = new MessageSendDAO();
		MSdao.messageSend(1, 24, "안녕안녕하이룽");
	}

    public void messageSend(int chat_idx, int member_idx, String content) {
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"INSERT INTO Message(message_idx,chat_idx, member_idx, content, send_date) "
        		+ "VALUES(seq_message.nextval, ?, ?, ?, sysdate)";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
			pstmt.setInt(1, chat_idx);
			pstmt.setInt(2, member_idx);
			pstmt.setString(3, content);
			
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
