package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScriptwriteInDAO;

public class WriteScriptAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");
		System.out.println("user : " + userIdx);
		if(userIdx == null) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title></title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='/Tcp2/Controller?command=login'");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");	
			return;
		}
    	System.out.println(1);
    	int play_idx = Integer.parseInt(request.getParameter("play_idx"));
    	System.out.println(2);
    	int star_rating = Integer.parseInt(request.getParameter("star2"));
    	System.out.println(4);
    	String title = request.getParameter("title");
    	System.out.println(5);
    	String content = request.getParameter("content");
    	System.out.println(6);
    	
    	
    	if(new ScriptwriteInDAO().insertScript(play_idx, userIdx, title, content, star_rating)) {
    		response.sendRedirect("/Tcp2/Controller?command=playinfo&play_idx=" + play_idx);    		
    	}else {
    		out.println("<html>");
			out.println("<head>");
			out.println("<title></title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<script>");
			out.println("alert('해당 공연에 대한 관람 기록이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");	
			return;
    	}
        
        		
	}

}
