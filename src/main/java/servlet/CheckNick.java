package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

@WebServlet("/CheckNick")
public class CheckNick extends HttpServlet {

    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "user6";
    private static final String DB_PASSWORD = "1234";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	String nick = request.getParameter("nickname").trim();
        String regex = "^(?=.*[가-힣a-zA-Z])([가-힣a-zA-Z0-9]){2,10}$";
        boolean isIdTaken = false;
        
        
        
        if (nick == null || nick.trim().isEmpty()) {
            response.getWriter().write("닉네임을 입력하세요.");
            return;
        }
        
        boolean isMatch = matchesRegex(nick, regex);
        if (!isMatch) {
            response.getWriter().write("닉네임 형식이 올바르지 않습니다.");
            return;
        }
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT COUNT(*) FROM member WHERE nickname = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, nick);
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
            response.getWriter().write("사용 불가능한 닉네임입니다.");
        } else {
            response.getWriter().write("사용 가능한 닉네임입니다.");
        }
    }
    
    public static boolean matchesRegex(String input, String regex) {
    
    	Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        
        return matcher.matches();
    }
}
