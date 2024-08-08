package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TicketlinkMainDao;
import dto.RecommandPDTO;
import dto.SearchResultDTO;


public class LogoutAction2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
