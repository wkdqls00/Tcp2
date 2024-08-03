<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입>정보입력</title>
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/signup.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%
	String terms1 = request.getParameter("terms1");
	String terms2 = request.getParameter("terms2");
	String terms3 = request.getParameter("terms3");
	String terms4 = request.getParameter("terms4");
	String terms5 = request.getParameter("terms5");
	
	 terms1 = (terms1 != null) ? "Y" : "N";
     terms2 = (terms2 != null) ? "Y" : "N";
     terms3 = (terms3 != null) ? "Y" : "N";
     terms4 = (terms4 != null) ? "Y" : "N";
     terms5 = (terms5 != null) ? "Y" : "N";
%>
    <form id="form" action="/Tcp2/SignupDaoServlet" method="post">
       <input type="hidden" name="terms1" value="<%= terms1 %>">
       <input type="hidden" name="terms2" value="<%= terms2 %>">
       <input type="hidden" name="terms3" value="<%= terms3 %>">
       <input type="hidden" name="terms4" value="<%= terms4 %>">
       <input type="hidden" name="terms5" value="<%= terms5 %>">
        <div class="memberConatainer">
            <div class="header">
                <div class="header_inner">
                    <a href="/Tcp2/ticketlink/main.jsp" class="header_logo">
                        <span class="blind">
                            종원링크
                        </span>
                    </a>
                    <div class="header_title">정보입력</div>
                </div>
            </div>
            <div class="contents">
                <div class="content_wrapper">
                    <div class="uBlock"> <!-- 아이디 블럭 -->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="" class="input_id">아이디</label>
                                    <div class="input_box">
                                        <input type="text" id="input_id" class="input_text" placeholder="6~20자 영문,숫자" tabindex="1" value="" name="id">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="check_id" onclick="checkDuplicateId()">중복확인</button>
                        </div>
                        <div class="error_text">영문으로 시작하는 6~20자 영문(소문자), 숫자만 사용 가능합니다</div>
                        <div class="error_text checkId">중복확인을 체크해주세요.</div>
                    </div>
                    <div class="uBlock"> <!-- 비밀번호 블럭 -->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="input_pw">비밀번호</label>
                                    <div class="input_box">
                                        <input type="password" id="input_pw" class="input_text" placeholder="8~12자영문, 숫자, 특수문자" tabindex="2" value="" name="pw">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col"></div>
                        </div>
                        <div class="error_text">8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.</div>
                    </div>
                    <div class="uBlock"> <!-- 비밀번호 확인 블럭 -->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="input_pw_confirm">비밀번호 확인</label>
                                    <div class="input_box">
                                        <input type="password" id="input_pw_confirm" class="input_text" placeholder="8~12자영문, 숫자, 특수문자" tabindex="3" vlaue="">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="error_text">8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.</div>
                    </div>
                    <div class="uBlock"> <!-- 이름 블럭 -->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="input_name">이름</label>
                                    <div class="input_box">
                                        <input type="text" id="input_name" class="input_text" tabindex="4" value="" name="name">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="error_text">원활한 정보제공을 위해서 정확한 이름으로 적어주세요.</div>
                    </div>
                    <div class="uBlock"> <!-- 닉네임 블럭 -->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="input_nickname">닉네임</label>
                                    <div class="input_box">
                                        <input type="text" id="input_nickname" class="input_text" placeholder="2 ~ 10자 한글, 영문, 숫자" tabindex="5" value="" name="nickname">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="check_nickname"  onclick="checkDuplicateNick()">중복확인</button>
                        </div>
                        <div class="error_text">한글, 영문 2 ~ 10자로 가능합니다.</div>
                        <div class="error_text checkNick">중복확인을 체크해주세요.</div>
                    </div>
                    <div class="uBlock"> <!-- 이메일 블럭 -->
                        <div class="input_area email">
                            <div class="col">
                                <div class="input">
                                    <label for="input_eamil">이메일</label>
                                    <div class="input_box">
                                        <input type="text" id="input_email" class="input_text text_email" tabindex="6" value="" name="email">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="select_col">
                                <div class="select_box">
                                    <label for="">
                                        <select tabindex="6" style="width:21px; cursor:pointer;" id="email" class="list_email">
                                            <option value="direct">직접입력</option>
                                            <option value="naver.com">@naver.com</option>
                                            <option value="live.com">@live.com</option>
                                            <option value="gmail.com">@gmail.com</option>
                                            <option value="nate.com">@nate.com</option>
                                            <option value="hotmail.com">@hotmail.com</option>
                                            <option value="yahoo.com">@yahoo.com</option>
                                            <option value="outlook.com">@outlook.com</option>
                                            <option value="icloud.com">@icloud.com</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="error_text">이메일 주소 양식에 맞게 작성해주세요.</div>
                    </div> 
                    <div class="uBlock"> <!-- 주소 블럭 -->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="input_nickname">우편번호</label>
                                    <div class="input_box">
                                        <input type="text" id="input_address" class="input_text" placeholder="우편번호를 입력해주세요." tabindex="7" value="" name="address">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="btn_area">
                                    <button type="button" class="btn address" onclick="sample3_execDaumPostcode()">주소 검색</button>
                                    <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:absolute;z-index:5;">
                                        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="uBlock"> <!-- 상세주소 블럭 -->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="input_nickname">상세주소</label>
                                    <div class="input_box">
                                        <input type="text" id="input_addressDetailed" class="input_text" placeholder="상세주소를 입력해주세요." tabindex="8" value="" name="detailed_address">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="uBlock"> <!-- 생년월일, 성별 블럭 -->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="input_birth">주민등록번호</label>
                                    <div class="input_box birth">
                                        <input name="birth" type="text" id="input_birth" class="input_text" placeholder="6자리" tabindex="9" maxlength="6" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
                                        <div style="display: inline-block; width: 13px; height: 0; border: 1px solid black; vertical-align: middle;"></div>
                                        <input name="gender" type="text" id="input_gender" class="input_text gender" tabindex="10" maxlength="1" oninput="this.value = this.value.replace(/[^1-4]/g, '')">
                                        <!--주민번호 뒷자리 별모양-->
                                        <input type="text" class="input_text gender" placeholder="" maxlength="1" value="●" readonly style="font-size: 15px;">
                                        <input type="text" class="input_text gender" placeholder="" maxlength="1" value="●" readonly style="font-size: 15px;">
                                        <input type="text" class="input_text gender" placeholder="" maxlength="1" value="●" readonly style="font-size: 15px;">
                                        <input type="text" class="input_text gender" placeholder="" maxlength="1" value="●" readonly style="font-size: 15px;">
                                        <input type="text" class="input_text gender" placeholder="" maxlength="1" value="●" readonly style="font-size: 15px;">
                                        <input type="text" class="input_text gender" placeholder="" maxlength="1" value="●" readonly style="font-size: 15px;">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="uBlock"> <!--휴대폰 블럭-->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="input_phone">휴대폰</label>
                                    <div class="input_box">
                                        <input type="text" id="input_phone" class="input_text" placeholder="010 1234 5678" tabindex="11" value="" name="phone">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="btn_area">
                                    <button type="button" class="btn border_type">인증번호 받기</button>
                                </div>
                            </div>
                        </div>
                        <div class="error_text">점유인증을 하여 휴대폰 번호를 등록해주세요. 등록한 번호는 로그인 이후 변경 가능합니다.</div>
                        <div class="account_vali" style="display: none;">
                            <div class="account_guide">
                                <div>
                                    <span class="account">wns*****</span>
                                    <span class="date">(1949-04-15)</span>
                                    아이디로 가입 된 정보입니다.
                                </div>
                            </div>
                            <p class="block_text">동일 정보로 가입된 계정으로 로그인 하시겠습니까?</p>
                            <a href="#" class="btn btnArrow">로그인하기</a>
                        </div>
                    </div> 
                    <div class="uBlock" id="certify" style="display: none;"> <!--인증번호브럭-->
                        <div class="pInput_area">
                            <div class="col">
                                <div class="pInput">
                                    <label for="">인증번호</label>
                                    <div class="pInput_box">
                                        <input type="text" id="input_certify" class="input_text_certify">
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="pBtn_area">
                                    <button type="button" class="pBtn" id="re">재발송</button>
                                    <button type="button" class="pBtn" id="check_certify">확인</button>
                                </div>
                            </div>
                        </div>
                        <div class="certify_time">
                            <span class="timer"></span>
                        </div>
                    </div>
                    <div class="uBlock check_block"> <!--체크블럭-->
                        <div class="checkbox">
                            <label for="">
                                <input type="checkbox">
                                <span class="text">SMS, 이메일로 이벤트 정보를 받겠습니다.(선택)</span>
                            </label>
                        </div>
                        <div class="checkbox">
                            <label for="">
                                <input type="checkbox">
                                <span class="text" id="child">14세 미만입니다.</span>
                            </label>
                        </div>
                    </div> 
                    <div class="uError_text" style="display: none;">
                        14세 미만 가입시 법정대리인 동의 필수 입니다
                    </div>
                    <div class="uBlock">
                        <p class="block_text">만 14세 미만 회원은 법정대리인(부모님) 동의를 받은 경우만 회원가입이 가능합니다.</p>
                    </div>
                    <div class="uBlock" style="display: none"> <!-- 부모님 이름 블럭 -->
                        <div class="input_area">
                            <div class="col">
                                <div class="input">
                                    <label for="input_name">이름</label>
                                    <div class="input_box">
                                        <input type="text" id="input_name_p" class="input_text agree" tabindex="12" value="">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="uBlock" style="display: none"> <!-- 부모님 이메일 블럭 -->
                        <div class="input_area email">
                            <div class="col">
                                <div class="input">
                                    <label for="input_eamil">이메일</label>
                                    <div class="input_box">
                                        <input type="text" id="input_email_p" class="input_text agree text_email" tabindex="13" value="">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="select_col">
                                <div class="select_box">
                                    <label for="">
                                        <select tabindex="6" style="width:21px; cursor:pointer;" id="email_p" class="list_email">
                                            <option value="direct">직접입력</option>
                                            <option value="naver.com">@naver.com</option>
                                            <option value="live.com">@live.com</option>
                                            <option value="gmail.com">@gmail.com</option>
                                            <option value="nate.com">@nate.com</option>
                                            <option value="hotmail.com">@hotmail.com</option>
                                            <option value="yahoo.com">@yahoo.com</option>
                                            <option value="outlook.com">@outlook.com</option>
                                            <option value="icloud.com">@icloud.com</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="error_text" style="display: block;">이메일 주소 양식에 맞게 작성해주세요.</div>
                    </div> 
                    <div class="uBlock agreeBlock" style="display: none">
                        <div class="input_area">
                            <div class="col">
                                <span class="label">가입동의받기</span>
                            </div>
                            <div class="col">
                                <div class="btn_area">
                                    <button type="button" class="btn border_type sType">법정대리인 본인 인증</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn_area last"> <!--가입완료버튼-->
                        <div class="col">
                            <button type="submit" class="btn point" disabled onclick="end(event)">가입완료</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden">
    </form>
    <script src="/Tcp2/assets/js/signup.js"></script>
    <script>
			
		   // 모든 인풋의 값 입력할 때까지 인증번호 버튼 disabled
		   let isIdUnique = false; // 아이디 중복 여부  변수
		   let isNickUnique = false; // 닉네임 중복 여부 변수
		   let inputs = document.querySelectorAll(".input_text");
		   let submitButton = document.querySelector('.btn.border_type');
		   
		   function validateInputs() {
		       let userid = document.getElementById("input_id").value;
		       let password = document.getElementById("input_pw").value;
		       let confirmPassword = document.getElementById("input_pw_confirm").value;
		       let name = document.getElementById("input_name").value;
		       let nickname = document.getElementById("input_nickname").value;
		       let email = document.getElementById("input_email").value;
		       let phone = document.getElementById("input_phone").value;
		       let address = document.getElementById("input_address").value;
		       let detail_ad = document.getElementById("input_addressDetailed").value;
		       let birth = document.getElementById("input_birth").value;
		       let gender = document.getElementById("input_gender").value;
		
		       let useridValid = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]{6,20}$/.test(userid);
		       let passwordValid = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(password);
		       let confirmPasswordValid = password === confirmPassword;
		       let nameValid = /^[가-힣]{2,}$/.test(name);
		       let nicknameValid = /^(?=.*[가-힣a-zA-Z])([가-힣a-zA-Z0-9]){2,10}$/.test(nickname);
		       let emailValid = /^[^\s@]+@[^\s@]+\.com$/.test(email);
		       let phoneValid = /^[0-9]{10,11}$/.test(phone);
		       let addressValid = address != '';
		       let detail_adValid = detail_ad != '';
		       let birthValid = /^.{6,}$/.test(birth);
		       let genderValid = /^[1234]+$/.test(gender);
		
		       return useridValid && passwordValid && confirmPasswordValid && nameValid && nicknameValid && emailValid && phoneValid && addressValid && detail_adValid && birthValid && genderValid;
		   }
		
		   function updateButtonState() {
			
		       if (validateInputs() && isIdUnique && isNickUnique)  {
		           submitButton.classList.add("notdisabled"); // 버튼 활성화
		       } else {
		           submitButton.classList.remove("notdisabled"); // 버튼 비활성화
		       }
		   }
		
		   inputs.forEach(input => {
		   input.addEventListener('input', updateButtonState);
		
		   });
		   updateButtonState();
    
 		// 아이디 중복확인
        function checkDuplicateId() {
            var inputId = document.getElementById("input_id").value;
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/Tcp2/CheckId", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    let response = xhr.responseText;
                    alert(response);
                    if (response.trim() === "사용 가능한 아이디입니다.") {
                    	const errorEl2 = document.querySelector('.error_text.checkId');
                        isIdUnique = true;
                        errorEl2.style.display = "none";
                    } else {
                        isIdUnique = false;
                    }	
                    updateButtonState();
                }
            };
            xhr.send("id=" + encodeURIComponent(inputId));
        }
	     // 닉네임 중복확인
	        function checkDuplicateNick() {
	            var inputNick = document.getElementById("input_nickname").value;
	            var xhr = new XMLHttpRequest();
	            xhr.open("POST", "/Tcp2/CheckNick", true);
	            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	            xhr.onreadystatechange = function () {
	                if (xhr.readyState === 4 && xhr.status === 200) {
	                    let response = xhr.responseText;
	                    alert(response);
	                    if (response.trim() === "사용 가능한 닉네임입니다.") {
	                    	const errorEl3 = document.querySelector('.error_text.checkNick');
	                        isNickUnique = true;
	                        errorEl3.style.display = "none";
	                    } else {
	                        isNickUnique = false;
	                    }
	                    updateButtonState();
	                }
	            };
	            xhr.send("nickname=" + encodeURIComponent(inputNick));
	        }
    </script>
</body>
</html>