package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Mypage_memberServlet
 */
@WebServlet("/Mypage_memberServlet")
public class Mypage_memberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession hs = request.getSession();
		int idx = (int) hs.getAttribute("userIdx");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "user6";
		String db_pw = "1234";
		

		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			// JDBC 드라이버 로드
			Class.forName(driver);

			// 데이터베이스 연결
			connection = DriverManager.getConnection(url, db_id, db_pw);

			// SQL
			String sql = "SELECT REPLACE(id, SUBSTR(id,3,4),'****'), " 
					+ "REPLACE (phone, SUBSTR(phone,5,4),'****'), "
					+ "REPLACE (address,SUBSTR(address,0),'***') " 
					+ "FROM member " + "WHERE member_idx = ?";
			
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, idx);
			resultSet = pstmt.executeQuery();

			// 출력?
			if (resultSet.next()) {
				String id = resultSet.getString(1);
				String phone = resultSet.getString(2);
				String address = resultSet.getString(3);

				System.out.println("id: " + id);
				System.out.println("phone: " + phone);
				System.out.println("address: " + address);

				// jsp 파일로 가져갈거
				request.setAttribute("id", id);
				request.setAttribute("phone", phone);
				request.setAttribute("address", address);
			} else {
				System.out.println("No member found with the given index.");
			}
			RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Mypage/Mypage_member.jsp"); // 이 jsp파일로 저 값들을 가져가겠다는 거 (rd는페이지 넘김X)
			rd.forward(request, response);

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			// 5. 자원 해제
			try {
				if (resultSet != null)
					resultSet.close();
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
