package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.PostWriteDAO;

@WebServlet("/AjaxPostInsertServlet")
public class AjaxPostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청 들어옴.");
		// (JSON으로 받기).
		int meet_member_idx = Integer.parseInt(request.getParameter("meet_member_idx"));
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		String content = request.getParameter("content");
		String file_url = request.getParameter("file_url");

		System.out.println(meet_member_idx);
		
		if (file_url == null) {
			file_url = null;
		}
		
		// Dao 호출
		PostWriteDAO pDao = new PostWriteDAO();
		pDao.postWrite(meet_idx, meet_member_idx, content, file_url);
		
		// JSON으로 보내기.
		String returnStr = "SUCCESS!";
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", returnStr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(jsonObj);
	}

}
