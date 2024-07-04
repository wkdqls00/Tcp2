package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ChatHistoryDTO;
import project.DatabaseUtil;

public class ChatHistoryDAO {
	public static void main(String[] args) {
		ChatHistoryDAO msp = new ChatHistoryDAO();
        ArrayList<ChatHistoryDTO>  list = null;        
        try {
        	list = msp.selectChatHistoryDTO(10,1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (ChatHistoryDTO chatHistoryDTO : list) {
        	System.out.println(chatHistoryDTO);
        }
    }
    
    public ArrayList<ChatHistoryDTO> selectChatHistoryDTO(int message_idx, int chat_idx) throws SQLException {
        ArrayList<ChatHistoryDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT COUNT(re.unread_member_idx), m.nickname, msg.content, msg.send_date "
        		+ "FROM read_ok re, message msg, member m "
        		+ "WHERE msg.message_idx = re.message_idx "
        		+ "AND m.member_idx = msg.member_idx "
        		+ "AND re.message_idx = ? "
        		+ "AND chat_idx = ? "
        		+ "GROUP BY m.nickname, msg.content, msg.send_date "
        		+ "ORDER BY msg.send_date";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, message_idx);
        pstmt.setInt(2, chat_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {

            	int unread_member_idx = rs.getInt(1);
            	String nickname = rs.getString(2);
            	String content = rs.getString(3);
            	String send_date = rs.getString(4);

            	ChatHistoryDTO chatHistoryDTO = new ChatHistoryDTO(unread_member_idx, nickname, content, send_date); // 저장한 값으로 SeatStatus 객체 생성
                list.add(chatHistoryDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}
