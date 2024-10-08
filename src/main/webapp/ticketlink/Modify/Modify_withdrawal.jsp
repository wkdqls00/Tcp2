<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="/Tcp2/assets/css/modify_member.css">
    <link rel="stylesheet" href="/Tcp2/assets/css/modify_withdrawal.css">
    <link rel="stylesheet" href="/Tcp2/assets/css/footer.css">
</head>
<body>
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
                    <p><%=request.getAttribute("name") %>님</p>
                </div>
                <div class="my_menu_area"> <!--왼쪽 메뉴들-->
                    <ul>
                        <li class="modify"><a href="/Tcp2/Controller?command=modify_member">회원정보수정</a></li>
                        <li class="password"><a href="/Tcp2/Controller?command=modify_password">비밀번호변경</a></li>
                        <li class="sns"><a href="/Tcp2/Controller?command=modify_memberJoin">계정연결설정</a></li>
                        <li class="withdrawal current"><a href="/Tcp2/Controller?command=modify_withdrawal">회원탈퇴</a></li>
                    </ul>
                </div> <!--왼쪽 메뉴들-->
            </div>
            <form action="/Tcp2/Modify_withdrawalAction"> <!--가운데 회원정보들-->
                <div class="sub_content_wrap">
                    <h2 class="main_title">회원탈퇴</h2>
                    <div>
                        <p class="member_dsc">이용에 불편을 드려서 죄송합니다<br>
                            <span style="color: #ef3e42">회원 탈퇴시 혜택이 소멸되고, 정보가 복귀되지 않습니다.</span>
                        </p>
                    </div>
                    <dl class="member_out_box">
                        <dt>서비스 탈퇴 전 유의사항을 반드시 확인해주세요.</dt>
                        <dd>
                            <ul class="outbxcon">
                                <li>서비스 탈퇴 시 즉시 탈퇴 처리되나, 개인정보 도용 등으로 인한 원치 않은 철회, 부정 이용 방지 등에 대비하기 위하여 회원님의 아이디를 포함한 개인 정보가 3일간 보존됩니다.(동의하신 개인정보
                                    처리방침에 명시한 파기 절차에 따라 3일 이후 개인정보는 지체없이 파기하며, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 관계법령에서 정한 일정한 기간 동안 개인정보를 보관합니다.)
                                </li>
                                <li>서비스 탈퇴 후 3일간 개인정보(ex. 휴대전화번호 / 이메일주소 / 개인식별정보(CI/DC))가 보관되며 동일 회원정보로 재가입이 불가능합니다.</li>
                                <li>서비스 탈퇴 시 등록된 예매권과 쿠폰은 삭제되며 재 이용이 불가합니다.</li>
                                <li>진행중인 전자상거래 이용내역(관람일이 경과되지 않은 예매내역, 배송/반품 중 상태 등)이 있는 경우 서비스 탈퇴를 하실 수 없습니다.</li>
                                <li>작성된 게시물은 탈퇴 시 자동 삭제되지 않으며, 삭제가 필요한 경우 게시물 직접 삭제 후 서비스 탈퇴 하셔야 합니다.</li>
                            </ul>
                        </dd>
                    </dl>
                    <div class="member_ck">
                        <span class="checkbox" id="agree_withdrawal">
                            <input type="checkbox" id="agree">
                        </span>
                        <label for="agree" style="display: inline-block; top: 15px;">위 내용을 모두 확인하였으며 동의합니다.</label>
                    </div>
                    <div class="inter_btn_area"> <!--취소, 수정 버튼-->
                        <span>
                            <button type="submit" class="btn_white">취소</button>
                        </span>
                        <span>
                            <button type="submit" class="btn_red" onclick="check()">탈퇴</button>
                        </span> 
                    </div> <!--취소, 수정 버튼-->
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
  

  <script>
    function check() {
      let checkbox = document.getElementById("agree");
      if(!checkbox.checked) {
        alert("동의사항 체크를 해주세요 \n진짜 탈퇴하실건가요?ㅜㅜ");
        event.preventDefault();
      } else if(confirm("정말로 탈퇴하시겠습니까?")){
        alert("탈퇴되었습니다 지금까지 이용해주셔서 감사합니다");
      } else {
    	event.preventDefault();
      }
    }
  </script>
</body>
</html>