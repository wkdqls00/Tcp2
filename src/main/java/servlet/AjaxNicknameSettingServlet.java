package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MeetNicknameSettingDAO;

@WebServlet("/AjaxNicknameSettingServlet")
public class AjaxNicknameSettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		String nickname = request.getParameter("nickname");
		
		System.out.println(meet_idx + ", " + member_idx + ", " + nickname);
		
		MeetNicknameSettingDAO updateDAO = new MeetNicknameSettingDAO();
		updateDAO.meetNicknameSetting(nickname, member_idx, meet_idx);
		
		
		String returnStr = "SUCCESS!";
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", returnStr);
		
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(jsonObj);
	}
}
