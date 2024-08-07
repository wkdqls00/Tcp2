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

public class BandPublicSettingAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		int member_idx = (int)hs.getAttribute("userIdx");
		
		int meet_idx = 0;
		if(request.getParameter("meet_idx")==null) {
			meet_idx = (Integer)request.getAttribute("meet_idx");
		} else {
			meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		}
		
		MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
		MeetIntroduceWriteDTO miDto = null;
		try {
			miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 밴드공개 여부
		BandPublicOkDAO bpoDAO = new BandPublicOkDAO();
		BandPublicOkDTO bpoDTO = null;
		try {
			bpoDTO = bpoDAO.selectBandPublicOkDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 내 프로필 출력
		MeetMemberProfilePrintDAO mMemberProfilePrintDAO = new MeetMemberProfilePrintDAO();
		MeetMemberProfilePrintDTO mMemberProfilePrintDTO = null;
		try {
			mMemberProfilePrintDTO = mMemberProfilePrintDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 채팅 목록 출력
		ChatListDAO cDao = new ChatListDAO();
		ArrayList<ChatListDTO> chatListDto = new ArrayList<>();
		try {
			chatListDto = cDao.selectChatListDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		// 밴드 글 목록 출력
		MeetPostListPrintDAO mPrintDAO = new MeetPostListPrintDAO();
		ArrayList<MeetPostListPrintDTO> mPrintListDTO = new ArrayList<>();
		try {
			mPrintListDTO = mPrintDAO.selectMeetPostListPrintDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("member_idx", member_idx);
		request.setAttribute("meet_idx", meet_idx);
		request.setAttribute("mPrintListDTO", mPrintListDTO);
		request.setAttribute("chatListDto", chatListDto);
		request.setAttribute("mMemberProfilePrintDTO", mMemberProfilePrintDTO);
		request.setAttribute("bpoDTO", bpoDTO);
		request.setAttribute("miDto", miDto);
		request.getRequestDispatcher("band/band_public_or_not.jsp").forward(request, response);
	
	}

}
