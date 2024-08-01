package servlet;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.DatabaseUtil;

@WebServlet("/Find_pwResultServlet")
public class Find_pwResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        String new_pw = generateTemporaryPassword();
        String id = request.getParameter("name");
        String phone = request.getParameter("phone");
        System.out.println(new_pw);
        
        PreparedStatement pstmt = null;
        int rs = 0;
        
        try {
	        	String sql = 
	        			"UPDATE member SET pw = ? WHERE name = ? AND PHONE = ?" ;
	        	pstmt = conn.prepareStatement(sql);
	        	pstmt.setString(1, new_pw);
	        	pstmt.setString(2, id);
	        	pstmt.setString(3, phone);
	        
	        	
	        	rs = pstmt.executeUpdate();
	        	
	        	if(rs != 0) {
	        		request.setAttribute("new_pew", new_pw);
	        		System.out.println("비밀번호 변경됨.");
	        		request.getRequestDispatcher("/ticketlink/Login/Find_pwResult.jsp").forward(request, response);
	        	} else {
	        		System.out.println("뭔가 문제가 있음");
	        		request.setAttribute("error", true);
	        		request.getRequestDispatcher("/ticketlink/Login/Find_pw_idcheck.jsp").forward(request, response);
	        	}
	        	
        	} catch(SQLException e) {
        		e.printStackTrace();
        	  } finally {
        		  d.close(conn, pstmt);
        	    }
	}
	
	public static String generateTemporaryPassword() {
	    String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    int PASSWORD_LENGTH = 10;
	    SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(PASSWORD_LENGTH);
        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int index = random.nextInt(CHARACTERS.length());
            password.append(CHARACTERS.charAt(index));
        }
        return password.toString();
    }
}
