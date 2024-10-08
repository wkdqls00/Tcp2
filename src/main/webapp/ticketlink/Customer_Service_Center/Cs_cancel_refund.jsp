<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매안내</title>
<link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/cancel_refund.css">
<link rel="stylesheet" href="/Tcp2/assets/css/common.css">
<link rel="stylesheet" href="/Tcp2/assets/css/reset.css">
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
<main id="container" class="common_container cs_center" role="main" style="display: block; height: 1500px;">
  <div class="main_body" style="height: 1300px;">
    <div class="quick_menu">
      <div class="title">
        <!-- before -->
         <h2 style="font-size: 26px;">고객센터</h2>
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
          <a href="javascript:void(0)" onclick="discG();"class="id_pw5">
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
          <h3 class="info_reserve con_head">취소/환불안내</h3>
          <ul class="tab_two main_tab">
            <li class="tab_on">
              <!--href 채우기 https://~  -->
              <a href="#tabs-1" class="category btn">예매취소안내</a>
              <!-- after -->
            </li>
            <li>
              <!--href 채우기 https://~  -->
              <a href="#tabs-2" class="category btn">환불안내</a>
              <!-- after -->
            </li>
          </ul>

          <div class="info_cancel information" id="tabs-1">
            <div class="join_memlist">
              <strong>[예매 취소 마감시간]</strong>
              <p>
                예매시 확인 및 동의 후 진행이 가능하며, 예매 후에는 마이페이지 예매 상세페이지에서 확인할 수 있습니다.
              </p>
            </div>
            <div class="login_memlist" id="Login_main">
              <strong>[예매 취소시 유의사항]</strong>
              <h1 style="font-size: 15px; margin-top: 12px;">수수료 부과</h1>
              <p> - 상품의 특성에 따라 취소수수료 정책이 달라질 수 있습니다. (예매 시 확인 가능)<br/>
                - 취소수수료는 취소시점에 따라 다르게 부과됩니다. 자세한 내용은 고객센터 > 수수료 안내에서 확인하실 수 있습니다.<br/>
              </p>
              <h1 style="font-size: 15px; margin-top: 12px;">예매 후 예매내역에 대한 변경 불가</h1>
              <p>
              - 예매된 건에 대한 일부 변경(날짜/시간/좌석/결제 등)은 불가하여, 기존 예매건을 취소하시고 다시 예매를 하셔야 합니다.<br/>
                단, 취소 시점에 따라 예매수수료가 환불되지 않거나 취소수수료가 부과될 수 있습니다.<br/>
              - 재예매를 하실 경우, 기존에 예매하셨던 좌석이 보장되지 않을 수 있습니다.<br/>
              </p>
              <h1 style="font-size: 15px; margin-top: 12px;">일괄 취소</h1>
              <p>
                - 행사 상의 문제로 인해 환불을 받으실 경우 별도의 수수료를 공제하지 않으며, 환불 주체가 티켓링크가 아닌 행사 주최사가 될 수 있습니다.<br/>
              </p>
            </div>
          </div>
          <div class="info_refund information" id="tabs-2">
            <div class="bank_transfer">
              <strong>[무통장 입금으로 결제하신 경우]</strong>
              <p>수수료(취소수수료)를 제외한 나머지 금액이 고객 환불 계좌에 입금됩니다.</p>
              <p>온라인 취소시, 
                <a href="" class="color_point" target="_blank" style="display: unset;">마이페이지 > 환불계좌관리</a>
                에서 환불계좌 정보(본인 명의)를 정확히 입력해 주시기 바랍니다.
              </p>
              <ul class="inner_type">
                <li>
                  -타인의 계좌를 이용하거나 명의를 도용했을 경우 서비스 이용이 제한될 수 있습니다.
                </li>
                <li>
                  -취소 처리를 접수한 날로부터 
                  <span class="color_point">영업일 기준 3~5일 이내</span>
                  에 환불받으실 수 있습니다.
                </li>
              </ul>
            </div>
            <div class="card_refund">
              <strong>[카드로 결제하신 경우]</strong>
              <p>취소시점에 따른 취소수수료를 제외한 금액이 부분 취소 처리 됩니다.</p>
              <ul class="inner_type">
                <li>
                  -카드사 관련문의는 개인 정보 확인 절차로 인해 확인 불가합니다. 따로 카드사에 연락바랍니다.
                </li>
                <li>
                  -취소 처리를 접수한 날로부터 
                  <span class="color_point">영업일 기준 3~5일 이내</span>
                  에 환불받으실 수 있습니다.
                </li>
              </ul>
              <img src="/Tcp2/assets/img/ticklink/card payment.png">
            </div>
            <div class="account_transfer">
              <strong>[계좌이체로 결제하신 경우]</strong>
              <p>
                취소 처리를 접수한 날로부터
                <span class="color_point">영업일 기준 1~3일 이내</span>
                에 고객 환불 계좌로 환불받으실 수 있습니다.
              </p>
            </div>
            <div class="ticket_refund">
              <strong>[예매권으로 결제하신 경우]</strong>
              <p>
                사용했던 예매권은 복구됩니다. 단, 유효기간이 만료되었을 경우 환불이 불가합니다.<br/>
                일괄 취소로 인해 복구된 예매권의 유효기간이 이미 만료되었을 경우, 일괄 취소일로부터 1주일의 기간 연장이 제공됩니다.
              </p>
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
  const tabList= document.querySelectorAll('.help_rcont .tab_two li');
  const contents= document.querySelectorAll('.help_rcont .information')
  let activeCont= '';

  for (var i=0; i<tabList.length; i++) {
    tabList[i].querySelector('.btn').addEventListener('click', function(e){
      e.preventDefault();
      for (var j=0; j<tabList.length; j++) {
        tabList[j].classList.remove('tab_on');
        contents[j].style.display= 'none';
      }
      this.parentNode.classList.add('tab_on');
      activeCont = this.getAttribute('href');
      document.querySelector(activeCont).style.display = 'block';
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