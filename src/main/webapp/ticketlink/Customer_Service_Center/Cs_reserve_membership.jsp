<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보안내</title>
 <link rel="stylesheet" href="/Tcp2/assets/css/common.css">
  <link rel="stylesheet" href="/Tcp2/assets/css/reset.css">
  <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/membership.css">

</head>
<body>
  <header>
    <div class="utill">
        <div class="inner">
          <ul>
            <%if(request.getSession().getAttribute("userIdx") == null){ %>
              <li class="utill_link"><a href="/Tcp2/Controller?command=login">로그인</a></li>
              <%} else { %>
              <li class="utill_link"><a href="#" onclick="if(confirm('로그아웃 하시겠습니까?')) { window.location.href='/Tcp2/Controller?command=logout'; } return false;">로그아웃</a></li>
              <%} %>
              <li class="utill_link"><a href="/Tcp2/Controller?command=ticket_check">예매확인/취소</a></li>
          <%if(request.getSession().getAttribute("userIdx") == null){ %>
              <li class="utill_link"><a href="/Tcp2/Controller?command=newaccount">회원가입</a></li>
              <%} %>
              <li class="utill_link"><a href="/Tcp2/Controller?command=cscenter">고객센터</a></li>
              <li class="utill_link"><a href="/Tcp2/Controller?command=mypage">마이페이지</a></li>
		  </ul>
        </div> 
    </div>
    <div class="nav_box">
        <div class="inner">
            <h1 class="logo"><a href="/Tcp2/Controller?command=main">로고</a></h1>
          <ul class="nav">
              <li><a href="/Tcp2/Controller?command=main">공연</a></li>
              <li><a href="/Tcp2/Controller?command=band_main">커뮤니티</a></li>
          </ul>
      </div>
  </div>
  <div class="gnb_box">
      <div class="inner">
          <ul class="gnb_list">
              <li class="gnb_link"><a href="/Tcp2/Controller?command=main">홈</a></li>
              <li class="gnb_link"><a href="/Tcp2/Controller?command=main">공연</a></li>
              <li class="gnb_link"><a href="/Tcp2/Controller?command=ranking">랭킹</a></li>
              <li class="gnb_link"><a href="/Tcp2/Controller?command=band_main">커뮤니티</a></li>
          </ul>
      </div>
  </div>
</header>
<!-- 고객센터 본문(상단메뉴) -->
<main id="container" class="common_container cs_center" role="main">
  <div class="main_body">
    <div class="quick_menu">
      <div class="title">
        <!-- before -->
         <h2>고객센터</h2>
      </div>
      <ul>
        <li class="qmenu1" id="menu">
          <a href="/Tcp2/Controller?command=find_id" class="id_pw1">
            <!-- before -->
            아이디<br/>
            패스워드 찾기
          </a>
        </li>
        <li class="qmenu2" id="menu">
      <a href="" onclick="showInquireList(); return false;" class="id_pw2">
            <!-- before -->
            상담내역<br/>
            확인하기
          </a>
        </li> 
        <li class="qmenu3" id="menu">
          <a href="" onclick="writeInquire(); return false;" class="id_pw3">
            <!-- before -->
            예매취소<br/>
            환불문의
          </a>
        </li>
        <li class="qmenu4" id="menu">
          <a href="javascript:void(0)" onclick="disG();" class="id_pw4">
            <!-- before -->
            할인수단<br/>
            안내
          </a>
        </li>
        <li class="qmenu5" id="menu">
          <a href="javascript:void(0)" onclick="discG();" class="id_pw5">
            <!-- before -->
            할인카드<br/>
            안내보기
          </a>
        </li>
      </ul>  
  </div>

  <div class="help_cont">
    <ul class="help_menu">
        <li class="help_meu1" id="on">
          <!-- href 추가/ on 클릭시 빨간색으로 바뀜 -->
          <a href="/Tcp2/Controller?command=cscenter" class="meu1">
            고객센터 홈
            <!-- after -->
          </a>
        </li>
        <li class="help_meu2" id="off">
              <!-- href 추가/ on 클릭시 빨간색으로 바뀜 -->
              <a href="/Tcp2/Controller?command=notice" class="meu1">
                공지사항
                <!-- after -->
              </a>
        </li>
        <li class="help_meu3">
          <a href="/Tcp2/Controller?command=faq" class="meu1">
            FAQ
            <!-- after -->
          </a>
        </li>
        <li class="help_inquiry_meu">
          <a href="#" onclick="writeInquire(); return false;" class="meu1">
            1:1상담
            <!-- after -->
          </a>
        </li>
        <li class="help_inquiry_history">
          <a href="#" onclick="showInquireList(); return false;" class="meu1">
            1:1문의내역
            <!-- after -->
          </a>
        </li>
        <li class="menu_sub">
          <span class="submenu_tit">안내</span>
          <ul class="help_tit">
              <li class="reserveGuide" id="on">
                <a href="/Tcp2/Controller?command=reserveinfo">예매안내</a>
              </li>
              <li class="memberGuide" id="off">
                <a href="/Tcp2/Controller?command=membership">회원정보안내</a>
              </li>
              <li class="commissionGuide" id="off">
                <a href="/Tcp2/Controller?command=commission">수수료안내</a>
              </li>
              <li class="refundGuide" id="off">
                <a href="/Tcp2/Controller?command=cancel">취소/환불안내</a>
              </li>
              <li class="discountGuide" id="off">
                <a href="javascript:void(0)" onclick="disG();">할인수단안내</a>
              </li>
              <li class="discountcardGuide" id="off">
                <a href="javascript:void(0)" onclick="discG();">할인카드안내</a>
              </li>
            </ul>
        </li>
      </ul>
    </div>
