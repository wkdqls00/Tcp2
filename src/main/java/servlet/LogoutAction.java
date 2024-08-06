package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LogoutAction
 */
@WebServlet("/LogoutAction")
public class LogoutAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession(false);
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		        if ("id".equals(cookie.getName())) {
		            cookie.setMaxAge(0); // 만료 시간을 0으로 설정
		            cookie.setPath("/"); 
		            response.addCookie(cookie); 
		            break;
		        }
		    }
		}
//		int idx = (int)hs.getAttribute("userIdx");
		if(hs != null) {
//			System.out.println(idx + "회원 로그아웃.");
			hs.invalidate();
			response.sendRedirect("/Tcp2/ticketlink/main.jsp");
		} else {
			System.out.println("로그인 되어 있는 상태 아님.");
		}
	}
}
