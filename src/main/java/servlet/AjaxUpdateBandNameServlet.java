package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateBandDAO;

@WebServlet("/AjaxUpdateBandNameServlet")
public class AjaxUpdateBandNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		
		System.out.println(name + ", " + meet_idx);
		
		UpdateBandDAO updateDAO = new UpdateBandDAO();
		updateDAO.updateBandName(name, meet_idx);
	}
}
