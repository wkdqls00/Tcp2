package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateJoinApplyDAO;

@WebServlet("/AjaxUpdateJoinApplyServlet")
public class AjaxUpdateJoinApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		String join_ok = request.getParameter("join_ok");
		
		System.out.println(meet_idx + ", " + join_ok);
		
		UpdateJoinApplyDAO ujaDAO = new UpdateJoinApplyDAO();
		ujaDAO.updateJoinApply(join_ok, meet_idx);
	}

}
