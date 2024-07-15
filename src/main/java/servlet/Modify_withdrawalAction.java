package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.DatabaseUtil;

/**
 * Servlet implementation class Modify_withdrawalDao
 */
@WebServlet("/Modify_withdrawalAction")
public class Modify_withdrawalAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DatabaseUtil d = new DatabaseUtil();
	    Connection conn = d.getConn();
		HttpSession hs = request.getSession();
		int idx = (int)hs.getAttribute("userIdx");
		
        PreparedStatement pstmt = null;
        int resultSet = 0;
		
		try {
			
			String sql = "UPDATE member SET withdrawal = 'Y' WHERE member_idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			resultSet = pstmt.executeUpdate();
			
			if(resultSet > 0) {
				System.out.println(idx + "번 회원 탈퇴");
			} else {
				System.out.println("잘못된 탈퇴 시도");
			}
			response.sendRedirect("/Tcp2/ticketlink/Login/Login.jsp");
		
		} catch(SQLException  e) {
			e.printStackTrace();
		} finally {
            // 5. 자원 해제
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
}
