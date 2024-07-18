package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project.DatabaseUtil;

public class PaymentDAO {


    public static void main(String[] args) {
    	int payment_idx = 210;
    	int total_amount = 95000;
    	new PaymentDAO().updatePayment1(payment_idx, total_amount);

    }
    
    public int insertPayment(int member_idx, int playinfo_idx, String[] seat_idxList) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        int payment_idx = 0;
        
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO payment (PAYMENT_IDX, MEMBER_IDX, TIME_LIMIT, STATUS, PLAYINFO_IDX) " +
                    "VALUES (seq_payment.nextval, ?,SYSDATE,'N',?)";
            PreparedStatement pstmt = d.getPstmt(conn, sql);
            pstmt.setInt(1, member_idx);
            pstmt.setInt(2, playinfo_idx);
            int result = pstmt.executeUpdate();
            System.out.println(result + "행 성공적으로 삽입됨");
            pstmt.close();

            sql = "SELECT seq_payment.currval FROM dual";
            pstmt = d.getPstmt(conn, sql);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                payment_idx = rs.getInt(1);
            }
            sql = "INSERT INTO PAYMENTSEAT(PAYMENT_IDX,SEAT_IDX,PLAYINFO_IDX) " +
                    "VALUES (?, ?, ?)";
            result = 0;
            pstmt = conn.prepareStatement(sql);
            for(int i = 0; i < seat_idxList.length; i++) {
            	pstmt.setInt(1, payment_idx);
            	pstmt.setInt(2, Integer.parseInt(seat_idxList[i]));
            	pstmt.setInt(3, playinfo_idx);
            	result += pstmt.executeUpdate();
            }
            System.out.println(result + "행 성공적으로 삽입됨");
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            } 
        } finally {
        	d.close(conn, null);
        }
        return payment_idx;
    }
        
    public void updatePayment1(int payment_idx, int total_amount) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE payment SET total_amount = ? " + 
        		"WHERE payment_idx = ?";
        
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
			pstmt.setInt(1, total_amount);
			pstmt.setInt(2, payment_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
  
    public void updatePayment2(String type, int payment_idx, int member_idx) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"UPDATE payment SET total_amount = ?, " +
        		"type = ?, " + 
        		"pay_date = sysdate, " + 
        		"status = 'Y' " + 
        		"WHERE payment_idx = ?";
        
       	TotalPriceDAO tpdao = new TotalPriceDAO();
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        
        try {
        	pstmt.setInt(1, tpdao.selectTotalPrice(member_idx, payment_idx).get(0).getPrice());
			pstmt.setString(2, type);
			pstmt.setInt(3, payment_idx);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}