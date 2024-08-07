package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import dto.*;

public class BandMainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession hs = request.getSession();
		Integer member_idx = (Integer)request.getSession().getAttribute("userIdx");
		PrintWriter out = response.getWriter();
		
		if(member_idx == null) {
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
		
		// 내 가입 밴드 출력
		MeetIntroduceWriteDAO mbwDao = new MeetIntroduceWriteDAO();
		
		MybandDAO mbDao = new MybandDAO();

		ArrayList<MybandDTO> mbListDao = new ArrayList<>();

		try { 
			mbListDao = mbDao.selectMybandDTO(member_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		SelectBandDAO selectDao = new SelectBandDAO();
		
		//소모임 지역 idx
		SelectMeetAreaIdxDTO selectDto = null;
		try {
			selectDto = selectDao.selectMeetAreaIdxDTO(member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int meet_area_idx = selectDto.getMeet_area_idx();
		
		//지역별 소모임 출력
		ArrayList<SelectBandAreaDTO> areaListDao = new ArrayList<>();
		try {
			areaListDao = selectDao.selectBandAreaDTO(meet_area_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			SelectBandAreaDTO areaDetailDto = selectDao.selectAreaDetailDTO(meet_area_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//멤버 수 출력
		MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
		
		//모든 밴드 출력
		ArrayList<SelectAllBandDTO> bandListDao = new ArrayList<>();
		try {
			bandListDao = selectDao.selectAllBandDTO();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 밴드 가입 여부
		NoJoinMeetDAO njDao = new NoJoinMeetDAO();
		
		System.out.println("user : " + member_idx);
		
		request.setAttribute("member_idx", member_idx);
		request.setAttribute("bandListDao", bandListDao);
		request.setAttribute("mbListDao", mbListDao);
		request.setAttribute("miDao", miDao);
		
		request.getRequestDispatcher("band/band_main.jsp").forward(request, response);
	}

}
