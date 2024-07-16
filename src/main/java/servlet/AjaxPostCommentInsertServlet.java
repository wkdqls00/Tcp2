package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.NewPostCommentDAO;

@WebServlet("/AjaxPostCommentInsertServlet")
public class AjaxPostCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("요청 들어옴.");
		// (JSON으로 받기).
		int meet_member_idx = Integer.parseInt(request.getParameter("meet_member_idx"));
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		String content = request.getParameter("content");
		String del_ok = "N";

		System.out.println(post_idx + meet_member_idx + content + del_ok);
		
		// Dao 호출
		NewPostCommentDAO pcDao = new NewPostCommentDAO();
		pcDao.newPostComment(post_idx, meet_member_idx, content, del_ok);
		
		// JSON으로 보내기.
		String returnStr = "SUCCESS!";
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", returnStr);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(jsonObj);
		
	}

}
