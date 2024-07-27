package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.ScriptwriteInDAO;


@WebServlet("/Ajaxcomment_regServlet")
public class Ajaxcomment_regServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET 요청이 들어옴!");	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int play_idx = Integer.parseInt(request.getParameter("play_idx"));
		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		String title = (request.getParameter("title"));
		String content = (request.getParameter("content"));
		int star_rating = Integer.parseInt(request.getParameter("star_rating"));
		
		ScriptwriteInDAO swid = new ScriptwriteInDAO();
				
		swid.scriptwriteIn(play_idx, member_idx, title, content, star_rating);
		
		request.getRequestDispatcher("/ticketlink/Prefor.detail(C).jsp?play_idx=486&playhall_idx=697").forward(request, response);
		
		
		response.setContentType("application/json; charset=utf-8");
	
		
		
	}
}
