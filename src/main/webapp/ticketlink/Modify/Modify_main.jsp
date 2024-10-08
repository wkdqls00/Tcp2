<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호확인</title>
    <link rel="stylesheet" href="/Tcp2/assets//css/modify_main.css">
    <link rel="stylesheet" href="/Tcp2/assets//css/footer.css">
</head>
<body>
<%
String id = (String)request.getAttribute("id");
String name = (String)request.getAttribute("name");
%>
	
    <div class="common_header"> <!--홈페이지상단-->
        <div class="header_inner">
            <div class="inner">
                <a href="/Tcp2/Controller?command=main" class="header_logo"><span class="hidden">사이트이름</span></a>
                <ul class="my_menu">
                    <li>
                        <li class="utill_link"><a href="#" onclick="if(confirm('로그아웃 하시겠습니까?')) { window.location.href='/Tcp2/Controller?command=logout'; } return false;">로그아웃</a></li>
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
                    <p><%=name %>님</p>
                </div>
                <div class="my_menu_area"> <!--왼쪽 메뉴들-->
                    <ul>
                        <li class="modify"><a href="#">회원정보수정</a></li>
                        <li class="password"><a href="#">비밀번호변경</a></li>
                        <li class="sns"><a href="#">계정연결설정</a></li>
                        <li class="withdrawal"><a href="#">회원탈퇴</a></li>
                    </ul>
                </div> <!--왼쪽 메뉴들-->
            </div>
            <form action="/Tcp2/Controller?command=modify_member" method="post"> <!--가운데 회원정보들-->
                <div class="sub_content_wrap">
                    <h2 class="main_title">비밀번호인증</h2>
                    <div class="pw_to_box">
                        <p class="top_title">정보를 안전하게 보호하기 위해<br>
                            <span style="color: #ef3e42;">비밀번호를 다시 한 번 확인</span>
                            합니다
                        </p>
                    </div>
                    <div class="pw_con_box">
                        <dl>
                            <dt>아이디</dt>
                            <dd class="mem_id"><%=id %></dd>
                            <input type="hidden" name="userId" value="<%=id%>">
                        </dl>
                        <dl>
                            <dt>비밀번호</dt>
                            <dd>
                                <div class="style_input">
                                    <input type="password" id="mem_pw" class="con_input"  name="userPw">
                                    <span class="del_btn" style="display: none;"></span>
                                    <p class="error" style="display: none;">비밀번호를 다시 확인해주세요</p>
                                </div>
                            </dd>
                        </dl>
                    </div>
                    <div class="inter_btn_area">
                        <span>
                            <button type="button" class="btn_white" onclick="history.back();">취소</button>
                        </span>
                        <span>
                            <button type="submit" class="btn_red">확인</button>
                        </span>
                    </div>
                </div>
            </form> <!--가운데 회원정보들-->
        </div>
    </div>
    <!-- 맨 밑 하단 안내사항 -->
<footer id="common_footer">
    <button type="button" class="btn_move_top is-active is-stuck">
      <!-- ::before -->
      <span class="blind1">맨 위로 이동하기</span>
    </button>
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
  <script src="/Tcp2/assets//js/del_btn.js"></script>
</body>
 	<script type="text/javascript">
        window.onload = function() {
            // 로그인 실패 메시지가 있을 경우 메시지 표시
            <% if (request.getAttribute("loginError") != null) { %>
                document.querySelector(".error").style.display = "block";
            <% } %>
        }
    </script>
</html>