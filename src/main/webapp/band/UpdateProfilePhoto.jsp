<%@page import="dao.MeetNicknameSettingDAO"%>
<%@page import="dao.UpdateProfilePhotoSettingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UpdateProfilePhotoSettingDAO updateDao = new UpdateProfilePhotoSettingDAO();
	MeetNicknameSettingDAO mnDao = new MeetNicknameSettingDAO();
	
	HttpSession hs = request.getSession();
	int member_idx = (int)hs.getAttribute("userIdx");
	
	
	String profile = request.getParameter("profile");
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	String nickname = request.getParameter("nickname");
	
	
	updateDao.updateProfilePhotoSetting(profile, member_idx, meet_idx);
	
	mnDao.meetNicknameSetting(nickname, member_idx, meet_idx);
	
	
	response.sendRedirect("band/band_setting_reader.jsp?member_idx=" + member_idx + "&meet_idx=" + meet_idx);
%>