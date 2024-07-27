package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import project.DatabaseUtil;

public class ScriptDAO {

   public static void main(String[] args) {
      
	  
	    new ScriptDAO().insertScript(2, 1, "노래도 연기도 연출도 모두 최고!!!","배우의 내면 연기로 연기해 그  감정에 감동할 수 밖에 없었어요.", 3);
   }
   
      public boolean insertScript(int play_idx, int member_idx, String title, String content, int star_rating){ 
           DatabaseUtil d = new DatabaseUtil();
           Connection conn = d.getConn();
           
           String sql =
                 "SELECT COUNT(*) " + 
                 "FROM payment pm JOIN playinfo pi ON pm.playinfo_idx = pi.playinfo_idx " + 
                 "WHERE pi.play_idx = ? " + 
                 "AND member_idx = ? " + 
                 "AND status = 'Y'";
           
           PreparedStatement pstmt = d.getPstmt(conn, sql);
           try {
           pstmt.setInt(1, play_idx);
           pstmt.setInt(2, member_idx);
           } catch(SQLException e) {
              e.printStackTrace();
           }
           ResultSet rs = d.getRs(pstmt);
           int count = 0;
           try {
              rs.next();
              count = rs.getInt(1);
         } catch (SQLException e) {
            e.printStackTrace();
         }
           pstmt = null;
           if(count == 0) {
              d.close(conn, pstmt, rs);
              System.out.println("해당공연을 관람하지 않음");
              return false;
           }
           pstmt = null;
           sql = 
                 "INSERT INTO script(script_idx, play_idx, member_idx, title, content, star_rating, reg_date)" + 
                 "VALUES (seq_script.nextval, ?, ?, ?, ?, ?, sysdate)";
           
           pstmt = d.getPstmt(conn, sql);
           try {
           pstmt.setInt(1, play_idx);
           pstmt.setInt(2, member_idx);
           pstmt.setString(3, title);
           pstmt.setString(4, content);
           pstmt.setInt(5, star_rating);
         int result = pstmt.executeUpdate();
         System.out.println(result + "행 성공적으로 삽입됨");
           } catch(SQLException e) {
              e.printStackTrace();
           } finally {
              d.close(conn, pstmt, rs);
           }
           return true;
      }
}