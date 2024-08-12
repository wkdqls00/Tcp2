package action;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import project.DatabaseUtil;


public class Find_pwResultAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	        		request.setAttribute("new_pw", new_pw);
	        		System.out.println("비밀번호 변경됨.");
	        		request.getRequestDispatcher("/ticketlink/Login/Find_pwResult.jsp").forward(request, response);
	        	} else {
	        		response.getWriter().write("오류입니다, 확인을 누르기전 뭔가 정보를 바꾸셨나요?");
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
	    String new_pw = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    int length = 10;
	    SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(new_pw.length());
            password.append(new_pw.charAt(index));
        }
        return password.toString();
	}

}
