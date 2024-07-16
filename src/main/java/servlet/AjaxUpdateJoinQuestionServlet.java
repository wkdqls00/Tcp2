package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateJoinQuestionDAO;

@WebServlet("/AjaxUpdateJoinQuestionServlet")
public class AjaxUpdateJoinQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sub_q = request.getParameter("sub_q");
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		
		System.out.println(sub_q + ", " + meet_idx);
		
		UpdateJoinQuestionDAO updateDAO = new UpdateJoinQuestionDAO();
		updateDAO.updateJoinQ(sub_q, meet_idx);
	}
}
