<%@page import="dto.Week_RDTO"%>
<%@page import="dto.Week_RankDTO"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.Genre_RankDAO"%>
<%@page import="dto.Genre_RankDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// int genre_idx = 1;
	// int play_idx = Integer.parseInt(request.getParameter("play_idx"));
	int genre_idx = Integer.parseInt(request.getParameter("genre_idx"));
	String date = request.getParameter("date");
	ArrayList<Genre_RankDTO> list =  new Genre_RankDAO().selectGenre_RankDTO(genre_idx, date);
	 
	SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 M월 d일 (E)");

	 String[] selectDate = list.get(0).getRegDate().split("");

	Date d = inputFormat.parse(String.join("", selectDate));
	String formattedDate = outputFormat.format(d);

	int rowNum = 5;
	ArrayList<Week_RankDTO> wrd = new Genre_RankDAO().weekRankDto(rowNum);
	ArrayList<Week_RDTO> wr = new Genre_RankDAO().weekRDto(rowNum);
%>
<!-- Area_Rank dao/ dto  -->
<!-- Genre_Rank dao/ dto -->
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>주간베스트</title> 
  <link rel="stylesheet" href="../../assets/css/common.css">
  <link rel="stylesheet" href="../../assets/css/reset.css">
  <link rel="stylesheet" type="text/css" href="../../assets/css/ranking.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
  <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
  <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
  
  <script>
	
</script>

<script>
$(document).ready(function() {

    // 버튼 클릭 시 AJAX 요청
    $('.common_tab_btn2').on('click', function() {
    	const genre_idx = $(this).data('genre');

        console.log(genre_idx); 
        $.ajax({
            url: '/Tcp2/AjaxRankingServlet', 
            contentType: 'application/json; charset=utf-8',
            type: 'GET',
            data: { genre_idx: genre_idx },
            success: function(response) {
            	for(let i = 1;i<4;i++){
            		const element = document.getElementById('b'+i);
            		if(genre_idx == i)
            			element.setAttribute('aria-selected', 'true');
            		else
            			element.setAttribute('aria-selected', 'false');
            		}
                alert("!");

                // 응답 데이터 파싱
                console.log(response);
                console.log(Array.isArray(response));

                    // 여기에서 필요한 작업을 수행
            	var str = 
            		'<tr id="content">' +
                '<td>' +
                  '<div class="ranking_product_rank">' +
                    '<span class="rank_number">' +
                      '1' +
                    '<span class="blind">위</span>' +
                    '</span>' +
                    '<span class="rank_status">' +
                      '<span class="rank_static">' +
                        '<span class="rank_step"></span>' +
                        '<span class="blind">변동없음</span>' +
                      '</span>' +
                    '</span>' +
                  '</div>' +
                '</td>' +
                '<td>' +
                  '<div class="ranking_product_info">' +
                    '<a class="ranking_product_link">' +
                      '<span class="ranking_product_imgbox">' +
                        '<img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF240567_240507_140637.jpg" class="ranking_product_img">' +
                      '</span>' +
                      '<span class="ranking_product_title">새벽의 입구에서</span>' +
                    '</a>' +
                  '</div>' +
                '</td>' +
                '<td>' +
                  '<div class="ranking_product_sideinfo">' +
                    '<span class="ranking_product_period">2024-06-06 - 2024-09-01</span>' +
                    '<span class="ranking_product_place">서경대학교 공연예술센터</span>' +
                  '</div>' +
                '</td>' +
                '<td>' +
                  '<div class="ranking_product_rate">' +
                    '<span class="rate_percent">' +
                    '17.03%' +
                    '</span>' +
                  '</div>' +
                '</td>' +
                '<td>' +
                  '<div class="ranking_product_reserve">' +
                    '<a class="common_btn btn_primary btn_medium" aria-disabled="false" href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=2796">예매하기</a>' +
                 '</div>' +
               ' </td>' +
              '</tr>';
            	
            },
            error: function() {
                alert("오류가 발생했습니다.");
            },
        
            
        });
    });

	function showContent(genre_idx) {
		if (genre_idx === '1') {
	    	$('#b1').attr('aria-selected', 'true');
				
		} else if (genre_idx === '3') {
				$('#play').addClass('active');
		} else if (genre_idx === '2') {
				$('#concert').addClass('active');
		}
	}

});

</script>

<script>

