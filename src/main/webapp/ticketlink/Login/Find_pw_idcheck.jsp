<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/Tcp2/assets/css/find_id.css">
    <style>
	    h3 {
	    	margin: 40px 0;
		}
		.error {
		    display: none;
		    margin-top: 5px;
		    font-size: 14px;
		    color: #ef3e4e;
	    }
	   	.notDisabled {
	   		display: block;
	   	}
    </style>
</head>
<body>
    <!--홈페이지상단-->
    <div class="common_header">
        <div class="header_inner">
            <div class="inner">
                <a href="https://www.naver.com" class="header_logo"><span class="hidden">사이트이름</span></a>
                <ul class="my_menu">
                    <li>
                        <a href="/Tcp2/ticketlink/Login/Login.jsp">로그인</a>
                        <a href="/Tcp2/ticketlink/Login/Join_content.jsp">회원가입</a>
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
                        <a href="/Tcp2/ticketlink/Login/Find_id.jsp">아이디 찾기</a>
                    </div>
                    <div class="tab current">
                        <a href="#">비밀번호 찾기</a>
                    </div>
                </div>
            </div>
            <form action="/Tcp2/Find_pwServlet" id="toServlet">
            <div class="search_contentWrap">
                <div class="search_content">
                    <h3>아이디 확인 후 비밀번호를 재설정 할 수 있습니다</h3>
                    <div class="input_style">
                        <input type="text" id="input_id" name="input_id" placeholder="아이디">
                        <span class="del_btn"></span>
                    </div>
                     <span class="error">입력하신 아이디는 없는 회원정보입니다.</span>
                    <div class="activeButton">
                        <button type="submit">아이디 확인</button>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
    <script>
        // del_btn 함수
        document.getElementById("input_id").addEventListener('input', function() {
            
            var clearButton = document.querySelector('.del_btn');
                if (this.value.length > 0) {
                    clearButton.style.display = 'block';
                } else {
                    clearButton.style.display = 'none';
                }
            });
            const clearButton = document.querySelector('.del_btn');
            clearButton.addEventListener('click', function() {
                let input = document.getElementById("input_id");
                input.value = '';
                clearButton.style.display = 'none';
            });
            // 인증번호 받기 버튼
            function toNPservlet() {
         		let name = document.getElementById("input_id").value;
         	 	var xhr = new XMLHttpRequest();
         	    xhr.open("POST", "/Tcp2/Find_idNamePhoneServlet", true);
         	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
         	    xhr.onreadystatechange = function() {
         	        if (xhr.readyState === 4 && xhr.status === 200) {
         	        	let response = xhr.responseText;
                         alert(response);
         		        if (response.trim() === "입력하신 정보로 회원가입된 아이디가 없습니다.") {
         		        	return;
         	            } else {
         	        }
         	     }
         	 	}
         	let params = "name=" + encodeURIComponent(name) + "&phone=" + encodeURIComponent(phone);
         	xhr.send(params);
           };
           
           // 없는 아이디 입력하면 error문자 뜨게
           let error = <%=request.getAttribute("error")%>;
           if(error !== false && error !== null) {
        	   document.querySelector(".error").classList.add("notDisabled");
           } 
    </script>
</body>
</html>