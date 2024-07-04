package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.JoinConditionPrintDTO;
import project.DatabaseUtil;

public class JoinConditionPrintDAO {
	public static void main(String[] args) {
    	JoinConditionPrintDAO jcp = new JoinConditionPrintDAO();
        try {
        	System.out.println(jcp.selectJoinConditionPrintDTO(1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public JoinConditionPrintDTO selectJoinConditionPrintDTO(int meet_idx) throws SQLException {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT gender, age "
        		+ "FROM meet "
        		+ "WHERE meet_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = pstmt.executeQuery();
        
        JoinConditionPrintDTO joinConditionPrintDTO = null;
        
        if (rs.next()) {
    			String gender = rs.getString(1);
    			int age = rs.getInt(2);
    			
    			joinConditionPrintDTO = new JoinConditionPrintDTO(gender, age); // 저장한 값으로 SeatStatus 객체 생성
        }
    
		return joinConditionPrintDTO;
    }
}