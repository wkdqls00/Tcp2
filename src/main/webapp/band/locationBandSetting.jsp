<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession hs = request.getSession();
	int member_idx = (int)hs.getAttribute("userIdx");
    int meet_idx = (Integer)request.getAttribute("meet_idx");
    response.sendRedirect("Controller?command=band_setting&meet_idx=" + meet_idx);
    
%>
