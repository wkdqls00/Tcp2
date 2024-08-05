<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>티켓링크</title>
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/footer.css">
    <script src="/Tcp2/assets/js/jquery-1.12.4.min.js"></script>
    <script src="/Tcp2/assets/js/chatBot.js"></script>
    <!-- 스와이퍼 스크립트 -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script>
        $(function(){
            $('.main_swiper_box .sm_box li a').click(function(e){
                e.preventDefault();
                
                var imgsrc = $(this).attr('href');
                $('#big_banner a img').attr('src',imgsrc);
                
                $(this).parent().addClass('on').siblings().removeClass('on');
                
            });
            $('.main_swiper_box .sm_box li').mouseover(function(e){
                e.preventDefault();
                
                var imgsrc = $(this).attr('href');
                $('.big_banner img').attr('src',imgsrc);
                
                $(this).parent().addClass('on').siblings().removeClass('on');
                
            });
        });
        
    </script>
     <style>
        .card_item_04{margin: 50px 28px 0 0;width: 259px;}
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
	TicketlinkMainDao dao = new TicketlinkMainDao();
	ArrayList<SearchResultDTO> list = dao.getPopular();
	ArrayList<RecommendPDTO> list2 = dao.recommendPDto();
	%>
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
                <div class="inner navbox">
                    <h1 class="logo"><a href="/Tcp2/ticketlink/main.jsp">로고</a></h1>
                    <ul class="nav">
                        <li><a href="/Tcp2/ticketlink/main.jsp">공연</a></li>
                        <li><a href="/Tcp2/band/band_main.jsp">커뮤니티</a></li>
                    </ul>
                </div>
            </div>
            <div class="gnb_box">
                <div class="inner ?">
                    <ul class="gnb_list">
                        <li class="gnb_link"><a href="/Tcp2/ticketlink/main.jsp">홈</a></li>
                        <li class="gnb_link"><a href="/Tcp2/ticketlink/main.jsp">공연</a></li>
                        <li class="gnb_link"><a href="/Tcp2/ticketlink/Ranking_MainP/weekly_ranking3.jsp">랭킹</a></li>
                        <li class="gnb_link"><a href="/Tcp2/band/band_main.jsp">커뮤니티</a></li>
                        <li class="gnb_link" style="padding: 0; padding-top: 10px; padding-left: 10px; float: right;">
                        	<form action="/Tcp2/SearchResult">
		                  	<input type="text" style="width: 200px; padding-inline: 8px;" placeholder="공연을 검색하세요." name="search" minlength="2">
		                  	<button type="submit" class="searchSubmitBtn">검색</button>
		                  	</form>
	                 	</li>
                    </ul>
                </div>
            </div>
        </header>
        <main>
        <div id="app">
            <div class="main_swiper_box swiper mySwiper">
                <div class="big_banner swiper-wrapper" id="big_banner">
                    <div class="swiper-slide"><a href="#" onclick="clickbanner(); return false;"><img src="/Tcp2/assets/img/ticklink/BigBanner_01.jpg" alt="메인이미지"></a></div>
                </div>
                <ul class="sm_box">
                    <li class="sm_img on" playIdx="1397">
                        <a href="/Tcp2/assets/img/ticklink/BigBanner_01.jpg"><img src="/Tcp2/assets/img/ticklink/thumbnail_01.jpg" alt=""></a>
                    </li>
                    <li class="sm_img" playIdx="2442">
                        <a href="/Tcp2/assets/img/ticklink/BigBanner_02.jpg"><img src="/Tcp2/assets/img/ticklink/thumbnail_02.jpg" alt=""></a>
                    </li>
                    <li class="sm_img" playIdx="3229">
                        <a href="/Tcp2/assets/img/ticklink/BigBanner_03.jpg"><img src="/Tcp2/assets/img/ticklink/thumbnail_03.jpg" alt=""></a>
                    </li>
                    <li class="sm_img" playIdx="3039">
                        <a href="/Tcp2/assets/img/ticklink/BigBanner_04.jpg"><img src="/Tcp2/assets/img/ticklink/thumbnail_04.jpg" alt=""></a>
                    </li>
                </ul>   
            </div>
            <section class="con_box inner">
                <div class="con_header">
                    <h2 class="con_tit">추천공연</h2>
                    <a href="/Tcp2/ticketlink/Ranking_MainP/weekly_ranking3.jsp">전체보기</a>
                </div>
                <div class="item_box">
                    <ul class="item_list">
<%
	for(int i = 0; i < 4; i++){
%>
                        <li class="card_item">
                            <a href="/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=<%=list2.get(i).getPlay_idx()%>">
                                <div class="img_box">
                                    <img src="<%=list2.get(i).getPoster_url()%>" alt="">
                                </div>
                                <div class="txt_box">
                                    <h4 class="item_tit"><%=list2.get(i).getPlayName()%></h4>
                                    <div class="info_box">
                                        <span class="item_date"><%=list.get(i).getPeriod()%></span>
                                    </div>
                                </div>
                            </a>
                        </li>
<%} %>
                    </ul>
                </div>
            </section>
            <!-- 동영상 -->
            <!-- 베스트 공연/전시 -->
            <section class="con_box">
                <div class="inner">
                    <div class="con_header">
                        <h2 class="con_tit">베스트 공연</h2>
                    </div>
                    <div class="item_box">
                        <ul class="item_list">
                       <%
                       System.out.println("asd");
                       System.out.println(list.size());
                        for(int i = 0; i < list.size(); i++){
                        %>
                            <li class="card_item_04">
                                <a href="/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=<%=list.get(i).getPlay_idx()%>">
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
            <!-- 공연장 / 길찾기 -->
            <section class="con_box">
                <div class="inner">
                    <div class="con_header">
                        <h2 class="con_tit">공연장</h2>
                    </div>
                    <div class="con_sub">
                        <p class="con_sub_tit">지역별 공연장과 맛집 검색</p>
                    </div>
                    <div class="area_btn_box">
                        <ul class="area_btn_list">
                            <li class="area_btn_item">
                                <button class="area_btn">서울</button>
                            </li>
                            <li class="area_btn_item">
                                <button class="area_btn">대전</button>
                            </li>
                            <li class="area_btn_item">
                                <button class="area_btn">대구</button>
                            </li>
                            <li class="area_btn_item">
                                <button class="area_btn">부산</button>
                            </li>
                        </ul>
                    </div>
                    <div class="map_area">
                        
                    </div>
                </div>
            </section>
        </div>
        </main>

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
        </footer>
    </div>
    <script>
	    (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();
	
	    ChannelIO('boot', {
	      "pluginKey": "60ba9da0-33fe-48a9-8bcf-3f7d99fa2591"
	    });
	    
	    function clickbanner(){
	    	let play_idx = document.querySelector('.sm_img.on').getAttribute('playIdx');
	    	location.href='/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx='+play_idx;
	    }
    </script>
</body>
</html>