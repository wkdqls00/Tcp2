 package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.ScriptManagementDto;

public class ScriptManagementDao {
	  private static String driver = "oracle.jdbc.driver.OracleDriver";
      private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	  private static String db_id = "user6";//본인 계정 ID입력
	  private static String db_pw = "1234";//본인 계정 PW입력  
    // 메인 메서드
    public static void main(String[] args) {
    	ScriptManagementDao smdao = new ScriptManagementDao();
        ArrayList<ScriptManagementDto> list = null;        
        ArrayList<ScriptManagementDto> list2 = null;        
		list = smdao.selectScriptManagementC(1);
		list2 = smdao.selectScriptManagementE(2);
        for (ScriptManagementDto scriptManagementDTO : list) { 
        	System.out.println(scriptManagementDTO); 
        }
        for (ScriptManagementDto scriptManagementDTO : list2) { 
        	System.out.println(scriptManagementDTO); 
        }
    }
    
    // 데이터베이스에서 스크립트 관리 정보를 조회하는 메서드
    public ArrayList<ScriptManagementDto> selectScriptManagementC(int member_idx) {
        ArrayList<ScriptManagementDto> list = new ArrayList<>();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, db_id, db_pw);

        // 스크립트 정보를 조회하는 SQL 쿼리
        String sql = 
				"SELECT star_rating, p.name, title, SUBSTR(content,1, 15) content, TO_CHAR(s.reg_date, 'YYYY.MM.DD') "
				+ "FROM script s "
				+ "JOIN member m ON s.member_idx = m.member_idx "
				+ "JOIN payment pm ON s.payment_idx = pm.payment_idx "
				+ "JOIN playinfo pi ON pm.playinfo_idx = pi.playinfo_idx "
				+ "JOIN play p ON p.play_idx = pi.play_idx "
				+ "WHERE m.member_idx = ? "
				+ "AND genre_idx BETWEEN 1 AND 3"
				+ "ORDER BY s.reg_date DESC";
				
		// PreparedStatement를 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, member_idx);
        rs = pstmt.executeQuery(); 
        } catch (SQLException | ClassNotFoundException e) {
        	e.printStackTrace();
        }
        
        try {
            while (rs.next()) { 
            	 String star_rating = rs.getString(1);
            	 String play_name = rs.getString(2);
            	 String title = rs.getString(3);
            	 String content = rs.getString(4);
            	 String reg_date = rs.getString(5);
            	 
            	 ScriptManagementDto scriptManagementDTO = new ScriptManagementDto(star_rating, play_name, title, content, reg_date); 
                list.add(scriptManagementDTO); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
        return list; 
    }
    
    // 데이터베이스에서 스크립트 관리 정보를 조회하는 메서드
    public ArrayList<ScriptManagementDto> selectScriptManagementE(int member_idx) {
    	 ArrayList<ScriptManagementDto> list = new ArrayList<>();
         ResultSet rs = null;
         PreparedStatement pstmt = null;
         Connection conn = null;
         try {
         Class.forName(driver);
         conn = DriverManager.getConnection(url, db_id, db_pw);

         // 스크립트 정보를 조회하는 SQL 쿼리
         String sql = 
 				"SELECT star_rating, p.name, title, SUBSTR(content,1, 15) content, TO_CHAR(s.reg_date, 'YYYY.MM.DD') "
 				+ "FROM script s "
 				+ "JOIN member m ON s.member_idx = m.member_idx "
 				+ "JOIN payment pm ON s.payment_idx = pm.payment_idx "
 				+ "JOIN playinfo pi ON pm.playinfo_idx = pi.playinfo_idx "
 				+ "JOIN play p ON p.play_idx = pi.play_idx "
 				+ "WHERE m.member_idx = ? "
 				+ "AND genre_idx = '4' "
 				+ "ORDER BY s.reg_date DESC";
 				
 		// PreparedStatement를 생성
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, member_idx);
         rs = pstmt.executeQuery(); 
         } catch (SQLException | ClassNotFoundException e) {
         	e.printStackTrace();
         }
         
         try {
             while (rs.next()) { 
             	 String star_rating = rs.getString(1);
             	 String play_name = rs.getString(2);
             	 String title = rs.getString(3);
             	 String content = rs.getString(4);
             	 String reg_date = rs.getString(5);
             	 
             	 ScriptManagementDto scriptManagementDTO = new ScriptManagementDto(star_rating, play_name, title, content, reg_date); 
                 list.add(scriptManagementDTO); 
             }
         } catch (SQLException e) {
             e.printStackTrace();
         } finally {
 			try {
 				if (rs != null) rs.close();
 				if (pstmt != null) pstmt.close();
 				if (conn != null) conn.close();
 			} catch (SQLException e) {
 				e.printStackTrace();
 			}
 		}
         return list; 
    }
    
    
}
