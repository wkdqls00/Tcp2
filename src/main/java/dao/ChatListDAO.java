package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ChatListDTO;
import project.DatabaseUtil;

public class ChatListDAO {
	public static void main(String[] args) {
		ChatListDAO msp = new ChatListDAO();
        ArrayList<ChatListDTO>  list = null;        
        try {
        	list = msp.selectChatListDTO(15,3);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (ChatListDTO chatListDTO : list) {
        	System.out.println(chatListDTO);
        }
    }
    
    public ArrayList<ChatListDTO> selectChatListDTO(int member_idx, int chat_idx) throws SQLException {
        ArrayList<ChatListDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT c.title, msg.content, MAX(msg.send_date) "
        		+ "FROM chat c, chat_member c_m, message msg "
        		+ "WHERE c.chat_idx = c_m.chat_idx "
        		+ "AND msg.chat_idx = c_m.chat_idx "
        		+ "AND msg.member_idx = ? "
        		+ "AND c.chat_idx = ? "
        		+ "GROUP BY c.title, msg.content "
        		+ "ORDER BY MAX(msg.send_date) DESC";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, member_idx);
        pstmt.setInt(2, chat_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {

            	String title = rs.getString(1);
            	String content = rs. getString(2);
            	String max_send_date = rs.getString(3);

            	ChatListDTO chatListDTO = new ChatListDTO(title, content, max_send_date); // 저장한 값으로 SeatStatus 객체 생성
                list.add(chatListDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}
