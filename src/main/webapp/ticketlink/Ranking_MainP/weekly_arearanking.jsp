<%@page import="dto.Area_RankDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Area_RankDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	int area_idx = Integer.parseInt(request.getParameter("area_idx"));
	String date = request.getParameter("date");
		
	 ArrayList<Area_RankDTO> list = new Area_RankDAO().selectAreaRankDTO(area_idx, date);
	 String[] startDate = list.get(0).getStartDate().split(" ");	
	 String[] endDate = list.get(0).getEndDate().split(" ");
	 
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
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
  <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>



<script>
	$(function() {
	 /* $.datepicker.setDefaults({
	      nextText: "다음",
	      prevText: "이전",
	      monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월"],                	                	            "8월", "9월", "10월", "11월", "12월" ],
	      dayNames: ["일", "월", "화", "수", "목", "금", "토"],
	      dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
	      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
	    });
		*/
	    $("#datepicker").datepicker(); 
		 $('#gijgo').datepicker();
	});
	
     
     $(function () {
         $("#datepicker").datepicker({
           dateFormat: "yy년 mm월 dd일 (D)",
           dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
           monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
           onSelect: function (dateText) {
             $("#periodCurrent b").text(dateText);
             $("#date").val(dateText); // 선택된 날짜를 표시

             var arr = dateText.split(" ");
             var year = arr[0].replace("년", "");
             var month = arr[1].replace("월", "");
             var day = arr[2].replace("일", "");

             $("#year").text(year);
             $("#month").text(month);
             $("#day").text(day);

             // 요일 가져오기
             var date = new Date($("#datepicker").datepicker("getDate"));
             var week = ["일", "월", "화", "수", "목", "금", "토"];
             $("#mydate").text(week[date.getDay()]);
           }
         });

         // 날짜 버튼을 클릭하면 datepicker를 표시합니다.
         $(".period_calendar_btn").click(function () {
           $("#datepicker").datepicker("show");
         });
       });
