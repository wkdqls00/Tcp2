package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScriptwriteupdateDAO;

@WebServlet("/DeleteScript")
public class DeleteScriptServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int script_idx = Integer.parseInt(request.getParameter("script_idx"));

        ScriptwriteupdateDAO swud = new ScriptwriteupdateDAO();
        int result = swud.scriptWriteUpdate(script_idx);

        if (result > 0) {
            response.getWriter().write("게시글이 성공적으로 삭제되었습니다.");
        } else {
            response.getWriter().write("게시글 삭제에 실패했습니다.");
        }
    }
}
