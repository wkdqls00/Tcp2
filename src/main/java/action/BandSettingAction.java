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

public class BandSettingAction implements Action {
	
	public String gender(String gender) {
    	String result = "";
    	if (gender != null) {
	    	if(gender.equals("M")){
	    		result = "남자";
	    	} else if (gender.equals("F")){
	    		result = "여자";
	    	} 
    	} else {
    		result = "제한없음";
    	}
    	return result;
    }

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs = request.getSession();
		Integer member_idx = (Integer)request.getSession().getAttribute("userIdx");
		
		int meet_idx = 0;
		if(request.getParameter("meet_idx")==null) {
			meet_idx = (Integer)request.getAttribute("meet_idx");
		} else {
			meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
		}
		
		// meet_idx 별 세팅값 출력
		MeetMemberSettingPrintDAO mmspDao = new MeetMemberSettingPrintDAO();
		ArrayList<MeetMemberSettingPrintDTO> mmspListDTO = new ArrayList<>();
		try {
			mmspListDTO = mmspDao.selectMeetMemberSettingPrintDTO(meet_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// meet_idx에 따라 밴드 이름, 프로필 사진 출력
		MeetSettingPrintDAO mspDAO = new MeetSettingPrintDAO();
		MeetSettingPrintDTO mspDTO = null;
		try {
			mspDTO = mspDAO.selectMeetSettingPrintDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 밴드 왼쪽 소개
		MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
		MeetIntroduceWriteDTO miDto =  null;
		try {
			miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
		} catch(SQLException e) {
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
		// 밴드 공개 여부
		BandPublicOkDAO bDao = new BandPublicOkDAO();
		BandPublicOkDTO bOkDTO = null;
		try {
			bOkDTO = bDao.selectBandPublicOkDTO(meet_idx);
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
		
		// 채팅 목록 출력
		ChatListDAO cDao = new ChatListDAO();
		ArrayList<ChatListDTO> chatListDto = new ArrayList<>();

		try {
			chatListDto = cDao.selectChatListDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JoinConditionPrintDAO jcpDAO = new JoinConditionPrintDAO();
		JoinConditionPrintDTO jcpListDTO = null;
		try {
			jcpListDTO = jcpDAO.selectJoinConditionPrintDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 성별 String 메소드
		String gender = gender(jcpListDTO.getGender());
		
		request.setAttribute("member_idx", member_idx);
		request.setAttribute("meet_idx", meet_idx);
		request.setAttribute("mmspListDTO", mmspListDTO);
		request.setAttribute("miDto", miDto);
		request.setAttribute("mMemberProfilePrintDTO", mMemberProfilePrintDTO);
		request.setAttribute("bOkDTO", bOkDTO);
		request.setAttribute("mPrintListDTO", mPrintListDTO);
		request.setAttribute("jcpListDTO", jcpListDTO);
		request.setAttribute("chatListDto", chatListDto);
		request.setAttribute("gender", gender);
		
		request.getRequestDispatcher("band/myband_setting_leader.jsp").forward(request, response);
	}

}
