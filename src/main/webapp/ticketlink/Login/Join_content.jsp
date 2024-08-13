<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/joinContent.css">
    <title>회원가입</title>
</head>
<body>
    <div class="header">
       <a href="/Tcp2/Controller?command=main"><span class="header_logo"></span></a>
    </div>
    <div class="contents">
        <div class="contentWrapper">
            <div class="joinBlock">
                <h2 class="title">티켓링크 회원가입</h2>
                <p class="text">회원가입 하신 후 다양한 공연정보를 확인하세요</p>
                <button type="button" class="btnJoin">개인 회원가입</button>
                <div class="snsJoin">
                    <ul class="listSns">
                        <li class="snsNaver">
                            <a href="#" class="btnSns Naver"><span>네이버로 간편로그인</span></a>
                        </li>
                        <li class="snsKakao">
                            <a href="#" class="btnSns Kakao"><span>카카오로 간편로그인</span></a>
                        </li>
                    </ul>
                    <p class="guideText">SNS계정 회원가입(만14세 이상)</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer"></div>
    
    <script>
        // 개인회원가입 버튼에 링크 추가
        document.querySelector(".text").nextElementSibling.addEventListener("click", function() {
            window.location.href = "/Tcp2/Controller?command=agreeToTerms";
        });
	
        // 개인회원가입 버튼누르면 약간 효과 주기
        document.querySelector(".text").nextElementSibling.addEventListener("mousedown", function() {
            this.classList.add("special");
        });
        document.querySelector(".text").nextElementSibling.addEventListener("mouseup", function() {
            this.classList.remove("special");
        });
        document.querySelector(".text").nextElementSibling.addEventListener("mouseleave", function() {
            this.classList.remove("special");
        });
    </script>
</body>
</html>