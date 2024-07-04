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
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "user6";
		String db_pw = "1234";
		String input_pw = request.getParameter("newPw");
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
	            String sql = "UPDATE member SET pw = ? WHERE member_idx = ?";
	            pstmt = connection.prepareStatement(sql);
	            pstmt.setString(1, input_pw);
	            pstmt.setInt(2, idx);
	            resultSet = pstmt.executeQuery();

	            // 출력?
	            if (pstmt.executeUpdate() > 0) {
	                System.out.println("비밀번호 변경됨");
	            } else {
	                System.out.println("비밀번호 변경실패");
	            }
//	            	RequestDispatcher rd = request.getRequestDispatcher("/Modify_member.jsp"); // 이 jsp파일로 저 값들을 가져가겠다는 거 (rd는 페이지 넘김X)
//	            	rd.forward(request, response);
	            	response.sendRedirect("http://localhost:9090/Test/Login.jsp");
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
