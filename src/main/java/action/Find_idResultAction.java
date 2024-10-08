package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import project.DatabaseUtil;


public class Find_idResultAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		StringBuilder sb = new StringBuilder();
//      BufferedReader reader = request.getReader();
//      String line;
//      while ((line = reader.readLine()) != null) {
//          sb.append(line);
//      }
//      JSONObject jsonRequest = new JSONObject(sb.toString());
//      String name = jsonRequest.getString("name");
//      String phone = jsonRequest.getString("phone"); fetch 포기합니다
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
	        			"SELECT id, TO_CHAR(join_date ,'YYYY.MM.DD') join_date FROM member WHERE name = ? AND phone = ?";
	        	pstmt = conn.prepareStatement(sql);
	        	pstmt.setString(1, name);
	        	pstmt.setString(2, phone);
	        	
	        	rs = pstmt.executeQuery();
	        	
	        	if(rs.next()) {
	        		String id = rs.getString(1);
	        		String join_date = rs.getString(2);
	        		
	        		request.setAttribute("id", id);
	        		request.setAttribute("join_date", join_date);
	        		RequestDispatcher rd = request.getRequestDispatcher("/ticketlink/Login/Find_idResult.jsp");
		        	rd.forward(request, response);
	        	} else {
	        		System.out.println("뭔가 문제가 있음");
		        	response.getWriter().write("오류입니다, 확인을 누르기전 뭔가 정보를 바꾸셨나요?");
	        	}
	        	
      	} catch(SQLException e) {
      		e.printStackTrace();
      	  } finally {
      		  d.close(conn, pstmt, rs);
      	    }
	}
}
