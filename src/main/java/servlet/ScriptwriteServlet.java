package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScriptwriteInDAO;

@WebServlet("/ScriptwriteServlet")
public class ScriptwriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
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
			out.println("location.href='/Tcp2/ticketlink/Login/Login.jsp'");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");	
			return;
		}
    	System.out.println(1);
    	int play_idx = Integer.parseInt(request.getParameter("play_idx"));
    	System.out.println(2);
    	System.out.println(request.getParameter("star2"));
    	int star_rating = Integer.parseInt(request.getParameter("star2"));
    	System.out.println(4);
    	String title = request.getParameter("title");
    	System.out.println(5);
    	String content = request.getParameter("content");
    	System.out.println(6);
    	
    	try {
    		new ScriptwriteInDAO().scriptwriteIn(play_idx, userIdx, title, content, star_rating);
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
      	
    	response.sendRedirect("http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=486");
    }


    
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        
//    }

   
}
