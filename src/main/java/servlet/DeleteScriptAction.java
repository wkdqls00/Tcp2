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
 * Servlet implementation class DeleteScriptAction
 */
@WebServlet("/DeleteScriptAction")
public class DeleteScriptAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        int script_idx = Integer.parseInt(request.getParameter("script_idx"));
        
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        PreparedStatement pstmt = null;
        
        try {
        	 
            String sql =
            		"UPDATE script SET del_ok = 'Y' WHERE script_idx = ?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, script_idx);
            System.out.println("쿼리실행");
            int updateCount = pstmt.executeUpdate();
            System.out.println("SQL 실행 성공, 업데이트된 행 수: " + updateCount);
            
            // 출력
            if (updateCount > 0) {
                System.out.println(script_idx + "번 후기글 삭제됨");
            } else {
                System.out.println("오류다 비상이다");
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("/ScriptManagementServlet");
            rd.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}