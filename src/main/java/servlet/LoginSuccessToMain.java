package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;
import dao.Ticket_checkDao;

/**
 * Servlet implementation class Ex10Servlet
 */
@WebServlet("/LoginSuccessToMain") // 지금은 티켓예매확인 사이트로 이동하게 해놓음
public class LoginSuccessToMain extends HttpServlet { // 나중에 toMain 으로 바꿀거임 
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		LoginDao lDao = new LoginDao();
		int userIdx = -1;
		boolean result = false;
		
		try {
			userIdx = lDao.responseIdx(id, pw); // LoginDao로 로그인 
			result = userIdx > 0;

			if(result) {
			HttpSession hs = request.getSession();
			Ticket_checkDao tcdao = new Ticket_checkDao();
			int totalT = tcdao.check_total_countY(userIdx);
			hs.setAttribute("totalT", totalT); // 세션에다가 총 예매 건을 설정 
			hs.setAttribute("userIdx", userIdx); // 세션에다가 idx 값을 섫정
			System.out.println("로그인성공");
			System.out.println(userIdx);
			response.sendRedirect("/Tcp2/Ticket_checkServlet"); // 로그인 성공하면 idx를 세션에 저장하고 넘어감
			} else { 
				request.setAttribute("loginError", true); // 이게 아마 loginError라는 속성을 만들고 true라는 값을 줌, 로그인 페이지에서 조건문으로 이 속성이 null이 아니면 에러문 block 으로
				System.out.println("로그인실패");
				request.getRequestDispatcher("/ticketlink/Login/Login.jsp").forward(request, response); // 로그인 실패하면 값을 가지고? 제자리
			}  
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
