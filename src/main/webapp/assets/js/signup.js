document.addEventListener("DOMContentLoaded", function() {

    // 가입완료 버튼에 약간 효과 주기
    var btn = document.querySelector(".btn.point");
    if(btn) {
    btn.addEventListener("mousedown", function() {
        btn.classList.add("special");
    });
    btn.addEventListener("mouseup", function() {
        btn.classList.remove("special");
    });
    btn.addEventListener("mouseleave", function() {
        btn.classList.remove("special");
    });
    } else {
        console.log("못찾음")
    }

    // 이메일 박스 리스트에 있는거 선택 기능
    var emailInputs = document.querySelectorAll('.text_email');
    var emailDomainSelects = document.querySelectorAll('.list_email');

    emailDomainSelects.forEach(function(select, index) {
        select.addEventListener('change', function() {
            var selectedDomain = select.value;
            var emailInput = emailInputs[index];
        
            if (selectedDomain === 'direct') {
                emailInput.value = '';  // 직접 입력 선택하면 초기화
            } else {
                var emailParts = emailInput.value.split('@');
                emailInput.value = emailParts[0] + '@' + selectedDomain;
            }
            emailInput.dispatchEvent(new Event('input')); 
        });
    });
	

     // 모든 인풋의 값 입력할 때까지 법정대리인 버튼 disabled
    let inputsP = document.querySelectorAll(".input_text.agree");
    let submitButtonP = document.querySelector('.btn.border_type.sType');
    
    function validateInputsP() {
        let name = document.getElementById("input_name_p").value;
        let email = document.getElementById("input_email_p").value;

        let nameValid = name.trim() !== '';
        let emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

        return nameValid && emailValid;
    };

    function updateButtonStateP() {
        if (validateInputsP()) {
            submitButtonP.classList.add("notdisabled")  // 버튼이 선명해짐
        } else {
            submitButtonP.classList.remove("notdisabled") // 버튼이 선명해짐
        }
    };
    
    inputsP.forEach(input => {
        input.addEventListener('input', updateButtonStateP);
        console.log("이벤트 리스너 추가됨:", input);
    
    });

    // 휴대폰 인증번호 받으면 모든 인풋 readonly로 바꾸기(보류)
    document.querySelector(".btn.border_type").addEventListener("click", function() {
     
        let vali_box = document.querySelector(".account_vali");
        let certify = document.getElementById("certify");

        
        vali_box.style.display = "block"; // 이미 가입된 정보면 박스 나옴
        certify.style.display = "block"; // 그 인증번호 인풋하고 타이머 나옴
    });

    // 체크박스 파란색 활성화 
    var labels = document.querySelectorAll(".text");
    var box = document.querySelectorAll(".checkbox input")

    labels.forEach(function(label, index) {
        label.addEventListener("click", function() {
            box[index].checked = !box[index].checked
        })
    });

    // 14세 미만가입시 열리는 블럭 
    document.getElementById("child").addEventListener("click", function() {
    var child_text = document.querySelector(".uError_text");
    var child_box1 = document.querySelector(".content_wrapper .uBlock:nth-child(15)")
    var child_box2 = document.querySelector(".content_wrapper .uBlock:nth-child(16)")
    var child_box3 = document.querySelector(".content_wrapper .uBlock:nth-child(17)")
        if (child_text.style.display == "block") {
            child_text.style.display = "none"
            child_box1.style.display = "none"
            child_box2.style.display = "none"
            child_box3.style.display = "none"
        } else {
            child_text.style.display = "block"
            child_box1.style.display = "block"
            child_box2.style.display = "block"
            child_box3.style.display = "block"
        }
    });
    
    // 삭제버튼 기능
    const con = document.querySelectorAll(".input_box")

    con.forEach(function(con) {

        var input = con.querySelector('.input_text');
        var clearButton = con.querySelector('.del_btn');

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

    // 인증번호가 같아야 버튼 활성화되게끔
    var sentV = "123456";
    document.getElementById("check_certify").addEventListener("click", function() {
        var input = document.getElementById("input_certify").value;

        if (input === sentV) {
            alert("인증이 완료되었습니다");
            document.getElementById("input_certify").setAttribute("readonly", true);
            let final = document.querySelector(".btn.point");
            final.disabled = false;
            final.style.backgroundColor = "#fa2828";
            
            let inputs1 = document.querySelectorAll('input[type="text"]');
            let inputs2 = document.querySelectorAll('input[type="password"]');
            // text 인풋 비활성화
            inputs1.forEach(function(input) {
            input.setAttribute('readonly', true);
            });
            // password 인풋 비활성화
            inputs2.forEach(function(input) {
            input.setAttribute('readonly', true);
            });
        } else {
            alert("인증번호가 일치하지 않습니다")
        }  
    })

    // 아이디 에러창
    document.getElementById("input_id").addEventListener('input', function() {
        const regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]{6,20}$/;
        const errorEl = this.closest('.uBlock').querySelector('.error_text');
		const errorEl2 = this.closest('.uBlock').querySelector('.error_text').nextElementSibling;
        const isValid = regex.test(this.value);
        errorEl.style.display = isValid ? 'none' : 'block';
		if (!isIdUnique) errorEl2.style.display = "block"
		isIdUnique = false;
		updateButtonState();
    });
	
    // 비밀번호 에러창
    document.getElementById("input_pw").addEventListener('input', function() {
        const regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        const errorEl = this.closest('.uBlock').querySelector('.error_text');
        const isValid = regex.test(this.value);
        errorEl.style.display = isValid ? 'none' : 'block';
		updateButtonState();	
    });
    // 비밀번호 확인 에러창
    document.getElementById("input_pw_confirm").addEventListener('input', function() {
        const pw = document.getElementById("input_pw").value;
        const errorEl = this.closest('.uBlock').querySelector('.error_text');
        const isValid = this.value === pw;
        errorEl.style.display = isValid ? 'none' : 'block';
        errorEl.innerText = isValid ? '' : '비밀번호와 일치하지 않습니다.';
		updateButtonState();
    });
    // 이름 에러창
    document.getElementById("input_name").addEventListener('input', function() {
        const regex = /^[가-힣]{2,}$/;
        const errorEl = this.closest('.uBlock').querySelector('.error_text');
        const isValid = regex.test(this.value);
        errorEl.style.display = isValid ? 'none' : 'block';
		updateButtonState();
    });
    // 닉넴 에러창
    document.getElementById("input_nickname").addEventListener('input', function() {
        const regex = /^(?=.*[가-힣a-zA-Z])([가-힣a-zA-Z0-9]){2,10}$/;
        const errorEl = this.closest('.uBlock').querySelector('.error_text');
		const errorEl2 = this.closest('.uBlock').querySelector('.error_text').nextElementSibling;
        const isValid = regex.test(this.value);
        errorEl.style.display = isValid ? 'none' : 'block';
		if (!isNickUnique) errorEl2.style.display = "block"
		isNickUnique = false;
		updateButtonState();
    });

    document.getElementById("input_email").addEventListener('change', function() {
        validateEmail();
    });
    document.getElementById("email").addEventListener('change', function() {
        validateEmail();
    });
    function validateEmail() {
        const emailInput = document.getElementById('input_email').value;
        const domainSelect = document.getElementById('email').value;
        const fullEmail = emailInput + domainSelect;
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const errorEl = document.getElementById('input_email').closest('.uBlock').querySelector('.error_text');
        const isValid = regex.test(fullEmail);
        errorEl.style.display = isValid ? 'none' : 'block';
		updateButtonState();
    }
    // 폰번호 에러창
    document.getElementById("input_phone").addEventListener('input', function() {
        const regex = /^[0-9]{10,11}$/;
        const errorEl = this.closest('.uBlock').querySelector('.error_text');
        const isValid = regex.test(this.value);
        errorEl.style.display = isValid ? 'none' : 'block';	
		updateButtonState();
    });
	

/*	document.querySelector(".btn.point").addEventeListener('click', function() {
		let text = document.getElementById("input_name").value;
		alert(`가입 되었습니다.\n환영합니다 ${text}님`);
	})*/



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
            document.getElementById('input_address').value = data.zonecode + ' ' + addr + extraAddr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("input_addressDetailed").focus();

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


	
	