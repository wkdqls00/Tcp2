package dao;

import java.sql.*;
import java.util.ArrayList;
import dto.Post_goodDTO;
import project.DatabaseUtil;


public class Post_goodDAO {

	public static void main(String[] args) throws SQLException {
		
		Post_goodDAO pgd = new Post_goodDAO();
		ArrayList<Post_goodDTO> list = null;
		
		try {
			list = pgd.post_goodDto(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for (Post_goodDTO post_goodDto : list) {
			System.out.println(post_goodDto);
		}
	}
	
	

	
	public ArrayList<Post_goodDTO> post_goodDto (int postGood_idx) throws SQLException {
		ArrayList<Post_goodDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT COUNT(g.post_idx) "
					+ "FROM meet_member m_m, member m, post p, post_good g "
					+ "WHERE m_m.member_idx = m.member_idx "
					+ "AND p.meet_member_idx = m_m.meet_member_idx "
					+ "AND g.post_idx = p.post_idx "
					+ "AND p.post_idx = ? ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		pstmt.setInt(1, postGood_idx);
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
			while(rs.next()) {
				 int postGood = rs.getInt(1);
				 
				 Post_goodDTO post_goodDto = new Post_goodDTO(postGood);
				 list.add(post_goodDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		
		return list;
		
		
	}
	
	
}
