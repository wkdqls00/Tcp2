package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

import project.DatabaseUtil;

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
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");

		System.out.println("userIdx : " + userIdx);
		if(userIdx == null) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title></title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='/Tcp2/ticketlink/Login/Login.jsp'");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");
			return;
		}
		
//		HttpSession hs = request.getSession();
//		int idx = (int) hs.getAttribute("userIdx");
		
		DatabaseUtil d = new DatabaseUtil();
	    Connection conn = d.getConn();
		

		PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			
			String sql = "SELECT REPLACE(id, SUBSTR(id,3,4),'****'), " 
					+ "REPLACE (phone, SUBSTR(phone,5,4),'****'), "
					+ "REPLACE (address,SUBSTR(address,0),'***') " 
					+ "FROM member " + "WHERE member_idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
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

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 5. 자원 해제
			try {
				if (resultSet != null)
					resultSet.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
