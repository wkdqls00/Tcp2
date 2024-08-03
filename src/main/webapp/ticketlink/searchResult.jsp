<%@page import="dto.SearchResultDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>공연 검색 결과</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/footer.css">
    <script src="<%=request.getContextPath()%>/assets/js/jquery-1.12.4.min.js"></script>
    <style>
    	.searchSubmitBtn {
    		height: 32px; width: 40px; border: none; background: #222; color: #fff; border-radius: 6px; font-size: 11px;
    		cursor: pointer;
    	}
    	.searchSubmitBtn:hover {
    		background: #3b3b3b;
    	}
    </style>
</head>
<body>
<%
@SuppressWarnings("unchecked")
ArrayList<SearchResultDTO> list = (ArrayList<SearchResultDTO>)request.getAttribute("list");

%>
	<!-- 헤더  -->
	<header>
      <div class="utill">
          <div class="inner">
              <ul>
                  <li class="utill_link"><a href="Login/Login.jsp">로그인</a></li>
                  <li class="utill_link"><a href="#">예매확인/취소</a></li>
                  <li class="utill_link"><a href="Login/Signup.jsp">회원가입</a></li>
                  <li class="utill_link"><a href="#">고객센터</a></li>
                  <li class="utill_link"><a href="#">마이페이지</a></li>
              </ul>
          </div> 
      </div>
      <div class="nav_box">
          <div class="inner navbox">
              <h1 class="logo"><a href="main.jsp">로고</a></h1>
              <ul class="nav">
                  <li><a href="#">공연/전시</a></li>
                  <li><a href="../band/band_main.jsp">커뮤니티</a></li>
              </ul>
          </div>
      </div>
      <div class="gnb_box">
          <div class="inner">
              <ul class="gnb_list">
                  <li class="gnb_link"><a href="#">홈</a></li>
                  <li class="gnb_link"><a href="#">공연</a></li>
                  <li class="gnb_link"><a href="#">전시</a></li>
                  <li class="gnb_link"><a href="#">랭킹</a></li>
                  <li class="gnb_link"><a href="../band/band_main.jsp">커뮤니티</a></li>
                  <li class="gnb_link" style="padding: 0; padding-top: 10px; padding-left: 10px; float: right;">
                        	<form action="/Tcp2/SearchResult">
		                  	<input type="text" style="width: 200px; padding-inline: 8px;" placeholder="공연을 검색하세요." name="search">
		                  	<button type="submit" class="searchSubmitBtn">검색</button>
		                  	</form>
                  </li>
              </ul>
          </div>
      </div>
  </header>
  <div id="app">
  	<!-- 베스트 공연/전시 -->
            <section class="con_box" style="margin-top: 80px;">
                <div class="inner">
                    <div class="con_header" style="margin-top: 0;">
                        <h2 class="con_tit">검색 결과 &middot;&middot;&middot; <%=list.size()%>건</h2>
                    </div>
                    <div class="item_box">
                        <ul class="item_list" style="margin-bottom: 40px;">
                        <%
                        for(int i = 0; i < list.size(); i++){
                        %>
                            <li class="card_item_04">
                                <a href="#">
                                    <div class="img_box">
                                        <img src="<%=list.get(i).getPoster_url()%>" alt="">
                                    </div>
                                    <div class="txt_box">
                                        <h4 class="item_tit"><%=list.get(i).getPlayName()%></h4>
                                        <div class="info_box">
                                            <span class="item_sub_tit"><%=list.get(i).getPlayhallName()%></span>
                                            <span class="item_date"><%=list.get(i).getPeriod()%></span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <%} %>
                        </ul>
                    </div>
                </div>
            </section>
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
   </footer>
</body>
</html>