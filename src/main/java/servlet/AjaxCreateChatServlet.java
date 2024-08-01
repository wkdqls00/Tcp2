package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewChatRoomDAO;

@WebServlet("/AjaxCreateChatServlet")
public class AjaxCreateChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		String title = request.getParameter("title");
		
		NewChatRoomDAO ncDao = new NewChatRoomDAO();
		ncDao.newChatRoom(member_idx, title, meet_idx);
		
	}

}
