<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호변경</title>
    <link rel="stylesheet" href="/Tcp2/assets/css/modify_member.css">
    <link rel="stylesheet" href="/Tcp2/assets//css/modify_password.css">
    <link rel="stylesheet" href="/Tcp2/assets//css/footer.css">
</head>
<body>
    <div class="common_header"> <!--홈페이지상단-->
        <div class="header_inner">
            <div class="inner">
                <a href="https://www.naver.com" class="header_logo"><span class="hidden">사이트이름</span></a>
                <ul class="my_menu">
                    <li>
                        <a href="#">로그아웃</a>
                    </li>
                </ul>
            </div>
        </div>
    </div> <!--홈페이지상단-->
    <div class="wrap">
        <div class="content_wrap">
            <div class="left_menu_area">
                <div class="my_area"> 
                    <p>환영합니다</p>
                    <p><%=request.getAttribute("name")%>님</p>
                </div>
                <div class="my_menu_area"> <!--왼쪽 메뉴들-->
                    <ul>
                        <li class="modify"><a href="/Tcp2//Modify_memberServlet">회원정보수정</a></li>
                        <li class="password current"><a href="/Tcp2/Modify_passwordServlet">비밀번호변경</a></li>
                        <li class="sns"><a href="#">계정연결설정</a></li>
                        <li class="withdrawal"><a href="#">회원탈퇴</a></li>
                    </ul>
                </div> <!--왼쪽 메뉴들-->
            </div>
            <form action="/Test/Modify_passwordAction" name="password_modify" method="get"> <!--가운데 회원정보들-->
                <div class="sub_content_wrap">
                    <h2 class="main_title">비밀번호변경</h2>
                    <div class="pw_to_box">
                        <p class="top_title">
                            <br>주기적인 <span style="color: #ef3e42">비밀번호 변경</span>을 통해<br> 개인정보를 안전하게 보호하세요.
                        </p>
                    </div>
                    <div class="pw_input_box">
                        <ul>
                            <li>
                                <div class="style_input">
                                    <input type="password" class="i_input" id="fst_password" placeholder="새 비밀번호" name="newPw">
                                    <p class="error" style="color: #ef3e42; font-size: 12px; display: none;">잘못된 형식의 비밀번호입니다.</p>
                                </div>
                            </li>
                            <li>
                                <div class="style_input">
                                    <input type="password" class="i_input" id="snd_password" placeholder="새 비밀번호 확인">
                                </div>
                            </li>
                        </ul>
                        <p class="pw_noti">8~12자의 영문, 숫자, 특수문자 중 2가지 이상으로만 가능합니다.</p>
                    </div>
                    <div class="inter_btn_area">
                        <span>
                            <button type="submit" class="btn_white">취소</button>
                        </span>
                        <span>
                            <button type="submit" class="btn_red">변경</button>
                        </span>
                    </div>
                </div>
            </form> <!--가운데 회원정보들-->
        </div>
    </div>
    <!-- 맨 밑 하단 안내사항 -->
<footer id="common_footer">
    <div class="footer_menu">
      <ul class="footer_menu_list">
        <li class="footer_menu_item">
          <a href="/introduction/company" class="footer_menu_link">회사소개</a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/terms/personalInforamtion" class="footer_menu_link">
          <span class="text_bold">개인정보 처리방침</span>
        </a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/term/youth" class="footer_menu_link">청소년 보호정책</a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/terms/use" class="footer_menu_link">이용약관</a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/help/main" class="footer_menu_link">고객센터</a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/help/partner" class="footer_menu_link">티켓판매안내</a>
        </li>
        <li class="footer_menu_item">
         <!-- ::before -->
         <a href="/advertisement/" class="footer_menu_link">광고안내</a>
        </li>
      </ul>
    </div>
   <!-- 맨 밑 하단 회사정보-->
   <div class="footer_inner">
    <span class="footer_corp_title"><b>준영 주식회사</b></span>
    <address class="footer_address">
      <p>
        <span class="footer_address_item">주소: 06043 서울특별시 강남구 강남대로</span>
        <span class="footer_address_item">
          <!-- before -->
          대표이사: 이준영
        </span>
        <span class="footer_address_item">
          <!-- before -->
          사업자등록번호: 144-81-25090
        </span>
      </p>
      <p>
        <span class="footer_address_item">010-6368-9069</span>
        <span class="footer_address_item">
          <!-- before -->
          tjsans9069@naver.com
        </span>
        <span class="footer_address_item">
          <!-- before -->
          통신판매업 신고번호: 제 2023-서울강남-04352호
        </span>
        <span class="footer_address_item">
          <!-- before -->
          <a href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=1448125090" target="_blank" class="btn_hyperlink" rel="noreferrer"><b>사업자정보확인</b></a>
        </span>
        <span class="footer_address_item">
          <!-- before -->
          개인정보보호 책임자: 이지수
        </span>
      </p>
    </address>
    <span class="footer_copyright">Copyright @ JY LINK Corporation. All rights reserved.</span>
    <div class="footer_etc">
      <ul class="footer_sns">
        <li class="footer_sns_item">
          <a href="https://blog.naver.com/" target="_blank" class="footer_sns_link" rel="noreferrer">
            <span class="common_icon icon_naverblog_gray">
              <span class="blind">네이버블로그</span>
              <!-- after -->
            </span>
          </a>
        </li>
        <li class="footer_sns_item">
          <a href="https://www.instagram.com/" target="_blank" class="footer_sns_link" rel="noreferrer">
            <span class="common_icon icon_instagram_gray">
              <span class="blind">인스타</span>
            </span>
          </a>
        </li>
        <li class="footer_sns_item">
          <a href="https://www.youtube.com/" target="_blank" class="footer_sns_link" rel="noreferrer">
            <span class="common_icon icon_youtube_gray">
              <span class="blind">유튜브</span>
            </span>
          </a>
        </li>
      </ul>
    </div>
  </div>
  <script>
    // 새비밀번호랑 새비밀번호 확인 비교 
    document.addEventListener("DOMContentLoaded", function() {

      document.querySelector(".btn_red").addEventListener("click", function() {
        let p1 = document.getElementById("fst_password").value;
        let p2 = document.getElementById("snd_password").value;
        let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if(p1 !== p2) {
          event.preventDefault();
          alert("비밀번호가 일치하지 않습니다.")
        } else if(!regex.test(p1)) {
          event.preventDefault();
          alert("잘못된 형식의 비밀번호입니다.")
        } else {
          alert("비밀번호가 변경되었습니다. \n 다시 로그인해주세요.")
        }
      });

      // 비밀번호 조건문(정규표현으로)
      document.getElementById("fst_password").addEventListener("input", function() {
        let error = document.querySelector(".error");
        let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        let text = this.value;
        if(!regex.test(text)) {
          error.style.display = "block";
        } else {
          error.style.display = "none";
        }
      });
    });
  </script>
</body>
</html>