</script>

  <style>
    .monthly-calendar {
      margin-top: 20px;
    }

    .ranking_period {
      display: flex;
      align-items: center;
    }

    .Dateformat {
      margin-right: 10px;
    }

    .calendar input {
      font-size: 16px;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .period_calendar_btn {
      display: flex;
      align-items: center;
      cursor: pointer;
      border: none;
      background: none;
    }

    .common_icon1.icon_calendar.ty_md {
      margin-right: 5px;
      font-size: 20px;
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
                <li class="utill_link"><a href="#">로그인</a></li>
                <li class="utill_link"><a href="#">예매확인/취소</a></li>
                <li class="utill_link"><a href="#">회원가입</a></li>
                <li class="utill_link"><a href="#">고객센터</a></li>
                <li class="utill_link"><a href="#">마이페이지</a></li>
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
                <li class="gnb_link"><a href="#">홈</a></li>
                <li class="gnb_link"><a href="#">공연</a></li>
                <li class="gnb_link"><a href="#">전시</a></li>
                <li class="gnb_link"><a href="#">랭킹</a></li>
                <li class="gnb_link"><a href="#">커뮤니티</a></li>
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
        <div class="image_box">
          <img src="https://image.toast.com/aaaaab/ticketlink/TKL_6/chicago_main_0411.jpg" alt="뮤지컬 &lt;시카고&gt;" class="product_img">
          <span class="product_ranking">
            <span class="product_rank">1</span>
            <span class="product_rate">
              <span class="rate_number">11</span>
              <span class="rate_unit">%</span>
            </span>
          </span>
        </div>
        <div class="Product_info">
          <span class="product_title">뮤지컬 &lt;시카고&gt;</span>
          <div class="product_sideinfo">
          <span class="product_period">2024.06.07 ~ 2024.09.29</span>
          </div>
        </div>
      </div>
    </div>  
      <div class="Product2">
        <div class="image_box">
          <img src="	https://image.toast.com/aaaaab/ticketlink/TKL_8/MIO_PST_0422.jpg" alt="뮤지컬 &lt;미오 프라텔로&gt;" class="product_img">
          <span class="product_ranking">
            <span class="product_rank">2</span>
            <span class="product_rate">
              <span class="rate_number">9</span>
              <span class="rate_unit">%</span>
            </span>
          </span>
        </div>
        <div class="Product_info">
          <span class="product_title">뮤지컬 &lt;미오 프라텔로&gt;</span>
          <div class="product_sideinfo">
          <span class="product_period">2024.05.21 ~ 2024.08.11</span>
          </div>
      </div>
      </div>
      <div class="Product3">
        <div class="image_box">
          <img src="//image.toast.com/aaaaab/ticketlink/TKL_3/dg_main_0221(1).jpg" alt="제15회 대구꽃박람회" class="product_img">
          <span class="product_ranking">
            <span class="product_rank">3</span>
            <span class="product_rate">
              <span class="rate_number">6</span>
              <span class="rate_unit">%</span>
            </span>
          </span>
        </div>
        <div class="Product_info">
          <span class="product_title">제15회 대구꽃박람회</span>
          <div class="product_sideinfo">
          <span class="product_period">2024.06.05 ~ 2024.06.08</span>
          </div>
      </div>
      </div>
      <div class="Product4">
        <div class="image_box">
          <img src="https://image.toast.com/aaaaab/ticketlink/TKL_5/mac_main_0514.jpg" alt="연극 &lt;맥베스&gt;" class="product_img">
          <span class="product_ranking">
            <span class="product_rank">4</span>
            <span class="product_rate">
              <span class="rate_number">3</span>
              <span class="rate_unit">%</span>
            </span>
          </span>
        </div>
        <div class="Product_info">
          <span class="product_title">연극 &lt;맥베스&gt;</span>
          <div class="product_sideinfo">
          <span class="product_period">2024.07.13 ~ 2024.08.18</span>
          </div>
      </div>
      </div>
      <div class="Product5">
        <div class="image_box">
          <img src="https://image.toast.com/aaaaab/ticketlink/TKL_10/main0430.png" alt="연극 &lt;일리아드&gt;" class="product_img">
          <span class="product_ranking">
            <span class="product_rank">5</span>
            <span class="product_rate">
              <span class="rate_number">2</span>
              <span class="rate_unit">%</span>
            </span>
          </span>
        </div>
        <div class="Product_info">
          <span class="product_title">연극 &lt;일리아드&gt;</span>
          <div class="product_sideinfo">
          <span class="product_period">2024.06.18 ~ 2024.09.08</span>
          </div>
      </div>
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
              <button type="button" class="common_tab_btn" role="tab" aria-selected="false" style="border-right:1px solid rgb(207, 208, 215);">장르별랭킹</button>
            </li>
            <li class="common_tab_item" role="none">
              <button type="button" class="common_tab_btn" role="tab" aria-selected="false">지역별랭킹</button>
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
          <button type="button" class="common_tab_btn2" role="tab" aria-selected="true">뮤지컬</button>
        </li>
        <li class="common_tab_item2 fl" role="none">
          <button type="button" class="common_tab_btn2" role="tab" aria-selected="false">콘서트</button>
        </li>
        <li class="common_tab_item2 fl" role="none">
          <button type="button" class="common_tab_btn2" role="tab" aria-selected="false">연극</button>
        </li>
        <li class="common_tab_item2 fl" role="none">
          <button type="button" class="common_tab_btn2" role="tab" aria-selected="false">전시</button>
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
            <p class="calendar"><input type="text" id="datepicker" /></p>
          </div>
          <button type="button" class="period_calendar_btn" aria-expanded="false">
            <span class="common_icon1 icon_calendar ty_md">📅</span>
            <span class="period_current" id="periodCurrent"><b>날짜를 선택하세요</b></span>
          </button>
        </div>
      </div>
    </div>
  </div>

  <p>선택일 : <input type="text" id="date"></p>
  <p>textbox를 클릭하면 <strong>캘린더</strong> 표시</p>
  
  연도: <p id="year"></p>
  월: <p id="month"></p>
  일: <p id="day"></p>
  요일: <p id="mydate"></p>
  <!-- 일/주/월/연 -->
        <div class="common_tab_type_dot">
          <div class="common_tab_area3">
            <ul class="common_tab_list3" role="tablist">
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
              <li class="common_tab_item3" role="none">
                <button type="button" class="common_tab_btn3" role="tab" aria-selected="false">
                  <!-- ::before -->
                    연간
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
        <tbody>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  1
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_up">
                    <span class="common_icon2 icon_rank_up">
                    </span>
                    <span class="rank_step">5</span>
                    <span class="blind">계단 상승</span>
                  </span>
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="<%=list.get(0).getPosterUrl()%>" alt="뮤지컬  &lt;새벽의 입구에서&gt;" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title"><%=list.get(0).getPlayName()%></span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period"><%=startDate[0]%> - <%=endDate[0]%></span>
                <span class="ranking_product_place"><%=list.get(0).getPlayHallName()%></span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                <%=list.get(0).getBookingRate()%>%
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  2
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_static">
                    <!-- before -->
                    <span class="blind">변동 없음</span>
                  </span>
                </span>
              </div>
           </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="https://image.toast.com/aaaaab/ticketlink/TKL_6/chicago_main_0411.jpg" alt="뮤지컬  &lt;시카고&gt;" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title">뮤지컬 &lt;시카고&gt;</span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period">2024.06.07 - 20204.09.29</span>
                <span class="ranking_product_place">디큐브 링크아트센터</span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                  20.17
                  %
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  3
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_down">
                    <span class="common_icon2 icon_rank_down">
                      <!-- after -->
                    </span>
                    <span class="rank_step">2</span>
                    <span class="blind">계단 하락</span>
                  </span>
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link" href="http://127.0.0.1:5500/Detailed_Infor(Integrated)/Perfor.detail(C).html">
                  <span class="ranking_product_imgbox">
                    <img src="<%=list.get(0).getPosterUrl()%>" alt="뮤지컬  &lt;사의찬미&gt;" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title">뮤지컬 &lt;사의찬미&gt;</span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period">2024.07.02 - 20204.09.22</span>
                <span class="ranking_product_place">링크아트센터 페이코홀</span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                  11.02
                  %
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false" href="http://127.0.0.1:5500/Detailed_Infor(Integrated)/Perfor.detail(C).html">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  4
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_down">
                    <span class="common_icon2 icon_rank_down">
                      <!-- after -->
                    </span>
                    <span class="rank_step">1</span>
                    <span class="blind">계단 하락</span>
                  </span>
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="https://image.toast.com/aaaaab/ticketlink/TKL_5/pst_0327.jpg" alt="뮤지컬  &lt;협객외전&gt;" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title">뮤지컬 &lt;협객외전&gt;</span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period">2024.04.16 - 20204.07.07</span>
                <span class="ranking_product_place">링크아트센터드림 드림3관</span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                  7.69
                  %
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  5
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_down">
                    <span class="common_icon2 icon_rank_down">
                      <!-- after -->
                    </span>
                    <span class="rank_step">1</span>
                    <span class="blind">계단 하락</span>
                  </span>
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="	https://image.toast.com/aaaaab/ticketlink/TKL_8/MIO_PST_0422.jpg" alt="뮤지컬  &lt;미오 프라텔로&gt;" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title">뮤지컬 &lt;미오 프라텔로&gt;</span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period">2024.05.21 - 20204.08.11</span>
                <span class="ranking_product_place">링크아트센터 벅스홀</span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                  4.57
                  %
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  6
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_down">
                    <span class="common_icon2 icon_rank_down">
                      <!-- after -->
                    </span>
                    <span class="rank_step">1</span>
                    <span class="blind">계단 하락</span>
                  </span>
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="	https://image.toast.com/aaaaab/ticketlink/TKL_2/m0514.jpg" alt="패밀리 아이스쇼  &lt;피터팬 온 아이스&gt; 오리지널 내한공연" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title">패밀리 아이스쇼 &lt;피터팬 온 아이스&gt;오리지널 내한공연</span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period">2024.08.14 - 20204.08.18</span>
                <span class="ranking_product_place">목동아이스링크</span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                  3.33
                  %
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  7
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_static">
                    <!-- before -->
                    <span class="blind">변동 없음</span>
                  </span>
                </span>
              </div>
           </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="https://image.toast.com/aaaaab/ticketlink/TKL_9/p_pst_0502.jpg" alt="뮤지컬  &lt;파가니니&gt;-안동" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title">뮤지컬 &lt;파가니니&gt;-안동</span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period">2024.07.19 - 20204.07.20</span>
                <span class="ranking_product_place">안동문화예술의전당 웅부홀</span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                  2.91
                  %
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  8
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_up">
                    <span class="common_icon2 icon_rank_up">
                    </span>
                    <span class="rank_step">4</span>
                    <span class="blind">계단 상승</span>
                  </span>
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="https://image.toast.com/aaaaab/ticketlink/TKL_10/m0508(1).jpg" alt="코믹 뮤지컬  &lt;5!해피맨&gt;" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title">코믹 뮤지컬 &lt;5!해피맨&gt;</span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period">2024.05.17 - 20204.07.27</span>
                <span class="ranking_product_place">대학로 굿씨어터</span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                  1.87
                  %
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  9
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_down">
                    <span class="common_icon2 icon_rank_down">
                      <!-- after -->
                    </span>
                    <span class="rank_step">1</span>
                    <span class="blind">계단 하락</span>
                  </span>
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="https://image.toast.com/aaaaab/ticketlink/TKL_2/Ticketlink_nonfile_web(460).png" alt=" &lt;경로당 폰팅사건&gt;-칠곡군" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title">&lt;경로당 폰팅사건&gt;-칠곡군</span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period">2024.06.20 - 20204.06.20</span>
                <span class="ranking_product_place">칠곡교육문화회관</span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                  1.66
                  %
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="ranking_product_rank">
                <span class="rank_number">
                  10
                <span class="blind">위</span>
                </span>
                <span class="rank_status">
                  <span class="rank_up">
                    <span class="common_icon2 icon_rank_up">
                    </span>
                    <span class="rank_step">5</span>
                    <span class="blind">계단 상승</span>
                  </span>
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_info">
                <a class="ranking_product_link">
                  <span class="ranking_product_imgbox">
                    <img src="	https://image.toast.com/aaaaab/ticketlink/TKL_10/ANSWER_dg_0411.jpg" alt="2024 최현우 Answer-대구" class="ranking_product_img">
                    <!-- after -->
                  </span>
                  <span class="ranking_product_title">2024 최현우 Answer-대구</span>
                </a>
              </div>
            </td>
            <td>
              <div class="ranking_product_sideinfo">
                <span class="ranking_product_period">2024.07.20 - 20204.07.21</span>
                <span class="ranking_product_place">수성아트피아 대극장</span>
              </div>
            </td>
            <td>
              <div class="ranking_product_rate">
                <span class="rate_percent">
                  1.66
                  %
                </span>
              </div>
            </td>
            <td>
              <div class="ranking_product_reserve">
                <a class="common_btn btn_primary btn_medium" aria-disabled="false">예매하기</a>
              </div>
            </td>
          </tr>
          <tr>
            <td>
        </tr>
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