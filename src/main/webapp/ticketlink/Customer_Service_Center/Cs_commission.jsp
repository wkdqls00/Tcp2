<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수수료안내</title>
<link rel="stylesheet" type="text/css" href="../../assets/css/commission.css">
  <link rel="stylesheet" href="../../assets/css/common.css">
  <link rel="stylesheet" href="../../assets/css/reset.css">

</head>

<body>
 <header>
    <div class="utill">
        <div class="inner">
           <ul>
	       <%if((Integer)request.getSession().getAttribute("userIdx") == null){ %>
	           <li class="utill_link"><a href="Login/Login.jsp">로그인</a></li>
	           <%} else { %>
	           <li class="utill_link"><a href="#" onclick="if(confirm('로그아웃 하시겠습니까?')) { window.location.href='/Tcp2/LogoutAction'; } return false;">로그아웃</a></li>
	           <%} %>
	           <li class="utill_link"><a href="/Tcp2/Ticket_checkServlet">예매확인/취소</a></li>
	           <%if((Integer)request.getSession().getAttribute("userIdx") == null){ %>
	           <li class="utill_link"><a href="/Tcp2/ticketlink/Login/AgreeToTerms.jsp">회원가입</a></li>
	           <%} %>
	           <li class="utill_link"><a href="/Tcp2/ticketlink/Customer_Service_Center/Cs_Center_main.jsp">고객센터</a></li>
	           <li class="utill_link"><a href="/Tcp2/Mypage_memberServlet">마이페이지</a></li>                    
         </ul>
        </div> 
    </div>
    <div class="nav_box">
        <div class="inner">
            <h1 class="logo"><a href="/Tcp2/ticketlink/main.jsp">로고</a></h1>
            <ul class="nav">
                <li><a href="/Tcp2/ticketlink/main.jsp">공연</a></li>
                <li><a href="/Tcp2/band/band_main.jsp">커뮤니티</a></li>
            </ul>
        </div>
    </div>
    <div class="gnb_box">
        <div class="inner">
            <ul class="gnb_list">
                 <li class="gnb_link"><a href="/Tcp2/ticketlink/main.jsp">홈</a></li>
                <li class="gnb_link"><a href="/Tcp2/ticketlink/main.jsp">공연</a></li>
                <li class="gnb_link"><a href="/Tcp2/ticketlink/Ranking_MainP/weekly_ranking3.jsp">랭킹</a></li>
                <li class="gnb_link"><a href="/Tcp2/band/band_main.jsp">커뮤니티</a></li>
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
          <a href="http://localhost:9090/Tcp2/ticketlink/Login/Find_idResult.jsp"" class="id_pw1">
            <!-- before -->
            아이디<br/>
            패스워드 찾기
          </a>
        </li>
        <li class="qmenu2" id="menu">
          <a href="#"  data-url="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/oneConsultantServlet" class="id_pw2">
            <!-- before -->
            상담내역<br/>
            확인하기
          </a>
        <li class="qmenu3" id="menu">
          <a href="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/Cs_cancel_refund.jsp" class="id_pw3">
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
          <a href="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/Cs_Center_main.jsp" class="meu1">
            고객센터 홈
            <!-- after -->
          </a>
        </li>
        <li class="help_meu2" id="off">
              <!-- href 추가/ on 클릭시 빨간색으로 바뀜 -->
              <a href="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/Cs_notice.jsp" class="meu1">
                공지사항
                <!-- after -->
              </a>
        </li>
        <li class="help_meu3">
          <a href="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/Cs_FAQ.jsp" class="meu1">
            FAQ
            <!-- after -->
          </a>
        </li>
        <li class="help_inquiry_meu">
          <a href="#" data-url="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/oneConsultantServlet" class="meu1">
            1:1상담
            <!-- after -->
          </a>
        </li>
        <li class="help_inquiry_history">
          <a href="oneinquirydetail" class="meu1">
            1:1문의내역
            <!-- after -->
          </a>
        </li>
        <li class="menu_sub">
          <span class="submenu_tit">안내</span>
          <ul class="help_tit">
              <li class="reserveGuide" id="on">
                <a href="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/Cs_reserve_info.jsp">예매안내</a>
              </li>
              <li class="memberGuide" id="off">
                <a href="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/Cs_reserve_membership.jsp">회원정보안내</a>
              </li>
              <li class="commissionGuide" id="off">
                <a href="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/Cs_commission.jsp">수수료안내</a>
              </li>
              <li class="refundGuide" id="off">
                <a href="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/Cs_cancel_refund.jsp">취소/환불안내</a>
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
<!-- 고객센터 본문 수수료안내 -->
        <div class="help_rcont">
          <div class="h3_line">
            <h3 class="info_reserve con_head">수수료 안내</h3>
          </div>
          <div class="cancel_comm c_c">
            <strong>[취소 수수료]</strong>
            <p class="mgt15">
              환불할 은행 계좌번호와 예금주를 정확히 입력하실 경우,<br/>
              취소 처리를 접수한 날로부터 영업일 기준 3~5일 이내에 환불받으실 수 있습니다.<br/>
              신용카드로 결제시, 취소 수수료 및 우편 발송비를 재승인 후 기존 승인금액을 취소 처리합니다.
            </p>
          <div class="commission_table c_t">
            <table>
              <caption>
                <span class="blind">취소 수수료 리스트</span>
              </caption>
              <colgroup>
              <col style="width: 100px;">
              <col style="width: 170px;">
              <col>
              <col style="width: 220px;">
              </colgroup>
              <thead>
                <tr>
                  <th colspan="2" scope="col">구분</th>
                  <th scope="col">취소 수수료</th>
                  <th scope="col">비고</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td rowspan="5">공연/전시</td>
                  <td class="color_black t1">예매 후 7일 이내</td>
                  <td class="color_black t1">
                    <span class="color_point fbold">없음</span>
                  </td>
                  <td rowspan="5" class="t1 fs11 end">
                    <ul class="tinent8">
                      <li class="mgt10">
                        -예매 후 7일 이내라도 취소 시점이<br/>
                        공연 일로부터 10일 이내라면 그에<br/>
                        해당하는 취소수수료가 부과됨<br/>
                        (약관 29조 의거)<br/>
                      </li>
                      <li class="mgt10">
                        - 관람 당일 취소 가능 상품일 경우<br/>
                          당일 취소 시 티켓 금액의 90%가<br/>
                          부과됩니다.
                      </li>
                    </ul>
                  </td>
                </tr>
                <tr>
                  <td class="color_black t1">
                    예매 후 8일<br/>
                    관람일 10일 전
                    </td>
                  <td class="color_black t1">
                    <ul class="tindent11">
                      <li>
                        -뮤지컬, 콘서트, 클래식 등<br/>
                        공연권 : 장당
                        <span class="color_point fbold">4,000</span>
                        원
                      </li>
                      <li class="mgt7">
                        -연극, 전시 등 입장권 : 장당
                        <span class="color_point fbold">2,000</span>
                        원
                      </li>
                    </ul>
                    <p class="mgt5 color_point fbold">티켓금액의 10%이내</p>
                  </td>
                </tr>
                <tr>
                  <td class="color_black t1">관람일 9일전 ~ 7일전</td>
                  <td class="color_black t1">
                    티켓 금액의
                    <span class="color_point fbold">10%</span> 
                  </td>
                </tr>
                <tr>
                  <td class="color_black t1">관람일 6일전 ~ 3일전</td>
                  <td class="color_black t1">
                    티켓 금액의
                    <span class="color_point fbolc">20%</span>
                  </td>
                </tr>
                <tr>
                  <td class="color_black t1">관람일 2일전 ~ 1일전</td>
                  <td class="color_black t1">
                    티켓 금액의
                    <span class="color_point fbolc">30%</span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
          <!-- after -->
      </div>--
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
</section>
  



</body>
</html>