package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.DatabaseUtil;

import java.sql.*;

/**
 * Servlet implementation class Modify_memberDai
 */
@WebServlet("/Modify_withdrawalServlet")
public class Modify_withdrawalServlet extends HttpServlet {
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
        ResultSet resultSet = null;

	        try {
	         
	            String sql = "SELECT name FROM member WHERE member_idx = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, idx);
	            resultSet = pstmt.executeQuery();

	            // 출력?
	            if (resultSet.next()) {
	                String name = resultSet.getString(1);
	                System.out.println(name);
	                // jsp 파일로 가져갈거
	                request.setAttribute("name", name);
	            } else {
	                System.out.println("실패");
	            }
	            	RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Modify/Modify_withdrawal.jsp");
	            	rd.forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // 5. 자원 해제
	            try {
	                if (resultSet != null) resultSet.close();
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	}

}
