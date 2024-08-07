<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	
for(let i = 0; i < 100; i++){
	var width = getRandomInt(20, 1200);
	var height = getRandomInt(10, 900);
	var left = getRandomInt(0, window.innerWidth - 100);
	var top = getRandomInt(0, window.innerHeight - 100);
	window.open('/Tcp2/test.jsp', '', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);	
	}	
	function getRandomInt(min, max) {
	    return Math.floor(Math.random() * (max - min + 1)) + min;
	}
	</script>

</body>
</html>