package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;

@WebServlet("/InquireCompleted")
public class InquireCompleted extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		String category = request.getParameter("category");
		String email = "";
		email = request.getParameter("email") + "@" + request.getParameter("emaildomain");
		String reservationnumParam = request.getParameter("reservationnum");
		Integer reservationnum = null;
		if (reservationnumParam != null) {
			String cleanedReservationNum = reservationnumParam.replaceAll("[^0-9]", "");
			if (!cleanedReservationNum.isEmpty()) {
				reservationnum = Integer.parseInt(cleanedReservationNum);
			}
		}
		if (reservationnum == null) {
			reservationnum = -1;
		}
		String product = request.getParameter("product");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String agreecheck = request.getParameter("agreecheck").equals("on") ? "Y" : "N";// 약관 동의하면 y 아니면 n
		InquiryDAO dao = new InquiryDAO();
		dao.insertinquiry(category, email, reservationnum, product, title, content, agreecheck, userIdx);
		request.getRequestDispatcher("/ticketlink/inquire/inquire_success.html").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}