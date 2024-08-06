package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BandHomeAction;
import action.BandMainAction;
import action.BandMainHometown;
import action.BandNewCreateAction;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		String command = request.getParameter("command");
		System.out.println("컨트롤러 command : " + command);
		
		Action action = null;

		switch(command) {
			// 밴드 메인 페이지
			case "band_main": action = new BandMainAction(); break;
			case "band_main_hometown": action = new BandMainHometown(); break;
			case "band_new_create": action = new BandNewCreateAction(); break;
			
			// 밴드 홈페이지
			case "band_home": action = new BandHomeAction(); break;
		}
		
		action.execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}










