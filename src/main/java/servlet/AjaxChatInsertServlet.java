package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MessageSendDAO;

@WebServlet("/AjaxChatInsertServlet")
public class AjaxChatInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		int chat_idx = Integer.parseInt(request.getParameter("chat_idx"));
		String content = request.getParameter("content");
		
		MessageSendDAO msgDAO = new MessageSendDAO();
		msgDAO.messageSend(chat_idx, member_idx, content);
	
	}

}
