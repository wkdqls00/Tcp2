
package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckId")
public class CheckId extends HttpServlet {

    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "user6";
    private static final String DB_PASSWORD = "1234";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	String id = request.getParameter("id");
        String regex = "^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z0-9]{6,20}$";
        boolean isIdTaken = false;
        
        
        if (id == null || id.trim().isEmpty()) {
            response.getWriter().write("아이디를 입력하세요.");
            return;
        }
        
        boolean isMatch = matchesRegex(id, regex);
        if (!isMatch) {
        	response.getWriter().write("잘못된 형식의 아이디입니다.");
        	return;
        }

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT COUNT(*) FROM member WHERE id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, id);
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next() && rs.getInt(1) > 0) {
                            isIdTaken = true;
                        }
                    }
                }
            }
        } catch (Exception e) {
            throw new ServletException("DB interaction failed", e);
        }

        if (isIdTaken) {
            response.getWriter().write("이미 사용중인 아이디입니다.");
        } else {
            response.getWriter().write("사용 가능한 아이디입니다.");
        }
    }
    
    public boolean matchesRegex(String id, String regex) {
    	Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(id);
        
        return matcher.matches();
    }
}
