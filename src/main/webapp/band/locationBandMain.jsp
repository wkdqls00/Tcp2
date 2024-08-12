<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession hs = request.getSession();
	int member_idx = (int)hs.getAttribute("userIdx");
    response.sendRedirect("Controller?band_main&member_idx=" + member_idx);

%>