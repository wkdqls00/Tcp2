<%@page import="dao.InsertPostGoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	InsertPostGoodDAO ispDAO = new InsertPostGoodDAO();

	int post_idx = Integer.parseInt(request.getParameter("post_idx"));
	int meet_member_idx = Integer.parseInt(request.getParameter("meet_member_idx"));
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));
	
	ispDAO.insertPostGood(post_idx, meet_member_idx);
	
	response.sendRedirect("band/band_home.jsp?meet_idx=" + meet_idx + "&member_idx=" + member_idx );
%>
