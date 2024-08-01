package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ChatHistoryDTO;
import dto.ChatMemberCountDTO;
import dto.ChatTitleDTO;
import dto.MeetIntroduceWriteDTO;
import project.DatabaseUtil;

public class ChatHistoryDAO {
	public static void main(String[] args) {
		ChatHistoryDAO msp = new ChatHistoryDAO();
        ArrayList<ChatHistoryDTO>  list = null;        
        try {
        	list = msp.selectChatHistoryDTO(3, 3);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (ChatHistoryDTO chatHistoryDTO : list) {
        	System.out.println(chatHistoryDTO);
        }
    }
    
    public ArrayList<ChatHistoryDTO> selectChatHistoryDTO(int chat_idx, int meet_idx) throws SQLException {
        ArrayList<ChatHistoryDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT COUNT(re.unread_member_idx), m_m.nickname, msg.content, msg.send_date, m_m.profile "
        		+ "FROM read_ok re, message msg, member m, meet_member m_m "
        		+ "WHERE msg.message_idx = re.message_idx(+) "
        		+ "AND m.member_idx = msg.member_idx "
        		+ "AND m.member_idx = m_m.member_idx (+) "
        		+ "AND chat_idx = ?"
        		+ "AND meet_idx = ?"
        		+ "GROUP BY m_m.nickname, msg.content, msg.send_date, m_m.profile "
        		+ "ORDER BY msg.send_date";
        		

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, chat_idx);
        pstmt.setInt(2, meet_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {

            	int unread_member_idx = rs.getInt(1);
            	String nickname = rs.getString(2);
            	String content = rs.getString(3);
            	String send_date = rs.getString(4);
            	String profile = rs.getString(5);

            	ChatHistoryDTO chatHistoryDTO = new ChatHistoryDTO(unread_member_idx, nickname, content, send_date, profile); // 저장한 값으로 SeatStatus 객체 생성
                list.add(chatHistoryDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
    
    // 채팅방 제목 가져오기
    public ChatTitleDTO selectChatTitle(int chat_idx) throws Exception {
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        
        String sql = 
        		"SELECT title "
        		+ "FROM chat "
        		+ "WHERE chat_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, chat_idx);

        ResultSet rs = d.getRs(pstmt);
        
        ChatTitleDTO chDto = null;
        
        if (rs.next()) {
        	String title = rs.getString(1);
        	
        	chDto = new ChatTitleDTO(title); // 저장한 값으로 SeatStatus 객체 생성
        }
        
        conn.close();
        pstmt.close();
        rs.close();
            
        return chDto;
    }
    
    // 채팅방 회원수
    public ChatMemberCountDTO chatMemberCount(int chat_idx) throws Exception {
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        
        String sql = 
        		"SELECT COUNT(*) "
        		+ "FROM chat_member "
        		+ "WHERE chat_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, chat_idx);

        ResultSet rs = d.getRs(pstmt);
        
        ChatMemberCountDTO chDto = null;
        
        if (rs.next()) {
        	int chat_count = rs.getInt(1);
        	
        	chDto = new ChatMemberCountDTO(chat_count); // 저장한 값으로 SeatStatus 객체 생성
        }
        
        conn.close();
        pstmt.close();
        rs.close();
            
        return chDto;
    }
}
