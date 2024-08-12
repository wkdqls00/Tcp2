package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dto.ShowInquiryInfoDTO;

public class InquirelistAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
        InquiryDAO dao = new InquiryDAO();
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
		ArrayList<ShowInquiryInfoDTO> list = dao.showInquiryInfo(userIdx);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/ticketlink/inquire/inquire_details.jsp").forward(request, response);
	}

}
