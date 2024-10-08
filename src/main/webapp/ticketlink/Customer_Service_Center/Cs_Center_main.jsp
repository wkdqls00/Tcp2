<%@page import="java.util.ArrayList"%>
<%@page import="dto.RecentNoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CS_main</title>
<link rel="stylesheet" type="text/css"  href="/Tcp2/assets/css/Service.css">
<link rel="stylesheet" href="/Tcp2/assets/css/common.css">
<link rel="stylesheet" href="/Tcp2/assets/css/reset.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>
		$(document).ready(function() {
			$('a').hover(aHoverln, aHoverOut);
		});

		function aHoverln() {
			$(this).css("color", "#ED1C24");
		}
		function aHoverOut() {
			$(this).css("color", "#000");
		}
		</script>

</head>

<body>

<!-- a태그에 href부분 채우기/ 1:1상담, 1:1문의내역 input부분 팝업 value채워주기 -->
<%
	@SuppressWarnings("unchecked")
	ArrayList<RecentNoticeDTO> list = (ArrayList<RecentNoticeDTO>)request.getAttribute("list");
%>
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
<!-- 본문 주요 내용 -->
    <div class="help_content">
      <div class="search_help">
        <div class="help_box">
          <span class="searchName">질문 검색하기</span>
          <input type="text" id="search_help" title="검색어 입력" placeholder="궁금하신 점이 무엇인가요?">
          <a href="#" id="searchButton" onclick="alert('준비중입니다.'); return false;" class="btn_search">
            <!-- before -->
            검색
          </a>
          <!-- href/ onclick 채우기(https:://~~) -->
          <a href="" onclick="writeInquire()" class="btn btn_full">1:1문의하기</a>
        </div>
      </div>
      <div class="box_banner">
        <a href="#" onclick="alert('준비중입니다.')" >
          <img src="https://tketlink.dn.toastoven.net/tl/house_event/742x56_pink.jpg">
        </a>
      </div>
      <ul class="help_link">
          <li id="boxing1">
            <a href="/Tcp2/Controller?command=reserveinfo" class=" help_box_guide">
              <strong class="link_title">
                <span class="color_point">예매 도움</span>
                받기
                <!-- after -->
              </strong>
              <span class="link_text">
                예매 안내를 통해서<br>
                편리한 예매방법을 <br/> 
                알아보세요
              </span>
              <!-- after -->
            </a>
          </li>
          <li id="boxing2">
            <a href="" onclick="writeInquire(); return false;"class="help_box_personal">
              <strong class="link_title">
                <span class="color_point">1:1 상담</span>
                받기
                <!-- after -->
              </strong>
              <span class="link_text">
                빠르고 간편한<br/>
                온라인 1:1문의를<br/> 
                이용해보세요
              </span>
              <!-- after -->
            </a>
            <!-- 1:1 상담 팝업 -->
          </li>
          <li id="boxing3">
            <a href="/Tcp2/Controller?command=faq" class="help_box_faq">
              <strong class="link_title">
                <span class="color_point">FAQ</span>
                보기
                <!-- after -->
              </strong>
              <span class="link_text">
                궁금한 질문들을<br/>
                쉽고 편리하게<br/> 
                한번에 알아보세요
              </span>
              <!-- after -->
            </a>
          </li>
          <li id="boxing4">
            <a href="/Tcp2/Controller?command=notice" class="ticket_news">
              <strong class="link_title1">
                <span class="color_point">티켓 소식</span>
                알아보기
                <!-- after -->
              </strong>
              <span class="link_text">
                티켓링크의<br/>
                새로운 소식들을<br/> 
                빠르게 접해보세요
              </span>
              <!-- after -->
            </a>
          </li>
          <li id="boxing5">
            <div class="help_box_consult">
              <strong class="desc_title">예매 상담 하기</strong>
              <span class="desc_text">
                <span class="desc_phone">1588-7890</span>
                <span class="desc_time">10:00~19:00 (월~일)</span>
              </span>
              <!-- after -->
            </div>
          </li>
          <li id="boxing6">
            <div class="help_box_inquiry">
              <strong class="desc_title">문의하기</strong>
              <span class="desc_text">
                <span class="desc_phone">1588-4567</span>
                <span class="desc_time">10:00~19:00 (월~일)</span>
              </span>
              <!-- after -->
            </div>
          </li>
      </ul>
      <div class="helpmain_list">
        <div class="helpmain_question">
          <strong>자주 묻는 질문</strong>
          <ul>
            <li>
              <a href="/Tcp2/Controller?command=membership">비밀번호 변경을 하고 싶어요.</a>
            </li>
            <li>
              <a href="/Tcp2/Controller?command=membership">내 정보를 변경하고 싶어요.</a>
            </li>
            <li>
              <a href="/Tcp2/Controller?command=reserveinfo">예매를 빨리 하려면?</a>
            </li>
            <li>
              <a href="javascript:void(0)" onclick="disG();">할인 수단을 알고 싶어요.</a>
            </li>
            <li>
              <a href="javascript:void(0)" onclick="discG();">할인되는 신용카드는 뭔가요?</a>
            </li>
          </ul>
        </div>
        <div class="helpmain_notice">
          <strong>최근 공지 사항</strong>
          <ul>
          <%for(int i = 0; i < 5; i++){ %>
            <li>
              <a href="/Tcp2/Controller?command=noticedetail&ni=<%=list.get(i).getNotice_idx()%>">
				<%=list.get(i).getTitle() %>
              </a>
            </li>
            <%}%>
          </ul>
        </div>
      </div>
    </div>
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
    function writeInquire() {
      window.open('/Tcp2/Controller?command=wirteinquire', '', 'width=900, height=1020');
    }
    function showInquireList() {
        window.open('/Tcp2/Controller?command=inquirelist', '', 'width=900, height=1020');
    }
  </script>
  
<script>
 function disG() {
		alert('해당사항은 아직 준비중입니다.');
}

 function discG() {
	 	alert('해당 사항은 곧 업데이트될 예정입니다. 조금만 기다려주세요!');
 }

</script>
</body>
</html>