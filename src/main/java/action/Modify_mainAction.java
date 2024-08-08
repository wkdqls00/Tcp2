package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.DatabaseUtil;


public class Modify_mainAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DatabaseUtil d = new DatabaseUtil();
	    Connection conn = d.getConn();
	    PreparedStatement pstmt = null;
		HttpSession hs = request.getSession();
		int idx = (int)hs.getAttribute("userIdx");
	    ResultSet rs = null;
	    
			try {
	          
	            String sql = "SELECT id, name FROM member WHERE member_idx = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, idx);
	            rs = pstmt.executeQuery();

	            // 출력?
	            if (rs.next()) {
	                String id = rs.getString("id");
	                String name = rs.getString("name");
	                System.out.println(id);
	                System.out.println(name);
	                // jsp 파일로 가져갈거
	                request.setAttribute("id", id);
	                request.setAttribute("name", name);
	             
	            } else {
	                System.out.println("No member found with the given index.");
	            }
	            	RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Modify/Modify_main.jsp"); // 고객별로 id와 name을 다르게 출력해야 하니까 값 가지고 가기
	            	rd.forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // 5. 자원 해제
	            try {
	                if (rs != null) rs.close();
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	}

}
