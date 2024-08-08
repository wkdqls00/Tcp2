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
@WebServlet("/Modify_addressAction")
public class Modify_addressAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        DatabaseUtil d = new DatabaseUtil();
	    Connection conn = d.getConn();
	    PreparedStatement pstmt = null;
	    
	    String address = request.getParameter("input_newAddress");
	    String detailed_address = request.getParameter("input_newAddressD");
	    HttpSession hs = request.getSession();
	    int userIdx = (int) hs.getAttribute("userIdx");
	 
   
        
       
        try {

            String sql = "UPDATE member SET address = ?, detailed_address = ? WHERE member_idx = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, address);
            pstmt.setString(2, detailed_address);
            pstmt.setInt(3, userIdx);
            System.out.println("쿼리실행");
            int updateCount = pstmt.executeUpdate();
            System.out.println("SQL 실행 성공, 업데이트된 행 수: " + updateCount);
            
          
            if (updateCount > 0) {
            	
                System.out.println("주소 변경됨");
            } else {
                System.out.println("주소변경 실패");
            }
            
           
//            RequestDispatcher rd = request.getRequestDispatcher("/Controller?command=modify_member");
//            rd.forward(request, response);
            response.sendRedirect("Controller?command=modify_member");
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
