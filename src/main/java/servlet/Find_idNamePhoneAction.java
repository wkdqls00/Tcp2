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
@WebServlet("/Find_idNamePhoneAction")
public class Find_idNamePhoneAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
	        	String sql = 
	        			"SELECT COUNT(*) FROM member WHERE name = ? AND phone = ? " ;
	        	pstmt = conn.prepareStatement(sql);
	        	pstmt.setString(1, name);
	        	pstmt.setString(2, phone);
	        	
	        	rs = pstmt.executeQuery();
	        	
	        	if(rs.next() && rs.getInt(1) > 0) {
	        		System.out.println("회원있음");
	        		response.getWriter().write("인증번호가 전송되었습니다.");
	        	} else {
	        		System.out.println("뭔가 문제가 있음");
	        		response.getWriter().write("입력하신 정보로 회원가입된 아이디가 없습니다.");
	        	}
	        	
        	} catch(SQLException e) {
        		e.printStackTrace();
        	  } finally {
        		  d.close(conn, pstmt, rs);
        	    }
	}
}
