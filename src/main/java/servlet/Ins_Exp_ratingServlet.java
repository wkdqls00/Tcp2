package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Exp_RatingDAO;


@WebServlet("/Ins_Exp_ratingServlet")
public class Ins_Exp_ratingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");
		System.out.println("user : "+ userIdx);
		if (userIdx == null) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title></title>");
			out.println("</head>");
			out.println("<body");
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='/Tcp2/ticketlink/Login/Login.js'");
			out.println("</script>");
			out.println("</body>");
			out.println("<html>");
			
			return;
		}
	
		
		String content = request.getParameter("content");
		System.out.println(3);
		int play_idx = Integer.parseInt(request.getParameter("play_idx"));
		System.out.println(4);
		
		// erd.insertExp_Rating(member_idx, content, play_idx);
		
		try {
			Exp_RatingDAO erd = new Exp_RatingDAO();
			erd.insertExp_Rating(userIdx, content, play_idx);
		}catch(Exception e) {
			e.printStackTrace();
		}

    	response.sendRedirect("http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=486");

		
	}


//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}

}
