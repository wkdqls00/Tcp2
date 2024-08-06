package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * Servlet implementation class Modify_emailAction
 */
@WebServlet("/Modify_emailAction")
public class Modify_emailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int userIdx = (int)hs.getAttribute("userIdx");
		String userEmail = request.getParameter("user_email");
		DatabaseUtil db = new DatabaseUtil();
		Connection conn = db.getConn();
		PreparedStatement pstmt = null;
		int count = 0;
		
		try {
			
		String sql = "UPDATE member SET email = ? WHERE member_idx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userEmail);
		pstmt.setInt(2, userIdx);
		count = pstmt.executeUpdate();
		
		if(count != 0) {
			System.out.println(userIdx + "번 회원 이메일 변경.");
			response.sendRedirect("/Tcp2/Modify_memberServlet");
		} else {
			System.out.println("오류 발생.");
			response.getWriter().write("실패함.");
		}
		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.close(conn, pstmt);
		}
	}

}
