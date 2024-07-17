package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import dto.Ticket_checkDto;
import project.DatabaseUtil;


public class Ticket_checkDao {

    // 메인 메서드
    public static void main(String[] args) {
//        Ticket_checkDao tcdao = new Ticket_checkDao();
//        ArrayList<Ticket_checkDto>  list = null;        
//        list = tcdao.checkReservationY(24, 5, 1);
//        for (Ticket_checkDto checkReservation : list) {
//           System.out.println(checkReservation);
//        }
//       ArrayList<Ticket_checkDto> tcdto = new Ticket_checkDao().checkReservationY(24, 5, 1);
//        for (Ticket_checkDto 종원 : tcdto ) {
//        	System.out.println(종원 + "바보");
//        }
    }
    
    public ArrayList<Ticket_checkDto> checkReservationY(int member_idx, int max, int min) {
        ArrayList<Ticket_checkDto> list = new ArrayList<>();
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
        
			
			 String sql =
		             "SELECT * FROM (SELECT ROWNUM row_n, a.*  " + 
		             "FROM(SELECT pay.payment_idx, p.name, p.start_date, pay.status, pi.start_time, TO_CHAR(pay.pay_date, 'YYYY.MM.DD') " + 
		             "FROM payment pay, play p, playinfo pi, member m " + 
		             "WHERE m.member_idx = ? " + 
		             "AND pay.playinfo_idx = pi.playinfo_idx " + 
		             "AND p.play_idx = pi.play_idx " + 
		             "AND pay.member_idx = m.member_idx " + 
		             "AND pay.status = 'Y' " +
		             "ORDER BY payment_idx DESC)a WHERE ROWNUM <= ?) " + 
		             "WHERE row_n >= ?";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, member_idx);
			 pstmt.setInt(2, max);
			 pstmt.setInt(3, min);
		     rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        try {
            while (rs.next()) {
               int payment_idx = rs.getInt(2);
               String name = rs.getString(3);
               Date start_date = rs.getDate(4);
               String status = rs.getString(5);
               String start_time = rs.getString(6);
               String pay_date = rs.getNString(7);
               Ticket_checkDto checkReservationDTO = new  Ticket_checkDto(payment_idx, name, start_date, status, start_time, pay_date);
                list.add(checkReservationDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	if (rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
    		if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
    		if (conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
        }
        return list;
    }
    
    public ArrayList< Ticket_checkDto> checkReservationR(int member_idx, int max, int min) {
        ArrayList< Ticket_checkDto> list = new ArrayList<>();
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
        	
			
			String sql =
		             "SELECT * FROM (SELECT ROWNUM row_n, a.*  " + 
		             "FROM(SELECT pay.payment_idx, p.name, p.start_date, pay.status, pi.start_time, TO_CHAR(pay.pay_date, 'YYYY.MM.DD') " + 
		             "FROM payment pay, play p, playinfo pi, member m " + 
		             "WHERE m.member_idx = ? " + 
		             "AND pay.playinfo_idx = pi.playinfo_idx " + 
		             "AND p.play_idx = pi.play_idx " + 
		             "AND pay.member_idx = m.member_idx " + 
		             "AND pay.status = 'R' " +
		             "ORDER BY payment_idx DESC)a WHERE ROWNUM <= ?) " + 
		             "WHERE row_n >= ?";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, member_idx);
			 pstmt.setInt(2, max);
			 pstmt.setInt(3, min);
		     rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        try {
            while (rs.next()) {
               int payment_idx = rs.getInt(2);
               String name = rs.getString(3);
               Date start_date = rs.getDate(4);
               String status = rs.getString(5);
               String start_time = rs.getString(6);
               String pay_date = rs.getString(7);
               Ticket_checkDto checkReservationDTO = new  Ticket_checkDto(payment_idx, name, start_date, status, start_time, pay_date);
                list.add(checkReservationDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	if (rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
    		if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
    		if (conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
        }
        return list;
    }
    
    public int check_countY(int member_idx) {
    	int count = 0;
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
       
 			
 			 String sql =
 					 "SELECT COUNT(*) FROM (SELECT pay.payment_idx, p.name, p.start_date, pay.status, pi.start_time " + 
 					 "FROM payment pay, play p, playinfo pi, member m " + 
 					 "WHERE m.member_idx = ? " + 
 					 "AND pay.playinfo_idx = pi.playinfo_idx " + 
 					 "AND p.play_idx = pi.play_idx " + 
 					 "AND pay.member_idx = m.member_idx " + 
 					 "AND pay.status = 'Y' " +
 					 "ORDER BY payment_idx DESC)";
 			 
 			 pstmt = conn.prepareStatement(sql);
 			 pstmt.setInt(1, member_idx);
 			
 		     rs = pstmt.executeQuery();
 		     if (rs.next()) {
 		    	 count = rs.getInt(1);
 		     }
 		} catch (SQLException e) {
 			e.printStackTrace();
 		} finally {
         	if (rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
     		if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
     		if (conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
         }
         int count_ = (int)Math.ceil(count/5.0);
         return count_;
     }
    
    public int check_countR(int member_idx) {
    	 int count = 0;
    	 DatabaseUtil d = new DatabaseUtil();
         Connection conn = d.getConn();
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
      
 			
 			 String sql =
 					 "SELECT COUNT(*) FROM (SELECT pay.payment_idx, p.name, p.start_date, pay.status, pi.start_time " + 
 					 "FROM payment pay, play p, playinfo pi, member m " + 
 					 "WHERE m.member_idx = ? " + 
 					 "AND pay.playinfo_idx = pi.playinfo_idx " + 
 					 "AND p.play_idx = pi.play_idx " + 
 					 "AND pay.member_idx = m.member_idx " + 
 					 "AND pay.status = 'R' " +
 					 "ORDER BY payment_idx DESC)";
 			 
 			 pstmt = conn.prepareStatement(sql);
 			 pstmt.setInt(1, member_idx);
 			
 		     rs = pstmt.executeQuery();
 		     if (rs.next()) {
 		    	 count = rs.getInt(1);
 		     }
 		} catch (SQLException  e) {
 			e.printStackTrace();
 		} finally {
         	if (rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
     		if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
     		if (conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
         }
         int count_ = (int)Math.ceil(count/5.0);
         return count_;
     }
    
    public int check_total_countY(int member_idx) {
    	int count = 0;
    	DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
         	
 			
 			 String sql =
 					 "SELECT COUNT(*) FROM (SELECT pay.payment_idx, p.name, p.start_date, pay.status, pi.start_time " + 
 					 "FROM payment pay, play p, playinfo pi, member m " + 
 					 "WHERE m.member_idx = ? " + 
 					 "AND pay.playinfo_idx = pi.playinfo_idx " + 
 					 "AND p.play_idx = pi.play_idx " + 
 					 "AND pay.member_idx = m.member_idx " + 
 					 "AND pay.status = 'Y' " +
 					 "ORDER BY payment_idx DESC)";
 			 
 			 pstmt = conn.prepareStatement(sql);
 			 pstmt.setInt(1, member_idx);
 			
 		     rs = pstmt.executeQuery();
 		     if (rs.next()) {
 		    	 count = rs.getInt(1);
 		     }
 		} catch (SQLException e) {
 			e.printStackTrace();
 		} finally {
         	if (rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
     		if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
     		if (conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
         }
         
         return count;
     }
}