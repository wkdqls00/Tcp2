package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChatJoinDAO;

/**
 * Servlet implementation class AjaxChatJoinServlet
 */
@WebServlet("/AjaxChatJoinServlet")
public class AjaxChatJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		int chat_idx = Integer.parseInt(request.getParameter("chat_idx"));
		
		ChatJoinDAO cjDao = new ChatJoinDAO();
		cjDao.chatJoin(member_idx, chat_idx);
		
	}

}
