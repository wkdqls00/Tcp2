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
@WebServlet("/Modify_phoneDao")
public class Modify_phoneAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
      
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        
	    String phone = request.getParameter("input_phoneN");
	    HttpSession hs = request.getSession();
	    int idx = (int) hs.getAttribute("userIdx");

        PreparedStatement pstmt = null;
        
        try {
        	 
            String sql = "UPDATE member "
            			+ "SET phone = ? "
            			+ "WHERE member_idx = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, phone);
            pstmt.setInt(2, idx);
            System.out.println("쿼리실행");
            int updateCount = pstmt.executeUpdate();
            System.out.println("SQL 실행 성공, 업데이트된 행 수: " + updateCount);
            
            // 출력
            if (updateCount > 0) {
            	
                System.out.println("휴대폰 번호 변경됨");
            } else {
                System.out.println("휴대폰 번호 변경 실패");
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("/Modify_memberServlet");
            rd.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
