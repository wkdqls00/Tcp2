package action;

import java.io.IOException;
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
		HttpSession hs = request.getSession();
		Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");
		
		// 내 가입 밴드 출력
		MeetIntroduceWriteDAO mbwDao = new MeetIntroduceWriteDAO();
		
		MybandDAO mbDao = new MybandDAO();

		ArrayList<MybandDTO> mbListDao = new ArrayList<>();

		try { 
			mbListDao = mbDao.selectMybandDTO(userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		SelectBandDAO selectDao = new SelectBandDAO();
		
		//소모임 지역 idx
		SelectMeetAreaIdxDTO selectDto = null;
		try {
			selectDto = selectDao.selectMeetAreaIdxDTO(userIdx);
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
		
		System.out.println("user : " + userIdx);
		request.setAttribute("member_idx", userIdx);
		request.setAttribute("bandListDao", bandListDao);
		request.setAttribute("mbListDao", mbListDao);
		
		request.getRequestDispatcher("band/band_main.jsp").forward(request, response);
	}

}
