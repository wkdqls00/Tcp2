package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.JoinConditionPrintDTO;
import project.DatabaseUtil;

public class JoinConditionPrintDAO {
	public static void main(String[] args) {
    	JoinConditionPrintDAO jcp = new JoinConditionPrintDAO();
        ArrayList<JoinConditionPrintDTO>  list = null;        
        try {
        	list = jcp.selectJoinConditionPrintDTO(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (JoinConditionPrintDTO joinConditionPrintDTO : list) {
        	System.out.println(joinConditionPrintDTO);
        }
    }
    
    public ArrayList<JoinConditionPrintDTO> selectJoinConditionPrintDTO(int meet_idx) throws SQLException {
        ArrayList<JoinConditionPrintDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"SELECT gender, age "
        		+ "FROM meet "
        		+ "WHERE meet_idx = ?";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        pstmt.setInt(1, meet_idx);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	
    			String gender = rs.getString(1);
    			int age = rs.getInt(2);
    			
    			JoinConditionPrintDTO joinConditionPrintDTO = new JoinConditionPrintDTO(gender, age); // 저장한 값으로 SeatStatus 객체 생성
                list.add(joinConditionPrintDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
}