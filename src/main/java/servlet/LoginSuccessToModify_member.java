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

/**
 * Servlet implementation class Ex10Servlet
 */
@WebServlet("/LoginSuccessToModify_member") // 지금은 티켓예매확인 사이트로 이동하게 해놓음
public class LoginSuccessToModify_member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		LoginDao lDao = new LoginDao();
		int userIdx = -1;
		boolean result = false;
		
		try {
			userIdx = lDao.responseIdx(id, pw);
			result = userIdx > 0;

			if(result) {
			HttpSession hs = request.getSession();
			hs.setAttribute("userIdx", userIdx);
			System.out.println("로그인성공");
			System.out.println(userIdx);
			response.sendRedirect("/Tcp2/Modify_memberServlet");
			} else {
				request.setAttribute("loginError", true);
				System.out.println("로그인실패");
				System.out.println(userIdx);
				request.getRequestDispatcher("/ticketlink/Modify/Modify_mainServlet").forward(request, response);
				
			}  
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
