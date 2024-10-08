package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateJoinQuestionDAO;

@WebServlet("/AjaxUpdateJoinQServlet")
public class AjaxUpdateJoinQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		String sub_qok = request.getParameter("sub_qok");
		
		System.out.println(meet_idx + ", " + sub_qok);
		
		UpdateJoinQuestionDAO updateDAO = new UpdateJoinQuestionDAO();
		updateDAO.updateJoinQuestion(sub_qok, meet_idx);
	}
}
