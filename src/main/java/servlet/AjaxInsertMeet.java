package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CreateMeetDAO;

@WebServlet("/AjaxInsertMeet")
public class AjaxInsertMeet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		String sub_q = request.getParameter("sub_q");
		
		
		System.out.println(name + " " + url + " " +member_idx + " " + sub_q);
		
		CreateMeetDAO cmDao = new CreateMeetDAO();
		cmDao.createMeet(name, url, member_idx, sub_q);
	}

}
