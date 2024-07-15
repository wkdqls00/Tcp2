package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UpdateBandDAO;

@WebServlet("/AjaxPublicOkServlet")
public class AjaxPublicOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		String public_ok = request.getParameter("public_ok");
		
		System.out.println(meet_idx + ", " + public_ok);
		
		UpdateBandDAO ubDAO = new UpdateBandDAO();
		ubDAO.updatePublicOk(public_ok, meet_idx);
	}
}
