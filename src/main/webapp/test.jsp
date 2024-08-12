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
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    document.body.style.backgroundColor = 'rgb(' + r + ', ' + g + ', ' + b + ')';
	var width = getRandomInt(20, 1200);
	var height = getRandomInt(10, 900);
	var left = getRandomInt(0, window.innerWidth - 100);
	var top = getRandomInt(0, window.innerHeight - 100);
	window.open('/Tcp2/test.jsp', '', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);	
	function getRandomInt(min, max) {
	    return Math.floor(Math.random() * (max - min + 1)) + min;
	    alert('인증번호는 {512524}입니다.');
	}
	
	</script>

</body>
</html>