package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateJoinBandSettingDAO;

@WebServlet("/AjaxBandJoinConditionAgeServlet")
public class AjaxBandJoinConditionAgeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		int age = Integer.parseInt(request.getParameter("age"));
		
		System.out.println(meet_idx + ", " + age);
		
		UpdateJoinBandSettingDAO updateDAO = new UpdateJoinBandSettingDAO();
		updateDAO.updateJoinBandSettingAge(age, meet_idx);
	}
}
