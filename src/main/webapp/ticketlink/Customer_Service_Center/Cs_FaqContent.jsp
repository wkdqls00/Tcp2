<%@page import="dto.FaqSelectDTO"%>
<%@page import="dto.FaqDTO"%>
<%@page import="dto.Customer_ServiceCDTO"%>
<%@page import="dao.Customer_ServiceDAO"%>
<%@page import="dto.Customer_ServiceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
@SuppressWarnings("unchecked")
ArrayList<FaqSelectDTO> list = (ArrayList<FaqSelectDTO>)request.getAttribute("list");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 내용</title>
<link rel="stylesheet" href="/Tcp2/assets/css/reset.css">
<link rel="stylesheet" href="/Tcp2/assets/css/common.css">
<link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/noticeContent.css">

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
      <div class="Cs_title">
        <!-- before -->
         <h2>고객센터</h2>
      </div>
      <ul>
        <li class="qmenu1" id="menu">
          <a href="http://localhost:9090/Tcp2/ticketlink/Login/Find_idResult.jsp" class="id_pw1">
            <!-- before -->
            아이디<br/>
            패스워드 찾기
          </a>
        </li>
        <li class="qmenu2" id="menu">
          <a href="#" data-url="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/oneConsultantServlet" class="id_pw2">
            <!-- before -->
            상담내역<br/>
            확인하기
          </a>
        <li class="qmenu3" id="menu">
          <a href="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/Cs_commission.jsp" class="id_pw3">
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
          <a href="#"  data-url="http://localhost:9090/Tcp2/ticketlink/Customer_Service_Center/oneConsultantServlet" class="meu1">
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
                <a  href="javascript:void(0)" onclick="disG();">할인수단안내</a>
              </li>
              <li class="discountcardGuide" id="off">
                <a  href="javascript:void(0)" onclick="discG();">할인카드안내</a>
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
  <h3 class="roon_head">FAQ</h3>
   <div class="htab_common hmain_tab">
	<!-- [D] 활성상태일때 .on 추가입니다. -->
			<div class="list_view">
				<div class="category"><%=list.get(0).getCategory()%></div>
				<div class="list_title"><%=list.get(0).getFaq() %></div>
			</div>
			<div class="list_date">
			등록일 :
			<%=list.get(0).getFaq_date() %>
			</div>
			<div class="list_cont">
				<p><%=list.get(0).getReply() %></p>
			</div>			
	   </div>
		<div class="list_btn"> 
		   <div class="fr">	
			<a href="/Tcp2/ticketlink/Customer_Service_Center/Cs_FAQ.jsp" class="btn btn_blank">목록보기</a>
		   </div>	
		</div>
    </div>
  </div>
        <!-- after -->   
  
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
 function disG() {
		alert('해당사항은 아직 준비중입니다.');
}

 function discG() {
	 	alert('해당 사항은 곧 업데이트될 예정입니다. 조금만 기다려주세요!');
 }

</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const titleLength = 20; // 제목 최대 길이
        const contentLength = 50; // 내용 최대 길이

        function truncateText(text, maxLength) {
            if (text.length > maxLength) {
                return text.substring(0, maxLength) + '...';
            }
            return text;
        }

        const titles = document.querySelectorAll('.title');
        const contents = document.querySelectorAll('.content');

        titles.forEach(title => {
            title.textContent = truncateText(title.textContent, titleLength);
        });

        contents.forEach(content => {
            content.textContent = truncateText(content.textContent, contentLength);
        });
    });
    function writeInquire() {
        window.open('/Tcp2/Controller?command=wirteinquire', '', 'width=900, height=1020');
      }
      function showInquireList() {
          window.open('/Tcp2/Controller?command=inquirelist', '', 'width=900, height=1020');
      }
</script>
</body>
</html>