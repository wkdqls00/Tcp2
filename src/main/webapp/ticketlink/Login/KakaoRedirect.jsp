<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<div>콜백</div>
	<script>
	 window.onload = function() {
	  	  console.log("페이지 로드 완료");
	  	  
	  	  // URL에서 인가 코드 추출
	  	  const urlParams = new URLSearchParams(window.location.search);
	  	  const code = urlParams.get('code');
	  	  console.log("인가 코드: " + code);

	  	  // 인가 코드가 있으면 토큰 요청
	  	  if (code) {
	  	    fetch('https://kauth.kakao.com/oauth/token', {
	  	      method: 'POST',
	  	      headers: {
	  	        'Content-Type': 'application/x-www-form-urlencoded'
	  	      },
	  	      body: `grant_type=authorization_code&client_id=7a031cf5f9ab77620ab76d3cf944f39a&redirect_uri=http://localhost:9090/Tcp2/ticketlink/Login/KakaoTest2.jsp&code=${code}`
	  	    })
	  	    .then(response => response.json())
	  	    .then(data => {
	  	      console.log("토큰 데이터: ", data);
	  	      const accessToken = data.access_token;

	  	      // 액세스 토큰을 사용하여 회원 정보 요청
	  	      fetch('https://kapi.kakao.com/v2/user/me', {
	  	        method: 'GET',
	  	        headers: {
	  	          'Authorization': `Bearer ${accessToken}`
	  	        }
	  	      })
	  	      .then(response => response.json())
	  	      .then(user => {
	  	        console.log("회원 정보: ", user);  // 회원 정보를 콘솔에 출력
	  	      })
	  	      .catch(error => console.error('회원 정보 요청 오류:', error));
	  	    })
	  	    .catch(error => console.error('토큰 요청 오류:', error));
	  	  }
	  	};
	</script>
</body>
</html>