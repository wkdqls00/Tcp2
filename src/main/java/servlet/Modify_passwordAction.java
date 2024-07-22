package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.DatabaseUtil;

/**
 * Servlet implementation class Modify_passwordServlet
 */
@WebServlet("/Modify_passwordAction")
public class Modify_passwordAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DatabaseUtil d = new DatabaseUtil();
	    Connection conn = d.getConn();
		String input_pw = request.getParameter("newPw");
		HttpSession hs = request.getSession();
		int idx = (int)hs.getAttribute("userIdx");
		
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;

	        try {
	          
	            String sql = "UPDATE member SET pw = ? WHERE member_idx = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, input_pw);
	            pstmt.setInt(2, idx);
	            resultSet = pstmt.executeQuery();

	            // 출력?
	            if (pstmt.executeUpdate() > 0) {
	                System.out.println(idx + "번 회원 비밀번호 변경됨");
	            } else {
	                System.out.println("비밀번호 변경실패");
	            }
	            	response.sendRedirect("/Tcp2/ticketlink/Login/Login.jsp");
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
