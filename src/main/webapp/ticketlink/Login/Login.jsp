<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/login.css">
    <title>Document</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
    Kakao.init('d71651f09cc74945fc403a9f0692a5b7'); // 사용하려는 앱의 JavaScript 키 입력
    </script> 
  
</head>
<body>
    <div class="header"></div>
    <div id="container" class="container login">
        <div class="loginWrap">
            <div class="loginLogo">
            <h1 style="margin: 0;">
                <span>종원링크</span>
            </h1>
            </div>
            <form id="loginFrm" name="loginFrm" action="/Tcp2/LoginSuccessToMain"  method="post" >
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
                            <input type="checkbox" id="saveSess" name="saveSess" value="N">
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
                            <li><a href="">아이디 찾기</a></li>
                            <li><a href="">비밀번호 찾기</a></li>
                            <li><a href="http://localhost:9090/Tcp2/ticketlink/Login/joinContent.html">회원가입</a></li>
                        </ul>
                    </div>
                    <div class="snsLogin">
                        <ul>
                            <li id="kakao_li">
                                <a href="javascript:loginWithKakao()" class="kakao" id="openid_kakao">
                                <span>카카오톡</span>
                                </a>
                            </li>
                            <li id="naver_li">
                                <a href="javascript:loginWithNaver()" class="naver" id="naver_id_login">
                                <span id="">네이버</span>
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
            // 로그인 유지 버튼 기능
            document.querySelector(".checkbox input").addEventListener("change", function() {
                var check = document.querySelector(".checkbox input");

                if (check.value === "N") {
                    check.value = "Y";
                }   else {
                    check.value = "N";
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
        var naver_id_login = new naver_id_login("0XIdlnam8573LeD3OCbE", "https://127.0.0.1:5500/callback");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("green", 1, 1);
        naver_id_login.setDomain("https://127.0.0.1:5500");
        naver_id_login.setState(state);
        naver_id_login.setPopup();
        naver_id_login.init_naver_id_login();
    </script>
    <script type="text/javascript">
        Kakao.init('d71651f09cc74945fc403a9f0692a5b7'); // 여기에 본인의 앱 키를 입력하세요.

        function loginWithKakao() {
            Kakao.Auth.authorize({
                redirectUri: 'http://127.0.0.1:5500/zproject_backup/html/Login/callback.html', // ngrok URL 사용
            });
        }
    </script>
     <script type="text/javascript">
        window.onload = function() {
            // 로그인 실패하면 error문 뜨게 
            <% if (request.getAttribute("loginError") != null) { %> // 이게 LoginSuccessMain에서 조건이 맞지 않으면 loginError 라는 속성을 전달함
                document.querySelector(".message").style.display = "block";
            <% } %>
        }
    </script>
    <script src="/Tcp2/assets/js/del_btn.js"></script>
</body>
</html>