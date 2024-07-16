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
		String area = request.getParameter("area");
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		
		System.out.println(title + area + meet_idx);
		
		UpdateBandDAO updateDAO = new UpdateBandDAO();
		updateDAO.updateBandIntroduction(title, meet_idx);
		updateDAO.updateBandArea(area, meet_idx);
	}
}
