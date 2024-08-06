<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%for(int i = 0; i < 1; i ++) {%>
	
	<script>
	window.open('/Tcp2/test.jsp', '', 'width=getRandomInt(20, 900);, height=getRandomInt(10, 500);');
	</script>
	<%
	} %>
	<script>
	function getRandomInt(min, max) {
	    return Math.floor(Math.random() * (max - min + 1)) + min;
	}
	</script>
</body>
</html>