<!-- 1:1상담/ 1:1문의내역 팝업 -->
      <input id="inquiryUrl" type="hidden" value="">
      <input id="inquiryHistoryUrl" type="hidden" value="">
<!-- 고객센터 본문 예매안내 -->
        <div class="help_rcont">
          <h3 class="info_reserve con_head">회원 정보 안내</h3>
          <div class="membership_tabs widget_content">
            <ul class="member_tab widget" role="tablist">
              <li class="state_default tab_widget1 login_tab click_on" role="tab" aria-selected="true" aria-expanded="true">
                <!-- before -->
                 <a href="#tabs-1" onclick="selectTab(this)" class="n_category ui_tabs">로그인</a>
                <!-- after -->
                </li>
                <li class="state_default tab_widget2 update_member" role="tab" aria-selected="false" aria-expanded="false">
                  <a href="#tabs-2" onclick="selectTab(this)" class="n_category ui_tabs">회원 정보 수정</a>
                <!-- after -->
                </li>
                <li class="state_default tab_widget3 withdrawl_member"  role="tab" aria-selected="false" aria-expanded="false">
                  <a href="#tabs-3" onclick="selectTab(this)" class="n_category ui_tabs">회원 탈퇴</a>
                  <!-- after -->
                </li>
            </ul>
            <div class="total_page information" id="tabs-1">
              <div class="join_memlist">
                <strong>[회원가입]</strong>
                <p>
                  티켓 링크에 처음 방문하셨나요?<br/>
                  화면 우측 상단의
                  <a onclick="location.href='/Tcp2/Controller?command=newaccount'">[회원가입]</a>
                  에서 간편하게 가입하시면 다양한 공연, 전시 티켓을 예매할 수 있습니다.
                </p>
              </div>
              <div class="login_memlist" id="Login_main">
                <strong>[로그인]</strong>
                <p>아이디를 보유하시고 계신가요? <br/>
                화면 우측 상단의 
                <a onclick="location.href='/Tcp2/Controller?command=login'">[로그인]</a>
                에서 아이디, 비밀번호를 입력하여 로그인하시면<br/>
                티켓 예매, 1:1상담 등의 서비스를 이용할 수 있습니다.
                </p>
              </div>
              <div class="find_memlist">
                <strong>[아이디/비밀번호 찾기]</strong>
                <p>
                  <a href="/Tcp2/Controller?command=find_id" target="_blank" title="새창">아이디 찾기</a>
                  <br/>
                  이메일 또는 휴대폰 아이디, 성별, 이름, 생년월일(8자리)를 입력하시면
                  아이디를 찾으실 수 있습니다.<br/>
                  (개인 정보 보호를 위하여, 전체 아이디는 본인인증후 확인 가능)
                </p>
                <p>
                  <a href="/Tcp2/Controller?command=find_pw" target="_blank" title="새창">비밀번호 찾기</a>
                  <br/>
                  이메일 또는 휴대폰 아이디, 성별, 이름, 생년월일(8자리)를 입력하시고<br/>
                  등록된 정보나 본인인증 후 비밀번호를 찾으실 수 있습니다.<br/>
                </p>
              </div>
              <div class="info_memlist">
                <strong>[본인 인증시 SMS또는 이메일이 도착하지 않을 때</strong>
                <p>
                  스팸 또는 단체메일에서 확인되지 않을 경우
                  <a href="" target="_blank" title="새창">도움말</a>
                  참고해주세요.
                </p>
              </div>
            </div>
            <div class="membership_update information" id="tabs-2">
              <div class="id_phone_update">
                <strong>[휴대폰 아이디, 연락처 수정]</strong>
                <p>회원정보 수정 페이지에서 [변경] 버튼을 클릭하시고, 휴대폰 인증을 하시면 수정이 완료됩니다.</p>
              </div>
              <div class="phone_change">
                <strong>[본인인증 휴대폰 변경]</strong>
                <p>회원정보 수정 페이지에서 [변경] 버튼을 클릭하시고, 휴대폰 인증을 하시면 변경이 완료됩니다.</p>
              </div>
              <div class="password_change">
                <strong>[비밀번호 변경]</strong>
                <p>회원정보 수정 페이지에서 [변경] 버튼을 클릭하시고, 사용중인 비밀번호와 신규 비밀번호를 입력하시면 변경이 완료됩니다.</p>
                <p>-영문자, 숫자, 특수문자 조합으로 8~15자리 입력해주세요.</p>
              </div>
              <div class="address_change">
                <strong>[주소 변경]</strong>
                <p>회원정보 수정 페이지에서 [변경] 버튼을 클릭하시고, 주소 정보를 입력하시면 수정이 완료됩니다.</p>
              </div>
            </div>
            <div class="withdrawl_membership information" id="tabs-3">
              <div class="withdrawl">
                <div class="wd_info">
                  <strong>그동안 티켓링크 서비스를 이용해주셔서 감사합니다.</strong>
                  <p>회원 탈퇴하시면 예매권, 할인 쿠폰 등 혜택이 소멸되며 커뮤니티도 이용 제한됩니다.</p>
                  <p>재가입 시에도 정보가 복구되지 않습니다.</p>
                </div>
              </div>
            </div>
          </div>
          <!-- after -->
        </div>
        <!-- after -->
      </div>
</main>

<!-- 맨 밑 하단 안내사항 -->
<section id="common_footer">
  <button type="button" class="btn_move_top is-active is-stuck">
    <!-- ::before -->
    <span class="blind1">맨 위로 이동하기</span>
  </button>
  <div class="footer_menu">
    <ul class="footer_menu_list">
      <li class="footer_menu_item">
        <a href="" onclick="disG(); return false;" class="footer_menu_link">회사소개</a>
      </li>
      <li class="footer_menu_item">
      <!-- ::before -->
      <a href="" onclick="disG(); return false;" class="footer_menu_link">
        <span class="text_bold">개인정보 처리방침</span>
      </a>
      </li>
      <li class="footer_menu_item">
      <!-- ::before -->
      <a href="" onclick="disG(); return false;" class="footer_menu_link">청소년 보호정책</a>
      </li>
      <li class="footer_menu_item">
      <!-- ::before -->
      <a href="" onclick="disG(); return false;" class="footer_menu_link">이용약관</a>
      </li>
      <li class="footer_menu_item">
      <!-- ::before -->
      <a href="" onclick="disG(); return false;" class="footer_menu_link">고객센터</a>
      </li>
      <li class="footer_menu_item">
      <!-- ::before -->
      <a href="" onclick="disG(); return false;" class="footer_menu_link">티켓판매안내</a>
      </li>
      <li class="footer_menu_item">
       <!-- ::before -->
       <a href="" onclick="disG(); return false;" class="footer_menu_link">광고안내</a>
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
</section>
  
<script>
const tabList= document.querySelectorAll('.help_rcont .membership_tabs .member_tab li');
const contents= document.querySelectorAll('.help_rcont .information')
let activeCont= '';

for (var i=0; i<tabList.length; i++) {
  tabList[i].querySelector('.ui_tabs').addEventListener('click', function(e) {
    e.preventDefault();
    for (var j=0; j<tabList.length; j++) {
      tabList[j].classList.remove('click_on');
      contents[j].style.display= 'none';
    }
    this.parentNode.classList.add('click_on');
    activeCont= this.getAttribute('href');
    document.querySelector(activeCont).style.display= 'block';
  });
}
function writeInquire() {
    window.open('/Tcp2/Controller?command=wirteinquire', '', 'width=900, height=1020');
  }
  function showInquireList() {
      window.open('/Tcp2/Controller?command=inquirelist', '', 'width=900, height=1020');
  }
  function disG() {
		alert('해당사항은 아직 준비중입니다.');
}

function discG() {
	 	alert('해당 사항은 곧 업데이트될 예정입니다. 조금만 기다려주세요!');
}

</script>

</body>
</html>