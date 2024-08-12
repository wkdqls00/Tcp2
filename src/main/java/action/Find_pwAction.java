package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import project.DatabaseUtil;


public class Find_pwAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	        		request.getRequestDispatcher("/ticketlink/Login/Find_pw.jsp").forward(request, response);
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
