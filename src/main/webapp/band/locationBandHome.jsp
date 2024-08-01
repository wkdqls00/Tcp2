<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession hs = request.getSession();
	int member_idx = (int)hs.getAttribute("userIdx");
	int meet_idx = (Integer)request.getAttribute("meet_idx");
	response.sendRedirect("band/band_home.jsp?member_idx=" + member_idx + "&meet_idx=" + meet_idx);
%>