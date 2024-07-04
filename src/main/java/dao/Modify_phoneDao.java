package dao;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Modify_passwordServlet
 */
@WebServlet("/Modify_phoneDao")
public class Modify_phoneDao extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
	    String driver = "oracle.jdbc.driver.OracleDriver";
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    String db_id = "user6";
	    String db_pw = "1234";
	    String phone = request.getParameter("input_phoneN");
	    HttpSession hs = request.getSession();
	    int idx = (int) hs.getAttribute("userIdx");
	    String id =  (String) hs.getAttribute("id");
	    String name =  (String) hs.getAttribute("name");
	    String email =  (String) hs.getAttribute("email");
	    String birth =  (String) hs.getAttribute("birth");
	    String gender =  (String) hs.getAttribute("gender");
	    String address = (String) hs.getAttribute("address");
	    String detailed_address = (String) hs.getAttribute("detailed_address");
        
        Connection connection = null;
        PreparedStatement pstmt = null;
        
       
        try {
        	 
            // JDBC 드라이버 로드
            Class.forName(driver);

            // 데이터베이스 연결
            connection = DriverManager.getConnection(url, db_id, db_pw);

            // SQL 준비
            String sql = "UPDATE member "
            			+ "SET phone = ? "
            			+ "WHERE member_idx = ?";
            pstmt = connection.prepareStatement(sql);
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
            
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("birth", birth);
            request.setAttribute("gender", gender);
            request.setAttribute("address", address);
            request.setAttribute("detailed_address", detailed_address);
            RequestDispatcher rd = request.getRequestDispatcher("/Modify_member.jsp");
            rd.forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            try {
                if (pstmt != null) pstmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
