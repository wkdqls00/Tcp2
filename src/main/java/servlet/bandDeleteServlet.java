package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BandDeleteDAO;


@WebServlet("/bandDeleteServlet")
public class bandDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BandDeleteDAO bdDAO = new BandDeleteDAO();
		RequestDispatcher rd = request.getRequestDispatcher("/band/bandDeletePopUp.jsp");
		rd.forward(request, response);
	}

}
