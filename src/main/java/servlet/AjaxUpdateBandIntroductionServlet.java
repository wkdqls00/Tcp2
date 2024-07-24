package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateBandDAO;

@WebServlet("/AjaxUpdateBandIntroductionServlet")
public class AjaxUpdateBandIntroductionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		int meet_area_idx = Integer.parseInt(request.getParameter("meet_area_idx"));
		System.out.println(title + meet_idx + meet_area_idx);
		
		UpdateBandDAO updateDAO = new UpdateBandDAO();
		updateDAO.updateBandIntroduction(title, meet_idx);
		updateDAO.updateBandArea(meet_area_idx, meet_idx);
	}
}
