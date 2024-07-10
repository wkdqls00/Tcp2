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
@WebServlet("/Modify_memberServlet")
public class Modify_memberServlet extends HttpServlet {
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
	           
	            String sql = "SELECT id, name, " + 
	            		"SUBSTR(phone, 1, 3) || '-' || SUBSTR(phone, 4, 4) || '-' || SUBSTR(phone, 8) phone, "
	            		+ "email, TO_CHAR(birth, 'YYYY-MM-DD') birth, gender, address, detailed_address "
	            		+ "FROM member WHERE member_idx = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, idx);
	            resultSet = pstmt.executeQuery();

	            // 출력?
	            if (resultSet.next()) {
	                String id = resultSet.getString("id");
	                String name = resultSet.getString("name");
	                String phone = resultSet.getString("phone");
	                String email = resultSet.getString("email");
	                String birth = resultSet.getString("birth");
	                String gender = resultSet.getString("gender");
	                String address = resultSet.getString("address");
	                String detailed_address = resultSet.getString("detailed_address");
	                
	                System.out.println("ID: " + id);
	                System.out.println("Name: " + name);
	                System.out.println("Phone: " + phone);
	                System.out.println("Email: " + email);
	                System.out.println("Birth: " + birth);
	                System.out.println("Gender: " + gender);
	                System.out.println("address: " + address);
	                System.out.println("detailed_address: " + detailed_address);
	                
	                // jsp 파일로 가져갈거
	                request.setAttribute("id", resultSet.getString("id"));
	                request.setAttribute("name", resultSet.getString("name"));
	                request.setAttribute("phone", resultSet.getString("phone"));
	                request.setAttribute("email", resultSet.getString("email"));
	                request.setAttribute("birth", resultSet.getString("birth"));
	                request.setAttribute("gender", resultSet.getString("gender"));
	                request.setAttribute("address", resultSet.getString("address"));
	                request.setAttribute("detailed_address", resultSet.getString("detailed_address"));
	            } else {
	                System.out.println("No member found with the given index.");
	            }
	            	RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Modify/Modify_member.jsp"); // 이 jsp파일로 저 값들을 가져가겠다는 거 (rd는 페이지 넘김X)
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
