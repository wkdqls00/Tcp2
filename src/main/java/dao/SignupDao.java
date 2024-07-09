package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.Year;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupDaoServlet")
public class SignupDao extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String db_id = "user6";
    private static final String db_pw = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String detailed_address = request.getParameter("detailed_address");
        String gender = request.getParameter("gender");
        String age = request.getParameter("birth");
        int koreanAge = calculateKoreanAge(age);
        String birth = request.getParameter("birth");
        String reBirth = formatBirthDate(birth);
        String term1 = request.getParameter("terms1");
        String term2 = request.getParameter("terms2");
        String term3 = request.getParameter("terms3");
        String term4 = request.getParameter("terms4");
        String term5 = request.getParameter("terms5");

        if (gender.equals("1") || gender.equals("3")) {
            gender = "M";
        } else if (gender.equals("2") || gender.equals("4")) {
            gender = "W";
        }

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(db_url, db_id, db_pw);

            String sql = 
                      "INSERT INTO MEMBER (MEMBER_IDX, NICKNAME, EMAIL, ID, PW, NAME, "
                              + "PHONE, ADDRESS, DETAILED_ADDRESS, GENDER, AGE, BIRTH, "
                              + "JOIN_DATE, AGREE1, AGREE2, AGREE3, WITHDRAWAL, AGREE4, AGREE5)  "
                              + "VALUES (seq_member.nextval, ?, ?, ?, ?, "
                              + "?, ?, ?, ?, ?, ?, TO_DATE(?,'YYYY-MM-DD'),"
                              + "SYSDATE, ?, ?, ?, 'N', ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nickname);
            pstmt.setString(2, email);
            pstmt.setString(3, id);
            pstmt.setString(4, pw);
            pstmt.setString(5, name);
            pstmt.setString(6, phone);
            pstmt.setString(7, address);
            pstmt.setString(8, detailed_address);
            pstmt.setString(9, gender);
            pstmt.setInt(10, koreanAge);
            pstmt.setString(11, reBirth);
            pstmt.setString(12, term1);
            pstmt.setString(13, term2);
            pstmt.setString(14, term3);
            pstmt.setString(15, term4);
            pstmt.setString(16, term5);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                System.out.println(result + "행 업데이트");
            } else {
            	System.out.println("업데이트 실패");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("에러 발생: " + e.getMessage());
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        response.sendRedirect("/Tcp2/ticketlink/Login/Login.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().println("POST 요청을 사용하세요.");
    }

    private int calculateKoreanAge(String birthDateStr) {
        int birthYear = Integer.parseInt(birthDateStr.substring(0, 2));
        if (birthYear <= 23) {
            birthYear += 2000;
        } else {
            birthYear += 1900;
        }
        int currentYear = Year.now().getValue();
        return currentYear - birthYear + 1;
    }

    private String formatBirthDate(String birthDateStr) {
        int birthYear = Integer.parseInt(birthDateStr.substring(0, 2));
        if (birthYear <= 23) {
            birthYear += 2000;
        } else {
            birthYear += 1900;
        }
        return birthYear + birthDateStr.substring(2, 4) + birthDateStr.substring(4, 6);
    }
}

