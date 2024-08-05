package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScriptwriteupdateDAO;

@WebServlet("/DeleteScriptAction")
public class DeleteScriptAction extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	response.setContentType(getServletInfo());
    	int script_idx = Integer.parseInt(request.getParameter("script_idx"));

        ScriptwriteupdateDAO swud = new ScriptwriteupdateDAO();
        int result = swud.scriptWriteUpdate(script_idx);

        if (result > 0) {
            response.getWriter().write("게시글이 성공적으로 삭제되었습니다.");
            request.getRequestDispatcher("/ScriptManagementServlet").forward(request, response);
        } else {
            response.getWriter().write("게시글 삭제에 실패했습니다.");
            request.getRequestDispatcher("/ticketlink/Mypage/review_concert.jsp").forward(request, response);
        }
        
        
    }
}
