<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/login.css">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <style>
    	#naver_id_login img {
    		opacity: 0;
    	}
    </style>
</head>
<body>
    <div class="header"></div>
    <div id="container" class="container login">
        <div class="loginWrap">
            <div class="loginLogo nav_box">
            <h1 class="logo"><a href="/Tcp2/Controller?command=main"></a></h1>
            </div>
            <form id="loginFrm" name="loginFrm" action="${pageContext.request.contextPath}/LoginSuccessToMain"  method="post" >
                <div class="loginInner">
                    <div class="loginForm">
                        <div class="inputBox">
                            <div class="style_input id">
                                <label for="userId">
                                    <input type="text" name="userId" id="userId" placeholder="아이디" class="con_input id">
                                    <span id="conClear" class="del_btn" style="display: none;"></span>
                                </label>
                            </div>
                            <div class="style_input pw">
                                <label for="userPw">
                                    <input type="password" name="userPw" id="userPw" placeholder="비밀번호" class="con_input pw">
                                    <span id="conClear" class="del_btn" style="display: none;"></span>
                                </label>
                            </div>
                        </div>
                        <div class="errorMessage">
                            <div class="message">
                                아이디 또는 비밀번호가 맞지 않아요. 다시 입력해 주세요.
                            </div>
                        </div>
                    </div>
                    <div class="sign">
                        <div class="checkbox">
                            <input type="checkbox" id="saveSess" name="saveSess">
                            <label for="saveSess">로그인 상태 유지</label>
                        </div>
                    </div>
                    <div class="loginButtonBox">
                        <button type="submit" class="loginBtn" id="btn_login">
                            <span>로그인</span>
                        </button>
                    </div>
                    <div class="findList">
                        <ul>
                            <li><a href="/Tcp2/Controller?command=find_id">아이디 찾기</a></li>
                            <li><a href="/Tcp2/Controller?command=find_pw_idcheck">비밀번호 찾기</a></li>
                            <li><a href="/Tcp2/Controller?command=newaccount">회원가입</a></li>
                        </ul>
                    </div>
                    <div class="snsLogin">
                        <ul style="display: flex">
                            <li id="kakao_li">
                                <a href="#" class="kakao" id="kakao-login-btn" onclick="loginWithKakao(); return false;">
                                <span>카카오톡</span>
                                </a>
                            </li>
                            <li id="naver_li">
                                <a href="#" class="naver" id="naver_id_login">
                                <span>네이버</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                </div>    
            </form>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
        	parseFragment();
            // 로그인 유지 버튼 기능
            document.querySelector(".checkbox input").addEventListener("change", function() {
                var check = document.querySelector(".checkbox input");

                if (check.value === "N") {
                    check.value = "N";
                }   else {
                    check.value = "Y";
                }
            });

            // 로그인 버튼 누르면 약간 효과
            document.querySelector(".loginBtn").addEventListener("mousedown", function() {
                this.classList.add("special");
            });
            document.querySelector(".loginBtn").addEventListener("mouseup", function() {
                this.classList.remove("special");
            });
            document.querySelector(".loginBtn").addEventListener("mouseleave", function() {
                this.classList.remove("special");
            });
            
          });
    </script>        
     <script type="text/javascript">
        window.onload = function() {
        	// cookie 값 있는지 확인부터
        	let cookie = <%=request.getAttribute("cookie")%>;
        	if(cookie === null)
        	window.location.href = "/Tcp2/Controller?command=loginAction";
            // 로그인 실패하면 error문 뜨게 
            <% if (request.getAttribute("loginError") != null) { %> // 이게 LoginSuccessMain에서 조건이 맞지 않으면 loginError 라는 속성을 전달함
                document.querySelector(".message").style.display = "block";
            <% } %>
        }
    </script>
    <script type="text/javascript">
	  	var naver_id_login = new naver_id_login("0XIdlnam8573LeD3OCbE", "http://127.0.0.1:9090/Tcp2/NaverServlet");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 2,40);
	  	//naver_id_login.setDomain("https://localhost:9090");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	  	
	  	function parseFragment() {
            const fragment = window.location.hash.substring(1);
            const params = new URLSearchParams(fragment);

            const accessToken = params.get("access_token");
            const state = params.get("state");
            const tokenType = params.get("token_type");
            const expiresIn = params.get("expires_in");

            if (accessToken && state) {
                // 서버로 전달
                fetch('/Tcp2/NaverServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        access_token: accessToken,
                        state: state,
                        token_type: tokenType,
                        expires_in: expiresIn
                    })
                }).then(response => response.json())
                  .then(data => console.log(data))
                  .catch(error => console.error('Error:', error));
            }
        }
  </script>
  <script src="/Tcp2/assets/js/del_btn.js"></script>
  <script src="/Tcp2/assets/js/Kakao.js"></script>
</body>
</html>