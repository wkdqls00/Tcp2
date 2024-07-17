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


public class Ticket_checkPeriodDao {
    // 메인 메서드
    public static void main(String[] args) {
        Ticket_checkPeriodDao tcpdao = new Ticket_checkPeriodDao();
        ArrayList<Ticket_checkDto> list = null;    
        ArrayList<Ticket_checkDto> list2 = null; 
        list = tcpdao.checkDayY(24, 5, 1, 90);
        list2 = tcpdao.checkMonthY(24, 5, 1, 2024, "04", "pay.pay_date");
//        for (Ticket_checkDto checkReservation : list2) {
//           System.out.println(checkReservation);
//        }
    }
    
    public ArrayList<Ticket_checkDto> checkDayY(int member_idx, int max, int min, int day) {
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
		             "AND pay.pay_date BETWEEN SYSDATE - "+ day +" AND SYSDATE " +
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
    
    public int checkDayY_count(int member_idx, int day) {
    	
    	 DatabaseUtil d = new DatabaseUtil();
         Connection conn = d.getConn();
         int count = 0;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
 			
 			 String sql =
 					 "SELECT COUNT(*) " + 
 					 "FROM payment pay, play p, playinfo pi, member m " + 
 					 "WHERE m.member_idx = ? " + 
 					 "AND pay.playinfo_idx = pi.playinfo_idx " + 
 					 "AND p.play_idx = pi.play_idx " + 
 					 "AND pay.member_idx = m.member_idx " + 
 					 "AND pay.status = 'Y' " + 
 					 "AND pay.pay_date BETWEEN SYSDATE - "+day+" AND SYSDATE " + 
 					 "ORDER BY payment_idx DESC";
 			 
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
    
    public ArrayList<Ticket_checkDto> checkDayR(int member_idx, int max, int min, int day) {
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
		             "AND pay.status = 'R' " +
		             "AND pay.pay_date BETWEEN SYSDATE - "+ day +" AND SYSDATE " +
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
    
    public int checkDayR_count(int member_idx, int day) {
    	 int count = 0;
    	 DatabaseUtil d = new DatabaseUtil();
         Connection conn = d.getConn();
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
 			
 			 String sql =
 					 "SELECT COUNT(*) " + 
 					 "FROM payment pay, play p, playinfo pi, member m " + 
 					 "WHERE m.member_idx = ? " + 
 					 "AND pay.playinfo_idx = pi.playinfo_idx " + 
 					 "AND p.play_idx = pi.play_idx " + 
 					 "AND pay.member_idx = m.member_idx " + 
 					 "AND pay.status = 'R' " + 
 					 "AND pay.pay_date BETWEEN SYSDATE - "+day+" AND SYSDATE " + 
 					 "ORDER BY payment_idx DESC";
 			 
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
    
    public ArrayList<Ticket_checkDto> checkMonthY(int member_idx, int max, int min, int year, String month, String viOrRe) {
        ArrayList<Ticket_checkDto> list = new ArrayList<>();
        String ym = year + "-" + month;
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
		             "AND TO_CHAR("+ viOrRe +", 'YYYY-MM') = ? " +
		             "ORDER BY payment_idx DESC)a WHERE ROWNUM <= ?) " + 
		             "WHERE row_n >= ?";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, member_idx);
			 pstmt.setString(2, ym);
			 pstmt.setInt(3, max);
			 pstmt.setInt(4, min);
			 
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
    
    public int checkMonthY_count(int member_idx, int year, String month, String viOrRe) {
    	String ym = year + "-" + month;
    	int count = 0;
	   	DatabaseUtil d = new DatabaseUtil();
	    Connection conn = d.getConn();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
			
			 String sql =
					 "SELECT COUNT(*) " + 
					 "FROM payment pay, play p, playinfo pi, member m " + 
					 "WHERE m.member_idx = ? " + 
					 "AND pay.playinfo_idx = pi.playinfo_idx " + 
					 "AND p.play_idx = pi.play_idx " + 
					 "AND pay.member_idx = m.member_idx " + 
					 "AND pay.status = 'Y' " + 
					 "AND TO_CHAR(" + viOrRe + ", 'YYYY-MM') = ? " +
					 "ORDER BY payment_idx DESC";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, member_idx);
			 pstmt.setString(2, ym);
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
    
    public ArrayList<Ticket_checkDto> checkMonthR(int member_idx, int max, int min, int year, String month, String viOrRe) {
    	ArrayList<Ticket_checkDto> list = new ArrayList<>();
        String ym = year + "-" + month;
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
		             "AND TO_CHAR(" + viOrRe + ", 'YYYY-MM') = ? " +
		             "ORDER BY payment_idx DESC)a WHERE ROWNUM <= ?) " + 
		             "WHERE row_n >= ?";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, member_idx);
			 pstmt.setString(2, ym);
			 pstmt.setInt(3, max);
			 pstmt.setInt(4, min);
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
    
    public int checkMonthR_count(int member_idx, int year, String month, String viOrRe) {
    	String ym = year + "-" + month;
    	int count = 0;
   	 DatabaseUtil d = new DatabaseUtil();
     Connection conn = d.getConn();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
			
			 String sql =
					 "SELECT COUNT(*) " + 
					 "FROM payment pay, play p, playinfo pi, member m " + 
					 "WHERE m.member_idx = ? " + 
					 "AND pay.playinfo_idx = pi.playinfo_idx " + 
					 "AND p.play_idx = pi.play_idx " + 
					 "AND pay.member_idx = m.member_idx " + 
					 "AND pay.status = 'R' " + 
					 "AND TO_CHAR(" + viOrRe + ", 'YYYY-MM') = ? " +
					 "ORDER BY payment_idx DESC";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, member_idx);
			 pstmt.setString(2, ym);
			
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
    
}