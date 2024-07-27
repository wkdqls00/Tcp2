package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.ScriptDeleteDAO;

@WebServlet("/AjaxScriptDeleteServlet")
public class AjaxScriptDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("요청 들어옴.");
		
		// (JSON으로 받기). (post_idx)
		int script_idx = Integer.parseInt(request.getParameter("script_idx"));
		System.out.println(script_idx);
		
		// Dao 호출
		ScriptDeleteDAO sdDao = new ScriptDeleteDAO();
		try {
			sdDao.updateScriptDelete(script_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// JSON으로 보내기.
		String returnStr = "SUCCESS!";
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", returnStr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(jsonObj);
	}
}
