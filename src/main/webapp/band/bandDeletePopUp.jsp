<%@page import="dao.BandDeleteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script>
    alert("삭제되었습니다!");
    </script>
<%
	BandDeleteDAO bdDAO = new BandDeleteDAO();

	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	
	bdDAO.bandDelete(meet_idx);
	
	response.sendRedirect("band/band_main.jsp");
%>