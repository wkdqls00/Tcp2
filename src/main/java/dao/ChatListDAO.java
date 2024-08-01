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
        	list = msp.selectChatListDTO(3);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (ChatListDTO chatListDTO : list) {
        	System.out.println(chatListDTO);
        }
    }
    
    public ArrayList<ChatListDTO> selectChatListDTO(int meet_idx) throws SQLException {
        ArrayList<ChatListDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT  "
        		+ "    c.title,  "
        		+ "    msg.content,  "
        		+ "    msg.send_date,  "
        		+ "    c.chat_idx "
        		+ "FROM  "
        		+ "    chat c "
        		+ "LEFT JOIN  "
        		+ "    (SELECT  "
        		+ "        m1.chat_idx,  "
        		+ "        m1.content,  "
        		+ "        m1.send_date "
        		+ "     FROM  "
        		+ "        message m1 "
        		+ "     WHERE  "
        		+ "        m1.send_date = ( "
        		+ "            SELECT  "
        		+ "                MAX(m2.send_date) "
        		+ "            FROM  "
        		+ "                message m2 "
        		+ "            WHERE  "
        		+ "                m2.chat_idx = m1.chat_idx "
        		+ "        ) "
        		+ "    ) msg "
        		+ "ON  "
        		+ "    c.chat_idx = msg.chat_idx "
        		+ "WHERE  "
        		+ "    c.meet_idx = ? "
        		+ "ORDER BY  "
        		+ "    msg.send_date DESC NULLS LAST";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {

            	String title = rs.getString(1);
            	String content = rs. getString(2);
            	String max_send_date = rs.getString(3);
            	int chat_idx = rs.getInt(4);

            	ChatListDTO chatListDTO = new ChatListDTO(title, content, max_send_date, chat_idx); // 저장한 값으로 SeatStatus 객체 생성
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
