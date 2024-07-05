package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class Modify_memberDai
 */
@WebServlet("/Modify_mainServlet")
public class Modify_mainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "user6";
		String db_pw = "1234";
		HttpSession hs = request.getSession();
		int idx = (int)hs.getAttribute("userIdx");
		
		Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;

	        try {
	            // JDBC 드라이버 로드
	            Class.forName(driver);

	            // 데이터베이스 연결
	            connection = DriverManager.getConnection(url, db_id, db_pw);

	            // SQL 
	            String sql = "SELECT id, name FROM member WHERE member_idx = ?";
	            pstmt = connection.prepareStatement(sql);
	            pstmt.setInt(1, idx);
	            resultSet = pstmt.executeQuery();

	            // 출력?
	            if (resultSet.next()) {
	                String id = resultSet.getString("id");
	                String name = resultSet.getString("name");
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
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        } finally {
	            // 5. 자원 해제
	            try {
	                if (resultSet != null) resultSet.close();
	                if (pstmt != null) pstmt.close();
	                if (connection != null) connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	}

}
