<%@page import="dao.UpdateLeaveBandDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
    	alert("탈퇴되었습니다.");
    </script>
   
<%
	UpdateLeaveBandDAO ulbDAO = new UpdateLeaveBandDAO();

	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));
	ulbDAO.updateLeaveBand(meet_idx, member_idx);
	
	response.sendRedirect("band/band_main.jsp");
%>
