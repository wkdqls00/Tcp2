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
		list = smdao.selectScriptManagementC(1, 5, 1);
		list2 = smdao.selectScriptManagementE(2, 5, 1);
        for (ScriptManagementDto scriptManagementDTO : list) { 
        	System.out.println(scriptManagementDTO); 
        }
        for (ScriptManagementDto scriptManagementDTO : list2) { 
        	System.out.println(scriptManagementDTO); 
        }
        System.out.println(smdao.scriptCountC(1));
    }
    
    // 데이터베이스에서 스크립트 관리 정보를 조회하는 메서드
    public ArrayList<ScriptManagementDto> selectScriptManagementC(int member_idx, int max, int min) {
        ArrayList<ScriptManagementDto> list = new ArrayList<>();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, db_id, db_pw);

        // 스크립트 정보를 조회하는 SQL 쿼리
        String sql = 
				"SELECT * FROM (SELECT ROWNUM rn, a.* FROM (SELECT star_rating, p.name, title, SUBSTR(content,1,20), TO_CHAR(s.reg_date, 'YYYY.MM.DD') " + 
				"FROM script s, member m, payment pm, playinfo pi, play p " + 
				"WHERE m.member_idx = ? " + 
				"AND s.member_idx = m.member_idx " + 
				"AND s.payment_idx = pm.payment_idx " + 
				"AND pm.playinfo_idx = pi.playinfo_idx " + 
				"AND p.play_idx = pi.play_idx " + 
				"AND genre_idx BETWEEN 1 AND 3 " + 
				"ORDER BY reg_date DESC)a WHERE ROWNUM <= ?) " + 
				"WHERE rn >= ?";
				
		// PreparedStatement를 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, member_idx);
        pstmt.setInt(2, max);
        pstmt.setInt(3, min);
        rs = pstmt.executeQuery(); 
        } catch (SQLException | ClassNotFoundException e) {
        	e.printStackTrace();
        }
        
        try {
            while (rs.next()) { 
            	 String star_rating = rs.getString(2);
            	 String play_name = rs.getString(3);
            	 String title = rs.getString(4);
            	 String content = rs.getString(5);
            	 String reg_date = rs.getString(6);
            	 
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
    public ArrayList<ScriptManagementDto> selectScriptManagementE(int member_idx, int max, int min) {
    	 ArrayList<ScriptManagementDto> list = new ArrayList<>();
         ResultSet rs = null;
         PreparedStatement pstmt = null;
         Connection conn = null;
         try {
         Class.forName(driver);
         conn = DriverManager.getConnection(url, db_id, db_pw);

         // 스크립트 정보를 조회하는 SQL 쿼리
         String sql = 
 				"SELECT * FROM (SELECT ROWNUM rn, a.* FROM (SELECT star_rating, p.name, title, SUBSTR(content,1,20), TO_CHAR(s.reg_date, 'YYYY.MM.DD') " + 
 				"FROM script s, member m, payment pm, playinfo pi, play p " + 
 				"WHERE m.member_idx = ? " + 
 				"AND s.member_idx = m.member_idx " + 
 				"AND s.payment_idx = pm.payment_idx " + 
 				"AND pm.playinfo_idx = pi.playinfo_idx " + 
 				"AND p.play_idx = pi.play_idx " + 
 				"AND genre_idx = 4 " + 
 				"ORDER BY reg_date DESC)a WHERE ROWNUM <= ?) " + 
 				"WHERE rn >= ?";
 				
 		// PreparedStatement를 생성
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, member_idx);
         pstmt.setInt(2, max);
         pstmt.setInt(3, min);
         rs = pstmt.executeQuery(); 
         } catch (SQLException | ClassNotFoundException e) {
         	e.printStackTrace();
         }
         
         try {
             while (rs.next()) { 
             	 String star_rating = rs.getString(2);
             	 String play_name = rs.getString(3);
             	 String title = rs.getString(4);
             	 String content = rs.getString(5);
             	 String reg_date = rs.getString(6);
             	 
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
    
    public int scriptCountC(int member_idx) {
    	 ResultSet rs = null;
         PreparedStatement pstmt = null;
         Connection conn = null;
         int count = 0;
         try {
             Class.forName(driver);
             conn = DriverManager.getConnection(url, db_id, db_pw);
             String sql = 
            		 "SELECT COUNT(*) " + 
            		 "FROM script s, member m, payment pm, playinfo pi, play p " + 
            		 "WHERE m.member_idx = ? " + 
            		 "AND s.member_idx = m.member_idx " + 
            		 "AND s.payment_idx = pm.payment_idx " + 
            		 "AND pm.playinfo_idx = pi.playinfo_idx " + 
            		 "AND p.play_idx = pi.play_idx " + 
            		 "AND genre_idx BETWEEN 1 AND 3 " + 
            		 "ORDER BY reg_date DESC";
     				
     		// PreparedStatement를 생성
             pstmt = conn.prepareStatement(sql);
             pstmt.setInt(1, member_idx);
             rs = pstmt.executeQuery(); 
             } catch (SQLException | ClassNotFoundException e) {
             	e.printStackTrace();
             }
             
             try {
                 if (rs.next()) { 
	                 count = rs.getInt(1);
                 	 
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
             int count_ = (int)Math.ceil(count/5.0);
             return count_;
    }
    
    public int scriptCountE(int member_idx) {
   	 ResultSet rs = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        int count = 0;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, db_id, db_pw);
            String sql = 
           		 "SELECT COUNT(*) " + 
           		 "FROM script s, member m, payment pm, playinfo pi, play p " + 
           		 "WHERE m.member_idx = ? " + 
           		 "AND s.member_idx = m.member_idx " + 
           		 "AND s.payment_idx = pm.payment_idx " + 
           		 "AND pm.playinfo_idx = pi.playinfo_idx " + 
           		 "AND p.play_idx = pi.play_idx " + 
           		 "AND genre_idx = 4 " + 
           		 "ORDER BY reg_date DESC";
    				
    		// PreparedStatement를 생성
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, member_idx);
            rs = pstmt.executeQuery(); 
            } catch (SQLException | ClassNotFoundException e) {
            	e.printStackTrace();
            }
            
            try {
                if (rs.next()) { 
	                 count = rs.getInt(1);
                	 
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
            int count_ = (int)Math.ceil(count/5.0);
            return count_;
   }
}
