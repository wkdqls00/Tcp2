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

public class BandHomeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession hs = request.getSession();
		Integer member_idx = (Integer)request.getSession().getAttribute("userIdx");
		
		int meet_idx = Integer.parseInt(request.getParameter("meet_idx")); 
		
		// 내 프로필 출력
		MeetMemberProfilePrintDAO mMemberProfilePrintDAO = new MeetMemberProfilePrintDAO();
		MeetMemberProfilePrintDTO mMemberProfilePrintDTO = null;
		try {
			mMemberProfilePrintDTO = mMemberProfilePrintDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 밴드 소개
		MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
		MeetIntroduceWriteDTO miDto = null;
		try {
			miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 밴드 소개글
		MeetInfoWriteDAO mDao = new MeetInfoWriteDAO();
		MeetInfoWriteDTO mDto = null;
		try {
			mDto = mDao.selectMeetInfoWriteDTO(meet_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 밴드 가입질문
		MeetJoinQnAPrintDAO mAPrintDAO = new MeetJoinQnAPrintDAO();
		MeetJoinQnAPrintDTO mAPrintDTO = null;
		try {
			mAPrintDTO = mAPrintDAO.selectMeetJoinQnAPrintDTO(meet_idx);
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
		
		// 댓글 목록 출력
		CommentListViewDAO clViewDAO = new CommentListViewDAO();
		ArrayList<CommentListViewDTO> clListDTO = new ArrayList<>();
		
		// 밴드 글 좋아요 갯수
		LikeCountDAO lCountDAO = new LikeCountDAO();
		
		// 댓글 작성 시간 출력 (~시간, ~분, ~일 전)
		MeetCommentElapsedTimeDAO mCDao = new MeetCommentElapsedTimeDAO();
		
		// 밴드 가입 여부
		NoJoinMeetDAO njDao = new NoJoinMeetDAO();
		
		// 팝업 : 글 디테일 뷰
		MeetWriteViewDAO mwDao = new MeetWriteViewDAO();
		
		// 채팅 목록 출력
		ChatListDAO cDao = new ChatListDAO();
		ArrayList<ChatListDTO> chatListDto = new ArrayList<>();
		
		try {
			chatListDto = cDao.selectChatListDTO(meet_idx);
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
		
		//게시글 삭제 여부
		UpdateDelOkDAO udoDAO = new UpdateDelOkDAO();
		
		//meet_member_idx 꺼내오기
		int meet_member_idx = 0;
		try {
			meet_member_idx = mPrintDAO.postMeetMemberIdx(member_idx, meet_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		SelectBandDAO sDao = new SelectBandDAO();
		SelectNicknameDTO sDto = null;
		try {
			sDto = sDao.selectNicknameDTO(member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//member_idx 로 닉네임 가져오기
		String nickname = sDto.getNickname();
		
		request.setAttribute("member_idx", member_idx);
		request.setAttribute("meet_idx", meet_idx);
		request.setAttribute("meet_member_idx", meet_member_idx);
		request.setAttribute("nickname", nickname);
		request.setAttribute("miDto", miDto);
		request.setAttribute("miDao", miDao);
		request.setAttribute("mMemberProfilePrintDTO", mMemberProfilePrintDTO);
		request.setAttribute("bOkDTO", bOkDTO);
		request.setAttribute("mDto", mDto);
		request.setAttribute("chatListDto", chatListDto);
		request.setAttribute("mPrintListDTO", mPrintListDTO);
		request.setAttribute("clListDTO", clListDTO);
		request.setAttribute("mAPrintDTO", mAPrintDTO);
		request.setAttribute("udoDAO", udoDAO);
		request.setAttribute("mwDao", mwDao);
		request.setAttribute("njDao", njDao);
		request.setAttribute("mCDao", mCDao);
		request.setAttribute("lCountDAO", lCountDAO);
		request.setAttribute("clViewDAO", clViewDAO);
		
		
		request.getRequestDispatcher("band/band_home.jsp").forward(request, response);
	}

}
