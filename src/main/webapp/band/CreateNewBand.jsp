<%@page import="dao.CreateMeetDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	CreateMeetDAO cmDao = new CreateMeetDAO();
	String name = request.getParameter("name");
	String url = request.getParameter("url");
	String sub_q = request.getParameter("sub_q");
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));
	cmDao.createMeet(name, url, member_idx, sub_q);
	
	response.sendRedirect("band/band_main.jsp?member_idx=" + member_idx);
	

%>