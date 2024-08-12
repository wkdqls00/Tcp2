<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/Tcp2/assets/css/find_id.css">
</head>
<body>
    <!--홈페이지상단-->
    <div class="common_header">
        <div class="header_inner">
            <div class="inner">
                <a href="https://www.naver.com" class="header_logo"><span class="hidden">사이트이름</span></a>
                <ul class="my_menu">
                    <li>
                        <a href="/Tcp2/Controller?command=login">로그인</a>
                        <a href="/Tcp2/Controller?command=newaccount">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </div> 
    <div class="content">
        <div class="info_searchHeader">
            <h2>계정찾기</h2>
        </div>
        <div class="info_searchBody">
            <div class="search_tabWrap">
                <div class="search_tab">
                    <div class="tab">
                        <a href="/Tcp2/Controller?command=find_id">아이디 찾기</a>
                    </div>
                    <div class="tab current">
                        <a href="/Tcp2/Controller?command=find_pw_idcheck">비밀번호 찾기</a>
                    </div>
                </div>
            </div>
            <div class="search_contentWrap">
                <div class="search_content">
                    <div class="title_wrap">
                        <button class="title_btn">
                            <span class="title_text">휴대폰 번호로 찾기</span>
                        </button>
                        <div class="cotent_wrap">
                            <div class="content_inner">
                                <p class="message">입력하신 이름과 휴대폰 번호가 회원 정보와 일치한 경우 인증번호가 발송돼요.</p>
                                <div class="input_form">
                                   <form action="/Tcp2/Controller?command=find_pwResult" id="toResultservlet" method="post">
                                    <div class="input_style">
                                        <input type="text" name="name" id="input_memberName" class="search_input" placeholder="이름">
                                        <span class="del_btn"></span>
                                    </div>
                                    <div class="input_style">
                                        <input type="text" name="phone" id="input_memberPh" class="search_input" placeholder="휴대폰 번호 (-없이 입력)">
                                        <span class="del_btn"></span>
                                    </div>
                                    </form>
                                    <div class="hasBtn_wrap numbersend">
                                        <div class="input_style">
                                            <input type="text" id="certify_ph" class="input_certifyN" maxlength="6" placeholder="인증번호 6자리">
                                            <span id="timer"></span>
                                        </div>
                                        <div class="button_style">
                                            <button type="button" id="certify_re">다시 받기</button>
                                        </div>
                                    </div>
                                    <div class="error_message">인증번호가 일치하지 않아요. 다시 확인해 주세요.</div>
                                    <div class="confirm_wrap">
                                        <div class="activeButton">
											<button type="button" class="certBtn disabled" onclick="toNPservlet()">인증번호 받기</button>
											<button type="button" class="confirmBtn" style="display: none;" >확인</button>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
    // del_btn 함수
    document.querySelectorAll(".input_style .search_input").forEach(function(input) {
        var clearButton = input.closest('.input_style').querySelector('.del_btn');

        input.addEventListener('input', function() {
            if (input.value.length > 0) {
                clearButton.style.display = 'block';
            } else {
                clearButton.style.display = 'none';
            }
        });

        clearButton.addEventListener('click', function() {
            input.value = '';
            clearButton.style.display = 'none';
        });
    });
    // 폰번호 에러창
    document.getElementById("input_memberPh").addEventListener('change', function() {
        const btn = document.querySelector('.certBtn');
        const regex = /^[0-9]{10,11}$/;
        const errorEl = document.querySelector('.error_message');   
        const isValid = regex.test(this.value);
        if(isValid) {
            btn.classList.remove("disabled");
            errorEl.style.display = 'none';
        } else {
            errorEl.innerText = '잘못된 형식입니다.'
            errorEl.style.display = 'block';
            this.value = '';
            btn.classList.add("disabled");
        }
    });
	
    // 인증번호 함수
    let timerInterval;
    let verificationCode;
    let isCodeValid = false;

    function generateVerificationCode() {
        return Math.floor(100000 + Math.random() * 900000); // 6자리 랜덤 숫자 생성
    }

    function startTimer(duration, display) {
        let timer = duration, minutes, seconds;
        clearInterval(timerInterval); // 기존 타이머 중지

        timerInterval = setInterval(() => {
            minutes = parseInt(timer / 60, 10);
            seconds = parseInt(timer % 60, 10);

            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = minutes + ":" + seconds;

            if (--timer < 0) {
                clearInterval(timerInterval);
                display.textContent = "만료";
                isCodeValid = false;
            }
        }, 1000);
    }
    // 인증번호 받기 버튼
   function toNPservlet() {
		let name = document.getElementById("input_memberName").value;
		let phone = document.getElementById("input_memberPh").value;
	 	var xhr = new XMLHttpRequest();
	    xhr.open("POST", "/Tcp2/Find_idNamePhoneAction", true);
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	        	let response = xhr.responseText;
                alert(response);
		        if (response.trim() === "입력하신 정보로 회원가입된 아이디가 없습니다.") {
		        	return;
	            } else {
	                let input_cerN = document.querySelector('.hasBtn_wrap .input_style');
	                let input_cerNB = document.querySelector('.hasBtn_wrap .button_style');
	                let confirmBtn = document.querySelector('.confirmBtn');
	                let certBtn = document.querySelector('.certBtn');
	                input_cerN.style.display = 'block';
	                input_cerNB.style.display = 'block';
	                confirmBtn.style.display = 'block';
	                certBtn.style.display = 'none';
	    	      
	    	        verificationCode = generateVerificationCode();
	    	        isCodeValid = true;
	    	        console.log("인증번호: " + verificationCode);

	    	        const fiveMinutes = 60 * 5;
	    	        const display = document.getElementById('timer');
	    	        startTimer(fiveMinutes, display);
	            }
	        }
	     }
	    let params = "name=" + encodeURIComponent(name) + "&phone=" + encodeURIComponent(phone);
    	xhr.send(params);
	 };

    document.querySelector('.confirmBtn').addEventListener('click', function() {
        let userCode = document.getElementById('certify_ph').value;
        if (isCodeValid && userCode == verificationCode) {
            alert("인증되었습니다!");
            document.getElementById("toResultservlet").submit();
            // 여기다가 이제 핸드폰번호로 임시비밀번호 보내주는 코드 짜야함
        } else {
            alert("인증번호가 다릅니다.");
        }
    });
    
 // 인증번호 다시받기 버튼
	document.getElementById("certify_re").addEventListener('click', function() {
		verificationCode = generateVerificationCode();
        isCodeValid = true;
        console.log("인증번호: " + verificationCode);

        const fiveMinutes = 60 * 5;
        const display = document.getElementById('timer');
        startTimer(fiveMinutes, display);
	});
	
</script>
</body>
</html>