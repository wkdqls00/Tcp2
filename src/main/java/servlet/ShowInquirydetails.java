package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dto.ShowInquiryInfoDTO;

/**
 * Servlet implementation class ShowInquirydetails
 */
@WebServlet("/ShowInquirydetails")
public class ShowInquirydetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		int inquiry_idx = Integer.parseInt(request.getParameter("bno"));
		List<ShowInquiryInfoDTO> list = dao.showInquiryInfo(userIdx);
		System.out.println("asdasd");
		ShowInquiryInfoDTO dto = 
			list.stream().filter(a -> a.getInquiry_idx() == inquiry_idx).findFirst().orElse(null);//해당 idx 정보만 가져오기
		System.out.println("qweqwe");
		request.setAttribute("dto", dto);
		System.out.println("zxczxc");
		request.getRequestDispatcher("/ticketlink/inquire/inquire_content.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
