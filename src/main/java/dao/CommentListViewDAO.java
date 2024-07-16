package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.CommentListViewDTO;
import dto.LikeCountDTO;
import project.DatabaseUtil;

public class CommentListViewDAO {
	public static void main(String[] args) {
		CommentListViewDAO clvdao = new CommentListViewDAO();
        ArrayList<CommentListViewDTO> list = null;        
        try {
        	list = clvdao.selectCommentListViewDTO(3);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (CommentListViewDTO commentListViewDTO : list) {
        	System.out.println(commentListViewDTO);
        }
    }
    
    public ArrayList<CommentListViewDTO> selectCommentListViewDTO(int post_idx) throws SQLException {
        ArrayList<CommentListViewDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT m.member_idx, c.meet_comment_idx, m_m.nickname, m_m.profile, c.content, c.reg_date "
        		+ "FROM member m, meet_member m_m, meet_comment c, post p "
        		+ "WHERE m.member_idx = m_m.member_idx "
        		+ "AND c.meet_member_idx = m_m.meet_member_idx "
        		+ "AND p.post_idx = c.post_idx "
        		+ "AND delete_ok = 'N' "
        		+ "AND p.post_idx = ? "
        		+ "ORDER BY c.reg_date";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        pstmt.setInt(1, post_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	int member_idx = rs.getInt(1);
            	int comment_idx = rs.getInt(2);
            	String nickname = rs.getString(3);
            	String profile = rs.getString(4);
            	String content = rs.getString(5);
            	String reg_date = rs.getString(6);
            	
            	CommentListViewDTO commentListViewDTO = new CommentListViewDTO(member_idx, comment_idx, nickname, profile, content, reg_date); // 저장한 값으로 SeatStatus 객체 생성
                list.add(commentListViewDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
    
    public ArrayList<LikeCountDTO> selectLikeCountDTO(int post_idx) throws SQLException {
        ArrayList<LikeCountDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT COUNT(g.post_idx) "
        		+ "FROM meet_member m_m, member m, post p, post_good g "
        		+ "WHERE m_m.member_idx = m.member_idx "
        		+ "AND p.meet_member_idx = m_m.meet_member_idx "
        		+ "AND g.post_idx = p.post_idx "
        		+ "AND delete_ok = 'N' "
        		+ "AND p.post_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        pstmt.setInt(1, post_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	int like = rs.getInt(1);
            	
            	LikeCountDTO likeCountDTO = new LikeCountDTO(like); // 저장한 값으로 SeatStatus 객체 생성
                list.add(likeCountDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}
