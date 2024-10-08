<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매안내</title>
<link rel="stylesheet" href="/Tcp2/assets/css/reset.css">
<link rel="stylesheet" href="/Tcp2/assets/css/common.css">
<link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/info.css">

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
          <h3 class="info_reserve con_head">예매 안내</h3>
          <ul class="tab_two main_tab">
            <li class="tab_on">
              <!--href 채우기 https://~  -->
              <a href="#performance" class="btn">공연</a>
              <!-- after -->
            </li>
            <li>
              <!--href 채우기 https://~  -->
              <a href="#exhibition" class="btn">전시</a>
              <!-- after -->
            </li>
          </ul>
          <p class="guide_txt">
            <span class="color_point">공연 티켓</span>
            예매 방법을 안내해 드립니다.
          </p>
          <ul class="reserve_step" id="performance">
              <li class="rst1">
                <strong class="st1">
                  <span class="step_num">STEP1.</span>
                  <span class="step_title">날짜/회차</span>
                </strong>
                <div class="st1_exp">
                  <p>관람하실 공연의 날짜, 회차를 선택하고 [애매하기]를 클릭합니다.</p>
                  <em class="first_notice">
                    <!-- before -->
                     예매창이 뜨지 않나요?
                    <span class="color_point">팝업을 허용</span>
                    해주세요
                    </em>
                    <ul class="desc_list">
                      <li>
                        <!-- before -->
                        Internet Explorer : 도구(Alt+X) > 인터넷 옵션 > 개인정보 > 팝업차단 > 팝업 차단 사용 체크해제
                      </li>
                      <li>
                        <!-- before -->
                         Chrome : 메뉴 > 설정 > 고급 설정 표시 > 개인정보 > 콘텐츠 설정 > 팝업 - 모든 사이트에서 팝업 표시 허용 체크
                      </li>
                    </ul>
                </div>
                <!-- after -->
              </li>
              <li class="rst2">
                <strong class="st2">
                  <span class="step_num">STEP2.</span>
                  <span class="step_title">등급/좌석</span>
                </strong>
                <div class="st1_exp2">
                  <p>원하는 좌석을 선택합니다.</p>
                  <ul class="desc_list">
                    <li>
                      <!-- before -->
                       좌석 선택후 [다음단계]를 클릭하면 해당좌석이
                       <span class="color_point">8분 동안 선점</span>
                       됩니다. (결제를 완료하셔야 예매가 완료됩니다.)
                    </li>
                  </ul>
                </div>
                <!-- after -->
              </li>
              <li class="rst3">
                <strong class="st2">
                  <span class="step_num">STEP3.</span>
                  <span class="step_title">권종/할인/매수</span>
                </strong>
                <div class="st1_exp3">
                  <p>티켓의 가격 및 할인정보를 확인하고, 예매할 티켓 매수를 선택합니다.</p>
                </div>
                <!-- after -->
              </li>
              <li class="rst4">
                <strong class="st2">
                  <span class="step_num">STEP4.</span>
                  <span class="step_title">예매확인</span>
                </strong>
                <div class="st1_exp4">
                  <p>우측 예매정보에서 선택한 내역을 최종적으로 확인합니다.</p>
                  <ul class="desc_list">
                    <li>
                      <!-- before -->
                      (필수) 취소 수수료 정책에 동의가 필요합니다.
                    </li>
                  </ul>
                </div>
              </li>
              <li class="rst5">
                <strong class="st2">
                  <span class="step_num">STEP5.</span>
                  <span class="step_title">결제</span>
                </strong>
                <div class="st1_exp5">
                  <p>결제 창이 뜨면, 결제 수단을 선택하고 결제합니다.</p>
                  <ul class="desc_list">
                    <li>
                      <!-- before -->
                      (필수) 취소 수수료 정책에 동의가 필요합니다.
                      [예매확인] 또는, 마이페이지>예매확인/취소에서 예매된 내역을 확인해주세요.
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
          <ul class="reserve_step" id="exhibition">
            <li class="rst1">
              <strong class="st1">
                <span class="step_num">STEP1.</span>
                <span class="step_title">날짜/회차</span>
              </strong>
              <div class="st1_exp">
                <p>관람하실 전시의 날짜, 회차를 선택하고 [애매하기]를 클릭합니다.</p>
                <em class="first_notice">
                  <!-- before -->
                   예매창이 뜨지 않나요?
                  <span class="color_point">팝업을 허용</span>
                  해주세요
                  </em>
                  <ul class="desc_list">
                    <li>
                      <!-- before -->
                      Internet Explorer : 도구(Alt+X) > 인터넷 옵션 > 개인정보 > 팝업차단 > 팝업 차단 사용 체크해제
                    </li>
                    <li>
                      <!-- before -->
                       Chrome : 메뉴 > 설정 > 고급 설정 표시 > 개인정보 > 콘텐츠 설정 > 팝업 - 모든 사이트에서 팝업 표시 허용 체크
                    </li>
                  </ul>
              </div>
              <!-- after -->
            </li>
            <li class="rst2">
              <strong class="st2">
                <span class="step_num">STEP2.</span>
                <span class="step_title">권종/할인/매수</span>
              </strong>
              <div class="st1_exp2">
                <p>티켓의 가격 및 할인정보를 확인하고, 예매할 티켓 매수를 선택합니다.</p>
                <ul class="desc_list">
                  <li>
                    <!-- before -->
                     좌석 선택후 [다음단계]를 클릭하면 해당좌석이
                     <span class="color_point">8분 동안 선점</span>
                     됩니다. (결제를 완료하셔야 예매가 완료됩니다.)
                  </li>
                </ul>
              </div>
              <!-- after -->
            </li>
            <li class="rst4">
              <strong class="st2">
                <span class="step_num">STEP3.</span>
                <span class="step_title">예매확인</span>
              </strong>
              <div class="st1_exp4">
                <p>우측 예매정보에서 선택한 내역을 최종적으로 확인합니다.</p>
                <ul class="desc_list">
                  <li>
                    <!-- before -->
                    (필수) 취소 수수료 정책에 동의가 필요합니다.
                  </li>
                </ul>
              </div>
            </li>
            <li class="rst5">
              <strong class="st2">
                <span class="step_num">STEP4.</span>
                <span class="step_title">결제</span>
              </strong>
              <div class="st1_exp5">
                <p>결제 창이 뜨면, 결제 수단을 선택하고 결제합니다.</p>
                <ul class="desc_list">
                  <li>
                    <!-- before -->
                    (필수) 취소 수수료 정책에 동의가 필요합니다.
                    [예매확인] 또는, 마이페이지>예매확인/취소에서 예매된 내역을 확인해주세요.
                  </li>
                </ul>
              </div>
            </li>
          </ul>
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
    const contents= document.querySelectorAll('.help_rcont ul.reserve_step')
    let activeCont= '';

    for (var i=0; i<tabList.length; i++) {
      tabList[i].querySelector('.btn').addEventListener('click', function(e){
        e.preventDefault();
        for (var j=0; j<tabList.length; j++) {
          tabList[j].classList.remove('tab_on');
          contents[j].style.display='none';
        }
        this.parentNode.classList.add('tab_on');
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