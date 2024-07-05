package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.LikeCountDTO;
import project.DatabaseUtil;

public class LikeCountDAO {
	public static void main(String[] args) {
		LikeCountDAO lcdao = new LikeCountDAO();
        try {
        	System.out.println(lcdao.selectLikeCountDTO(2));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public LikeCountDTO selectLikeCountDTO(int post_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT COUNT(*) "
        		+ "FROM meet_member m_m, member m, post p, post_good g "
        		+ "WHERE m_m.member_idx = m.member_idx "
        		+ "AND p.meet_member_idx = m_m.meet_member_idx "
        		+ "AND g.post_idx = p.post_idx "
        		+ "AND p.post_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        pstmt.setInt(1, post_idx);
        
        ResultSet rs = pstmt.executeQuery();
        LikeCountDTO likeCountDTO = null;
        
        if (rs.next()) {
        	int like = rs.getInt(1);
        	
        	likeCountDTO = new LikeCountDTO(like); // 저장한 값으로 SeatStatus 객체 생성
        }
        
		d.close(conn, pstmt, rs);
    
        return likeCountDTO;
    }
}
