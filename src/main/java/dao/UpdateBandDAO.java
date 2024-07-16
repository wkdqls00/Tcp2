package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class UpdateBandDAO {
	public static void main(String[] args) {
		UpdateBandDAO ubDAO = new UpdateBandDAO();
		ubDAO.updatePublicOk("N", 2);
	}
	
	//밴드 가입 대기
    public void updateJoinWait(int member_idx, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet_member "
        		+ "SET join_wait = 'N' "
        		+ "WHERE member_idx = ? "
        		+ "AND meet_idx = ?";
        		
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
			pstmt.setInt(1, member_idx);
			pstmt.setInt(2, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
    
   // 밴드 공개 설정 
    public void updatePublicOk(String public_ok, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet "
        		+ "SET public_ok = ? "
        		+ "WHERE meet_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, public_ok);
			pstmt.setInt(2, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
    
    public void updateBandName(String name, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet "
        		+ "SET name = ? "
        		+ "WHERE meet_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, name);
			pstmt.setInt(2, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
    
    // 밴드 소개글 업데이트
    public void updateBandIntroduction(String title, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet_rec_write "
        		+ "SET title= ?  "
        		+ "WHERE meet_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, title);
			pstmt.setInt(2, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
    
    //밴드 지역 업데이트
    public void updateBandArea(String area, int meet_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE meet "
        		+ "SET area= ?  "
        		+ "WHERE meet_idx = ?";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setString(1, area);
			pstmt.setInt(2, meet_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
