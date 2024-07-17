<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/agreeToTerms.css">
    <title>약관동의</title>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
   	    .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.7);
            z-index: 10;
            display: block;
       	}
       	.g-recaptcha {
       	    position: absolute;
		    left: 40%;
		    top: 45%;
		    z-index: 11;
       	}
       	.success {
       		left: 0;
       	}
       .popup {
		  display: block;
		  z-index: 100;
		}
		.popup-content {
		  width: 600px;
		  max-height: 300px;
		  overflow-y: auto;
		}
    </style>
</head>
<body>
	<div class="overlay" id="overlay"></div>
	<div class="g-recaptcha" data-sitekey="6Lerfg0qAAAAAAukEzArdUcJnbf16ra6BELU4ngX" data-callback="recaptchaCallback"></div>
    <div class="memberContainer">
        <div class="header">
            <a href="" class="headerLogo"><span></span></a>
            <div class="headerTitle">약관동의</div>
        </div>
        <form action="/Tcp2/ticketlink/Login/Signup.jsp" method="get">
            <div class="contents">
                <div class="contentWrapper">
                    <div class="checkboxAll">
                        <label for="checkAll" class="All">
                            <input type="checkbox" id="checkAll">
                            <span class="text">
                                약관 전체 동의
                            </span>
                        </label>
                    </div>
                    <div class="termsBlock">
                            <div class="label">필수 동의 항목</div>
                            <div class="termsItem">
                                <div class="uCheckbox">
                                    <label for="check1" class="label2">
                                        <div class="inputWrap">
                                            <input type="checkbox" class="singleSelector require" id="check1" name="terms1">
                                            <span class="text">
                                            </span>
                                        </div>
                                    </label>
                                    <div class="checkboxCont"><a href="/Tcp2/ticketlink/Login/Terms1.html" class="btn btnLink" id="terms1" data-file-path="/Tcp2/ticketlink/Login/Terms1.html">[필수] 이용약관</a></div>
                                </div>
                                <div class="uCheckbox">
                                    <label for="check2" class="label2">
                                        <div class="inputWrap">
                                            <input type="checkbox" class="singleSelector require" id="check2" name="terms2">
                                            <span class="text">
                                            </span>
                                        </div>
                                    </label>
                                    <div class="checkboxCont"><a href="/Tcp2/ticketlink/Login/Terms2.html" class="btn btnLink" id="terms2" data-file-path="/Tcp2/ticketlink/Login/Terms2.html">[필수] 전자금융거래 이용약관</a></div>
                                </div>
                                <div class="uCheckbox">
                                    <label for="check3" class="label2">
                                        <div class="inputWrap">
                                            <input type="checkbox" class="singleSelector require" id="check3" name="terms3">
                                            <span class="text">
                                            </span>
                                        </div>
                                    </label>
                                    <div class="checkboxCont"><a href="" class="btn btnLink" id="terms3" data-file-path="/Tcp2/ticketlink/Login/Terms3.html">[필수] 개인정보 수집 동의서</a></div>
                                </div>
                            </div>
                    </div>
                    <div class="termsBlock">
                        <div class="label">선택 동의 항목</div>
                        <div class="termsItem">
                            <div class="uCheckbox">
                                <label for="check4" class="label2">
                                    <div class="inputWrap">
                                        <input type="checkbox" class="singleSelector" id="check4" name="terms4">
                                        <span class="text"></span>
                                    </div>
                                </label>
                                <div class="checkboxCont"><a href="" class="btn btnLink" id="terms4" data-file-path="/Tcp2/ticketlink/Login/Terms4.html">[선택] 개인정보 수집동의서</a></div>
                            </div>
                            <div class="uCheckbox">
                                <label for="check5" class="label2">
                                    <div class="inputWrap">
                                        <input type="checkbox" class="singleSelector" id="check5" name="terms5">
                                        <span class="text"></span>
                                    </div>
                                </label>
                                <div class="checkboxCont"><a href="" class="btn btnLink" id="terms5" data-file-path="/Tcp2/ticketlink/Login/Terms5.html">[선택] 위치기반서비스 이용약관</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="ubtnArea">
                        <div class="col">
                            <button type="submit" class="uBtn active" data-id="nextStep" disabled="">다음단계</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>    
        <div class="footer"></div>
    </div>
	<script src="/Tcp2/assets/js/Terms.js"></script>
    <script>
        // 전체동의 누르면 다 체크되게
        document.getElementById('checkAll').addEventListener('change', function() {
        var checkboxes = document.querySelectorAll(".singleSelector");
        var allChecked = this.checked;

        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = allChecked;
        }
            updateButtonState();
        });

        // 동의항목 하나라도 체크 해제되면 전체동의 체크 해제되게
        var singleSelectors = document.querySelectorAll(".singleSelector");
        for (var i = 0; i < singleSelectors.length; i++) {
            singleSelectors[i].addEventListener('change', function() {
                var allCheckbox = document.getElementById('checkAll');
                var allChecked = true;

                for (var j = 0; j < singleSelectors.length; j++) {
                    if (!singleSelectors[j].checked) {
                        allChecked = false;
                        break;
                    }
                }

                allCheckbox.checked = allChecked;
                updateButtonState();
            });
        }

        // 필수항목 3개 다 체크되면 버튼 색깔 바뀌게
        function updateButtonState() {
            var requiredCheckboxes = document.querySelectorAll(".singleSelector.require");
            var allChecked = true;

            for (var i = 0; i < requiredCheckboxes.length; i++) {
                if (!requiredCheckboxes[i].checked) {
                    allChecked = false;
                    break;
                }
            }

            var nextStepButton = document.querySelector("button[data-id='nextStep']");
            if (allChecked) {
                nextStepButton.disabled = false; // 버튼 체크 활성화
                nextStepButton.style.backgroundColor = "#1769ff"; // 색깔변경
            } else {
                nextStepButton.disabled = true; // 버튼 체크 비활성화
                nextStepButton.style.backgroundColor = ""; // 기본 색상으로 돌아가게
            }
        };

         // 다음단계 버튼 누르면 약간 효과 주기
        document.querySelector(".uBtn").addEventListener("mousedown", function() {
            this.classList.add("special");
        });
        document.querySelector(".uBtn").addEventListener("mouseup", function() {
            this.classList.remove("special");
        });
        document.querySelector(".uBtn").addEventListener("mouseleave", function() {
            this.classList.remove("special");
        });
        
     	// reCAPTCHA 완료 콜백 함수
        function recaptchaCallback() {
     		let reCap = document.querySelector('.g-recaptcha');
     		let overlay =  document.getElementById('overlay');
     		overlay.style.display = 'none';
            reCap.classList.add('success');
        }
    </script>
</body>
</html>