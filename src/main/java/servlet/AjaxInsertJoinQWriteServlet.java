package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MeetJoinQuestionWriteDAO;

@WebServlet("/AjaxInsertJoinQWriteServlet")
public class AjaxInsertJoinQWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		String sub_a = request.getParameter("sub_a");
		String nickname = request.getParameter("nickname");
		
		MeetJoinQuestionWriteDAO mjqwDAO = new MeetJoinQuestionWriteDAO();
		mjqwDAO.meetJoinQuestionWrite(member_idx, meet_idx, sub_a, nickname);
	}
}