//$(function() {
//	  $("#b1").click(function() {
//	      $(this).attr('aria-selected', 'true');
//	      $("#b2").attr('aria-selected', 'false');
//	      $("#b3").attr('aria-selected', 'false');
//	    });
//	  $("#b2").click(function() {
//	      $(this).attr('aria-selected', 'true');
//	      $("#b1").attr('aria-selected', 'false');
//	      $("#b3").attr('aria-selected', 'false');
//	    });
//	  $("#b3").click(function() {
//	      $(this).attr('aria-selected', 'true');
//	      $("#b2").attr('aria-selected', 'false');
	//      $("#b1").attr('aria-selected', 'false');
	//    });
</script>

<style>
#datepicker {
   width: 100px;
   height: 35px;
   display: inline-block;
   vertical-align: middle;
   margin-left: 50px;
   font-size: x-large;
   letter-spacing: 4px;
   font-weight: bold;
   border: none;
}
.gj-icon {
 	margin-top: 8px !important;
}
.monthly-calendar {
    margin-top: 20px;
}
.ranking_period {
    display: flex;
    align-items: center;
}

.Dateformat {
    margin-left: 450px;
    margin-right: 10px;
    position: absolute; /* 화면에서 제거 */
}
.calendar input {
    display: inline-block;
    width: 150px;
    padding: 5px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.period_calendar_btn {
    display: flex;
    align-items: center;
    cursor: pointer;
    border: none;
    background: none;
    margin-left: 10px;
}

.common_icon1.icon_calendar.ty_md {
    margin-right: 5px;
    font-size: 20px;
}
.period_current {
    font-size: 1.2em;
    font-weight: bold;
}
.monthly-calendar {
      margin-top: 20px;
}
.ranking_period {
      display: flex;
      align-items: center;
}
.calendar-input {
      display: inline-block;
      width: 150px;
      padding: 5px;
      font-size: 20px; /* 글자 크기 증가 */
      font-weight: bold; /* 글씨 굵게 */
      border: none; /* 태두리 없앰 */
      margin-left: 10px; /* 버튼과의 간격 조정 */
}

.period_calendar_btn {
      display: flex;
      align-items: center;
      cursor: pointer;
      border: none;
      background: none;
      margin-left: 10px;
}
.period_current {
      font-size: 1.2em;
     font-weight: bold;
}
</style>
    

</head>

<!-- 맨 위 상단 메뉴바  -->
<body>
  <header>
    <div class="utill">
        <div class="inner">
            <ul>
                <li class="utill_link"><a href="/Tcp2/ticketlink/Login/Login.jsp">로그인</a></li>
                <li class="utill_link"><a href="/Tcp2/ticketlink/Mypage/Ticket_check.jsp">예매확인/취소</a></li>
                <li class="utill_link"><a href="/Tcp2/ticketlink/Login/AgreeToTerms.jsp">회원가입</a></li>
                <li class="utill_link"><a href="/Tcp2/ticketlink/Customer_Service_Center/Cs_Center_main.jsp">고객센터</a></li>
                <li class="utill_link"><a href="/Tcp2/ticketlink/Mypage/Mypage_member.jsp?">마이페이지</a></li>
            </ul>
        </div> 
    </div>
    <div class="nav_box">
        <div class="inner">
            <h1 class="logo"><a href="../html/main.html">로고</a></h1>
            <ul class="nav">
                <li><a href="#">공연/전시</a></li>
                <li><a href="#">커뮤니티</a></li>
            </ul>
        </div>
    </div>
    <div class="gnb_box">
        <div class="inner">
            <ul class="gnb_list">
                <li class="gnb_link"><a href="/Tcp2/ticketlink/main.jsp">홈</a></li>
                <li class="gnb_link"><a href="">공연</a></li>
                <li class="gnb_link"><a href="/Tcp2/ticketlink/Ranking_MainP/weekly_ranking2.jsp">랭킹</a></li>
                <li class="gnb_link"><a href="/Tcp2/band/band_home.jsp">커뮤니티</a></li>
            </ul>
        </div>
    </div>
</header>
<!-- 본문 랭킹 이미지색 & 주간 랭킹 -->

  <div id="Ranking_Bg" style="background-color: rgb(163, 175, 148);">
  </div>
  <div id="Ranking_Weekly" class="center">
    <div class="page_title">
      <h1 class="ranking_title">랭킹</h1>
    </div>
    <div class="Week_Rank">
      <h2 class="week_title">주간베스트</h2>
    </div>
<div class="Product_grid" class="fl">

     
      <div class="Product1">
        <div class="product_grid_list_type">
        <a href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=<%=wr.get(0).getPlay_idx()%>">
        <div class="image_box">
          <img src="<%=wrd.get(0).getPoster_Url()%>"  class="product_img">
          <span class="product_ranking">
            <span class="product_rank">1</span>
            <span class="product_rate">
              <span class="rate_number"><%=wr.get(0).getBooking_rate() %></span>
              <span class="rate_unit">%</span>
            </span>
          </span>
        </div>
        <div class="Product_info">
          <span class="product_title"><%=wrd.get(0).getName() %></span>
          <div class="product_sideinfo">
          <span class="product_period"><%=wrd.get(0).getStartDate() %> ~ <%=wrd.get(0).getEndDate()%></span>
          </div>
        </div>
       </a> 
      </div>
    </div>  

      <div class="Product2">
      <a href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=<%=wr.get(1).getPlay_idx()%>">
        <div class="image_box">
          <img src="<%=wrd.get(1).getPoster_Url() %>" class="product_img">
          <span class="product_ranking">
            <span class="product_rank">2</span>
            <span class="product_rate">
              <span class="rate_number"><%=wr.get(1).getBooking_rate() %></span>
              <span class="rate_unit">%</span>
            </span>
          </span>
        </div>
        <div class="Product_info">
          <span class="product_title"><%=wrd.get(1).getName() %></span>
          <div class="product_sideinfo">
          <span class="product_period"><%=wrd.get(1).getStartDate() %> ~ <%=wrd.get(1).getEndDate() %></span>
          </div>
        </div>
       </a> 
      </div>
      <div class="Product3">
      <a href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=<%=wr.get(2).getPlay_idx()%>">
        <div class="image_box">
          <img src="<%=wrd.get(2).getPoster_Url()%>" class="product_img">
          <span class="product_ranking">
            <span class="product_rank">3</span>
            <span class="product_rate">
              <span class="rate_number"><%=wr.get(2).getBooking_rate() %></span>
              <span class="rate_unit">%</span>
            </span>
          </span>
        </div>
        <div class="Product_info">
          <span class="product_title"><%=wrd.get(2).getName() %></span>
          <div class="product_sideinfo">
          <span class="product_period"><%=wrd.get(2).getStartDate() %> ~ <%=wrd.get(2).getEndDate() %></span>
          </div>
        </div>
       </a>
      </div>
      <div class="Product4">
       <a href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=<%=wr.get(3).getPlay_idx()%>"> 
        <div class="image_box">
          <img src="<%=wrd.get(3).getPoster_Url()%>" class="product_img">
          <span class="product_ranking">
            <span class="product_rank">4</span>
            <span class="product_rate">
              <span class="rate_number"><%=wr.get(3).getBooking_rate() %></span>
              <span class="rate_unit">%</span>
            </span>
          </span>aria-selected
        </div>
        <div class="Product_info">
          <span class="product_title"><%=wrd.get(3).getName() %></span>
          <div class="product_sideinfo">
          <span class="product_period"><%=wrd.get(3).getStartDate() %> ~ <%=wrd.get(3).getEndDate() %></span>
          </div>
       </a> 
      </div>
      </div>
      <div class="Product5">
      <a href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=<%=wr.get(4).getPlay_idx()%>">
        <div class="image_box">
          <img src="<%=wrd.get(4).getPoster_Url() %>" class="product_img">
          <span class="product_ranking">
            <span class="product_rank">5</span>
            <span class="product_rate">
              <span class="rate_number"><%=wr.get(4).getBooking_rate() %></span>
              <span class="rate_unit">%</span>
            </span>
          </span>
        </div>
        <div class="Product_info">
          <span class="product_title"><%=wrd.get(4).getName() %></span>
          <div class="product_sideinfo">
          <span class="product_period"><%=wrd.get(4).getStartDate() %> ~ <%=wrd.get(4).getEndDate() %></span>
          </div>
      </div>
     </a> 
    </div>
  </div>
</div>

<section class="section_ranking_detail center">
<!-- 장르/지역별 선택 -->
  <div id="section_heading">
    <div class="common_tab_type_title">
        <div class="common_tab_area1">
          <ul class="common_tab_list" role="tablist">
            <li class="common_tab_item" role="none">
              <button type="button" class="common_tab_btn" role="tab" aria-selected="false">장르별랭킹</button>
            </li>
       
          </ul>
        </div>
    </div>
  </div>
  
  <!-- 장르별 선택 -->
  <div id="common_tab_type_capsule">
    <div class="common_tab_area2">
      <ul class="common_tab_list2" role="tablist">
        <li class="common_tab_item2 fl" role="none">
          <button type="button" class="common_tab_btn2"  id="b1" role="tab" aria-selected="true" data-genre="1">뮤지컬</button>
        </li>
        <li class="common_tab_item2 fl" role="none">
          <button type="button" class="common_tab_btn2" id="b2" role="tab" aria-selected="false" data-genre="2">연극</button>
        </li>
        <li class="common_tab_item2 fl" role="none">
          <button type="button" class="common_tab_btn2" id="b3" role="tab" aria-selected="false" data-genre="3">콘서트</button>
        </li>
      </ul>
    </div>
  </div>



  <div id="ranking_filter">
  <!--날짜 변경-->
      
  <div class="monthly-calendar">
    <div class="react-datepicker-wrapper">
      <div class="react-datepicker_input-container">
        <div class="ranking_period">
          <div class="Dateformat">
          </div>
          <button type="button" class="period_calendar_btn" aria-expanded="false">
            <span class="period_current" id="periodCurrent"><b>2024년 08월 03일</b></span>
          </button>
        </div>
      </div>
    </div>
  </div>

  <!-- 일/주/월/연 -->
        <div class="common_tab_type_dot">
          <div class="common_tab_area3">
            <ul class="common_tab_list3" role="tablist" >
              <li class="common_tab_item3" role="none">
                <button type="button" class="common_tab_btn3" role="tab" aria-selected="true">
                  <!-- ::before -->
                  <b>일간</b> 
                </button> 
              </li>
              <li class="common_tab_item3" role="none">
                <button type="button" class="common_tab_btn3" role="tab" aria-selected="false">
                  <!-- ::before -->
                    주간
                </button> 
              </li>
              <li class="common_tab_item3" role="none">
                <button type="button" class="common_tab_btn3" role="tab" aria-selected="false">
                  <!-- ::before -->
                    월간
                </button> 
              </li>
            </ul>
          </div>
        </div>
    </div>
    

    
    <div id="ranking_product">
  <!-- 1~50위까지 장르별 랭킹테이블 -->
      <table class="ranking_product_table">
        <colgroup>
          <col style="width: 112px">
          <col style="width: 448px">
          <col style="width: 280px">
          <col style="width: 112px">
          <col style="width: 168px">
        </colgroup>
        <thead>
          <tr>
            <th scope="col">랭킹</th>
            <th scope="col">공연명</th>
            <th scope="col">기간/장소</th>
            <th scope="col">예매율</th>
            <th scope="col">예매하기</th>
          </tr>
        </thead>
        <tbody id="asd">
<%
	for (int i=0; i < list.size(); i++) {
%>          
          <tr id="content">
            <td>
              <div class="ranking_product_rank" >
                <span class="rank_number">
                  <%=i+1 %>
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_static">
                    <!-- before -->
                    <span class="rank_step"></span>
                    <span class="blind">변동없음</span>
                  </span>
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="<%=list.get(i).getPoster_URL()%>" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title"><%=list.get(i).getPlayName()%></span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period"><%=list.get(i).getPlayStartDate()%> - <%=list.get(i).getPlayEndDate()%></span>
                <span class="ranking_product_place"><%=list.get(i).getPlayHallName()%></span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                <%=list.get(i).getPlayBookRate()%>%
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false" href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=<%=list.get(i).getPlay_idx()%>">예매하기</a>
              </div>
            </td>
          </tr>
          
          
<%        } %>         
          
        </tbody>
      </table>
    </div>
    <hr class="color_grey"/>
</section>

<section class="common_section section_ranking_notice">
  <div class="ranking_notice">
    <h2 class="ranking_notice_title">
        <span class="common_icon icon_info ty_xs">
          <!-- after -->
        </span>
        랭킹 집계 안내
    </h2>
      <ul class="ranking_criterion_list">
        <li class="ranking_criterion_item1">
          <span class="ranking_criterion_title1">집계대상</span>
          <span class="ranking_criterion_desc1">티켓링크 웹, 모바일(웹/앱), Global, 고객센터, 제휴사(결제 완료, 예매 매수 기준)</span>"
        </li>
        <li class="ranking_criterion_item2">
          <span class="ranking_criterion_title2">집계기간</span>
          <span class="ranking_criterion_desc2">
            "당일 오전의 경우 판매 비중이 낮으므로 오전 10시 30분 이전까지는 전일 24시간의 집계 현황을 알려드립니다. "
            <br/>
            "일간/주간은 1시간 단위로 업데이트 되며, 월간/연간은 일 단위로 업데이트 됩니다."
          </span>
        </li>
      </ul>
  </div>
</section>

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
</body>
</html>