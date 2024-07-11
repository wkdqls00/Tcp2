<%@page import="dao.UpdateDelOkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <script>
    	alert("삭제되었습니다.");
    </script>
    
<%
	UpdateDelOkDAO udoDAO = new UpdateDelOkDAO();
	
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));
	
	int post_idx = Integer.parseInt(request.getParameter("post_idx"));
	udoDAO.updateDelOk(post_idx);
	
	response.sendRedirect("band/band_home.jsp?meet_idx=" + meet_idx + "&member_idx=" + member_idx);
%>