/*Kakao.init('29946af90ab4fa1fb1025300f26237af');  // 여기에 본인의 JavaScript 키를 입력하세요
console.log(Kakao.isInitialized());  // SDK 초기화 여부를 확인하는 로그
document.getElementById('kakao-login-btn').addEventListener('click', function() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:9090/Tcp2/KakaoServlet'  // 설정한 리디렉션 URI
    });
  });*/
  
/* Kakao.init('29946af90ab4fa1fb1025300f26237af');
function kakaoLogin() {
    Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    $.ajax({
                        type: 'POST',
                        url: '/Tcp2/KakaoServlet',
                        data: JSON.stringify(response), // JSON 문자열로 변환하여 전달
                        contentType: 'application/json; charset=utf-8',
                        success: function (result) {
                            alert('회원가입 성공: ' + result);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.error('회원가입 실패: ', textStatus, errorThrown);
                            alert('회원가입 실패: ' + jqXHR.responseText);
                        }
                    });
                },
                fail: function (error) {
                    alert(JSON.stringify(error));
                }
            });
        },
        fail: function (error) {
            alert(JSON.stringify(error));
        }
    });
}*/

// 카카오 SDK 초기화
        Kakao.init('29946af90ab4fa1fb1025300f26237af'); // JavaScript 키로 초기화

        function loginWithKakao() {
            Kakao.Auth.login({
                success: function(authObj) {
                    console.log(authObj); // 로그인 성공 시, authObj에 토큰 정보가 담김
                    alert(authObj.access_token);
                    sendTokenToServer(authObj.access_token);
                },
                fail: function(err) {
                    console.error(err);
                }
            });
        }

        function sendTokenToServer(token) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/Tcp2/KakaoServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log(xhr.responseText);
                }
            };
            xhr.send("token=" + token);
        }

 /* window.onload = function() {
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
  	      body: `grant_type=authorization_code&client_id=7a031cf5f9ab77620ab76d3cf944f39a&redirect_uri=http://localhost:9090/Tcp2/KakaoLoginServlet&code=${code}`
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
  	};*/