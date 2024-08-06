document.addEventListener("DOMContentLoaded", function() {

// 수정버튼 기능
var btn = document.querySelectorAll(".btn_common");

btn.forEach(function(btn) {
    btn.addEventListener("click", function() {

    var content = this.parentElement.nextElementSibling;
    content.classList.toggle("on"); // 수정버튼 누르면 박스나옴
    this.classList.toggle("red"); // 수정버튼 누르면 빨간 취소버튼으로 바뀜
    
    if (this.innerText == "수정") {
    this.innerText = "취소";
    }
    else 
    this.innerText = "수정"
    })
})

// 이메일 리스트 펼치는 기능
document.querySelector(".custom_select").addEventListener("click", function() {
    this.classList.toggle("acting");
});


// 이메일 선택 기능
var text = document.querySelector(".new_list");
var list = document.querySelectorAll(".option");

list.forEach(function(listItem) {
            listItem.addEventListener("click", function() {
                text.innerText = listItem.innerText;
            });
    });


// 이메일 선택하면 input에 자동 입력
var emailInput = document.querySelector('.email_box .con_input');
var emailDomainSelect = document.querySelectorAll('.option');

emailDomainSelect.forEach(function(option) {
    option.addEventListener('click', function() {
        var selectedDomain = option.innerText;
        if (selectedDomain === '직접입력' || selectedDomain === '선택하세요') {
        emailInput.value = '';  // 직접입력 선택하면 초기화
        } else {
            var emailParts = emailInput.value.split('@');
            emailInput.value = emailParts[0] + '@' + selectedDomain;  
        }
    });
});

// 이메일 API
let randomBno = 0;

emailjs.init({publicKey: "SUelUcDuv9pUYkIhb",});
document.getElementById("mf_email").addEventListener('click', function() {
	 
	 randomBno = Math.floor(100000 + Math.random() * 900000);
	 document.getElementById("email_input_certyNum").style.display = "block";
     document.getElementById("email_certy_check").style.display = "block";
     
     document.getElementById("mf_email").style.display = "none";
	 let user_email = document.getElementById('user_email').value;
	 
	 var templateParams = {
	  from_name: '큐트종원이의 랜덤 번호~!',
	  message: randomBno,
	  to_email: user_email
	};
	emailjs.send('service_bd2irwh', 'template_bpkenkj', templateParams).then(
	  (response) => {
		alert('인증번호가 등록하신 이메일로 전송되었습니다.');
	    console.log('SUCCESS!', response.status, response.text);
	  },
	  (error) => {
	    console.log('FAILED...', error);
	  }
	);
})

document.getElementById("email_certy_check").addEventListener('click', function() {
	let certyNum = document.getElementById("email_input_certyNum").value;
	if(certyNum == randomBno) {
		alert("이메일이 변경되었습니다.");
		document.getElementById('toModify_emailAction').submit();		
	} else {
		alert('인증번호가 다릅니다.');
	}
});

// 휴대폰번호 수정 에러문, 인증번호 전송 활성화?
function validatePhoneInput() {
    let phoneInput = document.getElementById("input_phoneN").value;
    let phoneInput_ = document.getElementById("input_phoneN");
    let errorText = document.getElementById("errorText_phone")
    let btn_red = document.getElementById("phone_certy");
    let phoneRegex = /^\d{10,11}$/;
    if (phoneInput === '') {
    errorText.textContent = '번호를 입력해주세요.';
    errorText.style.display = 'block';
    } else if (!phoneRegex.test(phoneInput)) {
    errorText.textContent = '잘못된 형식입니다.';
    errorText.style.display = 'block';
    phoneInput_.value = ''
    } else {
        // 여기에 인증번호 전송코드 만들어야함
        btn_red.classList.remove("disabled");
        errorText.style.display = 'none';
    }
}
document.getElementById("input_phoneN").addEventListener("change", validatePhoneInput);

// 타이머, 인증번호 랜덤으로 만드는 코드
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

// 인증번호 전송시 input태그 생기고 전송 -> 인증 버튼으로 바뀌게 
document.getElementById("phone_certy").addEventListener("click", function() {
    document.getElementById("input_certyNum").style.display = "block";
    document.getElementById("certy_check").style.display = "block";
    document.getElementById("phone_certy").style.display = "none";
    document.getElementById("input_phoneN").readOnly = "true"
	alert("인증번호가 전송되었습니다.")
	
		verificationCode = generateVerificationCode();
        isCodeValid = true;
        console.log(`인증번호: ${verificationCode}`);

        const fiveMinutes = 60 * 5;
        const display = document.getElementById('timer');
        startTimer(fiveMinutes, display);
	
});

	// 인증버튼 인증번호랑 같으면 수정완료, 다르면 다르다고 alert
	document.getElementById("certy_check").addEventListener("click", function() {
	    var inputV = document.getElementById("input_certyNum").value;
	    if(inputV == verificationCode && isCodeValid) {
	    alert("변경되었습니다.")
		document.getElementById('modify_ph').submit();	
	    } else {
        event.preventDefault();
	    alert("인증번호가 다릅니다.");
		}
	});
	
	// 주소 수정버튼 기능
	document.getElementById("mf_address").addEventListener("click",function() {
		let address = document.getElementById("input_newAddress").value;
		let addressD = document.getElementById("input_newAddressD").value;
		if(address.length <= 5 || addressD == '') {
			event.preventDefault();
			alert("주소를 올바르게 작성해주세요.")
		} else {
			alert("주소가 변경되었습니다.")
		}
	})
	
	// 최종 수정 버튼
	document.querySelector(".btn_red_success").addEventListener("click", function() {
		alert("수정 완료되었습니다.")
		window.location.href = "/Tcp2/Mypage_memberServlet"
	});
	// 취소 버튼
	document.querySelector(".btn_white").addEventListener("click", function() {
		alert("메인페이지로 이동합니다.")
		window.location.href = "/Tcp2/Mypage_memberServlet"
	});
});


// 우편번호 찾기 찾기 화면을 넣을 element
var element_wrap = document.getElementById('wrap');
    
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
    
    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
    
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
    
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }
    
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('input_newAddress').value = data.zonecode + ' ' + addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("input_newAddress").focus();
    
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
    
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
    
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
