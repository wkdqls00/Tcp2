package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import servlet.Ticket_checkDto;


public class Ticket_checkDao {

    // 메인 메서드
    public static void main(String[] args) {
        Ticket_checkDao tcdao = new Ticket_checkDao();
        ArrayList<Ticket_checkDto>  list = null;        
        list = tcdao.checkReservationY(2);
        list = tcdao.checkReservationR(1);
        for (Ticket_checkDto checkReservation : list) {
           System.out.println(checkReservation);
        }
    }
    
    public ArrayList<Ticket_checkDto> checkReservationY(int member_idx) {
        ArrayList<Ticket_checkDto> list = new ArrayList<>();
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String db_id = "user6";//본인 계정 ID입력
    	String db_pw = "1234";//본인 계정 PW입력
       
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
        	Class.forName(driver);
			conn = DriverManager.getConnection(url, db_id, db_pw);
			
			 String sql =
		              "SELECT pay.payment_idx, p.name, p.start_date, pay.status, pi.start_time " + 
		              "FROM payment pay, play p, playinfo pi, member m " + 
		              "WHERE m.member_idx = ? " + 
		              "AND pay.playinfo_idx = pi.playinfo_idx " + 
		              "AND p.play_idx = pi.play_idx " + 
		              "AND pay.member_idx = m.member_idx " + 
		              "AND pay.status = 'Y' " +
		              "ORDER BY payment_idx DESC";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, member_idx);
		     rs = pstmt.executeQuery();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        try {
            while (rs.next()) {
               int payment_idx = rs.getInt(1);
               String name = rs.getString(2);
               Date start_date = rs.getDate(3);
               String status = rs.getString(4);
               String start_time = rs.getString(5);
               Ticket_checkDto checkReservationDTO = new  Ticket_checkDto(payment_idx, name, start_date, status, start_time);
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
    
    public ArrayList< Ticket_checkDto> checkReservationR(int member_idx) {
        ArrayList< Ticket_checkDto> list = new ArrayList<>();
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String db_id = "user6";//본인 계정 ID입력
    	String db_pw = "1234";//본인 계정 PW입력
       
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
        	Class.forName(driver);
			conn = DriverManager.getConnection(url, db_id, db_pw);
			
			 String sql =
		              "SELECT pay.payment_idx, p.name, p.start_date, pay.status, pi.start_time " + 
		              "FROM payment pay, play p, playinfo pi, member m " + 
		              "WHERE m.member_idx = ? " + 
		              "AND pay.playinfo_idx = pi.playinfo_idx " + 
		              "AND p.play_idx = pi.play_idx " + 
		              "AND pay.member_idx = m.member_idx " +
		              "AND pay.status = 'R' " +
		              "ORDER BY payment_idx DESC";
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, member_idx);
		     rs = pstmt.executeQuery();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        try {
            while (rs.next()) {
               int payment_idx = rs.getInt(1);
               String name = rs.getString(2);
               Date start_date = rs.getDate(3);
               String status = rs.getString(4);
               String start_time = rs.getString(5);
               Ticket_checkDto checkReservationDTO = new  Ticket_checkDto(payment_idx, name, start_date, status, start_time);
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
}