package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DatabaseUtil;

/**
 * Servlet implementation class Find_idResult
 */
@WebServlet("/Find_pwServlet")
public class Find_pwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        String id = request.getParameter("input_id");
        
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
	        	String sql = 
	        			"SELECT COUNT(*) FROM member WHERE id = ?" ;
	        	pstmt = conn.prepareStatement(sql);
	        	pstmt.setString(1, id);
	        
	        	
	        	rs = pstmt.executeQuery();
	        	
	        	if(rs.next() && rs.getInt(1) > 0) {
	        		System.out.println("회원있음");
	        		response.sendRedirect("/Tcp2/ticketlink/Login/Find_pw.jsp");
	        	} else {
	        		System.out.println("뭔가 문제가 있음");
	        		request.setAttribute("error", true);
	        		request.getRequestDispatcher("/ticketlink/Login/Find_pw_idcheck.jsp").forward(request, response);
	        	}
	        	
        	} catch(SQLException e) {
        		e.printStackTrace();
        	  } finally {
        		  d.close(conn, pstmt, rs);
        	    }
	}
}
