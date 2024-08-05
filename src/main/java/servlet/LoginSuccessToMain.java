package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;
import dao.Ticket_checkDao;

@WebServlet("/LoginSuccessToMain") 
public class LoginSuccessToMain extends HttpServlet { 
    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("userId");
        String pw = request.getParameter("userPw");
        boolean autoLogin = false;

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("id".equals(cookie.getName())) {
                    id = cookie.getValue();
                    autoLogin = true;
                    break;
                }
            }
        }

        if (id == null && pw == null && !autoLogin) {
            // ID나 PW가 없는 경우 로그인 페이지로 리디렉션
        	System.out.println("쿠키가 없는 회원");
        	request.setAttribute("cookie", true);
        	request.getRequestDispatcher("/ticketlink/Login/Login.jsp").forward(request, response);
            return;
        }

        LoginDao lDao = new LoginDao();
        int userIdx = -1;
        boolean result = false;

        try {
            if (autoLogin) {
                userIdx = lDao.cookieIdx(id);
            } else {
                userIdx = lDao.responseIdx(id, pw);
            }
            result = userIdx > 0;

            if (result) {
                if (!autoLogin) {
                    String saveSess = request.getParameter("saveSess");
                    if ("Y".equals(saveSess)) {
                        Cookie cookie = new Cookie("id", id);
                        cookie.setMaxAge(60 * 30); // 30분으로 설정했음 
                        cookie.setPath("/"); // 쿠키 경로 설정
                        response.addCookie(cookie);
                        System.out.println("쿠키 저장됨.");
                    }
                }
                HttpSession hs = request.getSession();
                Ticket_checkDao tcdao = new Ticket_checkDao();
                int totalT = tcdao.check_total_countY(userIdx);
                hs.setAttribute("totalT", totalT);
                hs.setAttribute("userIdx", userIdx);
                System.out.println("IDX= " + userIdx + "번 회원 로그인");

                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<html>");
                response.getWriter().println("<head>");
                response.getWriter().println("<title>로그인 성공</title>");
                response.getWriter().println("<meta http-equiv='refresh' content='1;url=/Tcp2/ticketlink/main.jsp'>"); // 지금 일단 메인페이지 말고 마이페이지로 경로 해놓음
                response.getWriter().println("<script type='text/javascript'>"); 
                response.getWriter().println("alert('로그인 되었습니다.');");
                response.getWriter().println("window.close();");
                response.getWriter().println("</script>");                
                response.getWriter().println("</head>");
                response.getWriter().println("<body></body>");
                response.getWriter().println("</html>");
            } else {
            	request.setAttribute("cookie", true);
                request.setAttribute("loginError", true);
                System.out.println("로그인 실패");
                request.getRequestDispatcher("/ticketlink/Login/Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
