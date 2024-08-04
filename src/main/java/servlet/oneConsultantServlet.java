package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/oneConsultantServlet")
public class oneConsultantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   		request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().append("Served at: ").append(request.getContextPath());
			PrintWriter out = response.getWriter();
			Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");
			System.out.println("user : " + userIdx);
			out.println("<html>");
			out.println("<head>");
			out.println("<title></title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<script>");
			if(userIdx == null) {
				out.println("alert('로그인이 필요합니다.');");
				out.println("location.href='/Tcp2/ticketlink/Login/Login.jsp'");
				out.println("</script>");
				out.println("</body>");
				out.println("</html>");	
			//  response.sendRedirect("Inquire.html");
			}

			window.open("/Tcp2/oneConsultantServlet?member_id=" + userIdx);
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//	}
	}
}
