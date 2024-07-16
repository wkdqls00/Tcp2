package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateJoinBandSettingDAO;

@WebServlet("/AjaxBandJoinConditionGender")
public class AjaxBandJoinConditionGender extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gender = request.getParameter("gender");
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		
		System.out.println(gender + ", " + meet_idx);
		
		UpdateJoinBandSettingDAO updateDAO = new UpdateJoinBandSettingDAO();
		updateDAO.updateJoinBandSettingGender(gender, meet_idx);
	}
}
