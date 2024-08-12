<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
Integer userIdx = (Integer)request.getSession().getAttribute("userIdx");
int play_idx = (int)request.getAttribute("play_idx");
int playhall_idx = (int)request.getAttribute("playhall_idx");
@SuppressWarnings("unchecked")
ArrayList<Play_DetailedInfoDTO> list = (ArrayList<Play_DetailedInfoDTO>)request.getAttribute("list");
@SuppressWarnings("unchecked")
ArrayList<DetailedInfo_playDTO> dipd = (ArrayList<DetailedInfo_playDTO>)request.getAttribute("dipd");
@SuppressWarnings("unchecked")
ArrayList<SeatPriceDTO> spdto = (ArrayList<SeatPriceDTO>)request.getAttribute("spdto");
@SuppressWarnings("unchecked")
ArrayList<PlayHallLocationDTO> phldto = (ArrayList<PlayHallLocationDTO>)request.getAttribute("phldto");
int scriptCount = (int)request.getAttribute("scriptCount");
int expCount = (int)request.getAttribute("expCount");
@SuppressWarnings("unchecked")
ArrayList<Exp_RatingDTO> erd = (ArrayList<Exp_RatingDTO>)request.getAttribute("erd");
double staravg = (double)request.getAttribute("staravg");
@SuppressWarnings("unchecked")
ArrayList<PlayhallMapDTO> phmd = (ArrayList<PlayhallMapDTO>)request.getAttribute("phmd");
@SuppressWarnings("unchecked")
ArrayList<GetDateDTO> gdd = (ArrayList<GetDateDTO>)request.getAttribute("gdd");
@SuppressWarnings("unchecked")
ArrayList<RecommandPDTO> rpd = (ArrayList<RecommandPDTO>)request.getAttribute("rpd");
	
	
%>    
    
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공연상세정보 내용</title>
  <link rel="stylesheet" href="/Tcp2/assets/css/detail(C).css">
  <link rel="stylesheet" href="/Tcp2/assets/css/common.css">
  <link rel="stylesheet" href="/Tcp2/assets/css/reset.css">
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>	
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="/Tcp2/assets/js/Calendar.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=kvd9jc2y88"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
 
    
  <script>
	let g_play_idx = <%=request.getParameter("play_idx")%>;

  function draw_script_page(page_num) {
		$.ajax({
			type: 'get',
			data: { page_num : page_num, play_idx : <%=request.getParameter("play_idx")%> },
			dataType: "json",
			url: "${pageContext.request.contextPath}/PageAjaxServlet",
			success: function(res) {
				console.log(res);
				let container = $('#container'); // 데이터를 추가할 컨테이너 선택
				container.empty(); // 기존 내용 제거
				res.forEach(script => {
					console.log(script);
					
					let stars = '';
					for (let i = 1; i <= 5; i++) {
						stars += (parseInt(script.starRating) >= i) ? '★' : '☆';
					}
					let str = `<div class="empty_box" id="` + script.script_idx + `">
							<div class="empty_star" style="color:red">` + stars + `</div>
							<h1 class="empty_title">`+script.title+`</h1>
							<p class="empty_comment">`+script.content+`</p>
							<div class="comment_info">
								<span class="comment_id">`+script.email+`</span>
								<span class="comment_date">`+ script.regdate +`</span>
								<span class="comment_purchaser">예매자</span>
								<input type="hidden" name="script_idx" value="`+script.script_idx+`">
								<button type="submit" class="script_delete">D</button>
							</div>
						</div>`;
					console.log("str", str);
					$("#container").append(str);
				});
			},
			error: function(r, s, e) {
				alert("[에러] code:"+ r.status+ ", message:"+ r.responseText+ "error:"+ e);	
			}

		});
	}
  
  
  </script>
 
  
  <script>
 	
  $(function() {
  	//  삭제
  	$(document).on("click", ".script_delete", function() {
  		let script_idx = $(this).closest(".empty_box").attr("id");
  		
		$.ajax({
			url: '${pageContext.request.contextPath}/AjaxScriptDeleteServlet',
			data: {script_idx : script_idx},
			type: 'get',
			success: function(response){
				alert("삭제되었습니다.");
				$("#" + script_idx).hide();
			},
			error: function(){
				console.log('ajax 통신 실패');		
			}
		});
		
		});
  	}); 
  
  	
  
  </script>
	
  <script>
	// 기대평 삭제 
	$(function() {
		$(".rating_delete").click(function() {
			let Exp_rating_idx = $(this).closest(".product_comment_list").attr("id");
			
			$.ajax({
				url: '${pageContext.request.contextPath}/AjaxExp_ratingDeleteServlet',
				data: {Exp_rating_idx : Exp_rating_idx },
				type: 'get',
				success: function(response) {
					alert("삭제되었습니다.");
				    $("#" + Exp_rating_idx).hide();
				},
				error: function() {
					console.log('ajax 통신 실패');
				}
				
			});
			
		});
		if(<%=request.getParameter("page")%> > 1) {
			draw_script_page(<%=request.getParameter("page")%>);
		} else {
			draw_script_page(1);
		}
	});

  </script>


</head>

<!-- section 나눠줘야 함  -->

<body>
<!-- 맨 위 상단 메뉴바  -->
<body>
  <header>
    <div class="utill">
        <div class="inner">
          <ul>
            <%if(userIdx == null){ %>
              <li class="utill_link"><a href="/Tcp2/Controller?command=login">로그인</a></li>
              <%} else { %>
              <li class="utill_link"><a href="#" onclick="if(confirm('로그아웃 하시겠습니까?')) { window.location.href='/Tcp2/LogoutAction'; } return false;">로그아웃</a></li>
              <%} %>
              <li class="utill_link"><a href="/Tcp2/Controller?command=ticket_check">예매확인/취소</a></li>
          <%if(userIdx == null){ %>
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
  

  <section id="s1" class="border">
    <div class="border">
      <img src=<%=list.get(0).getPosterUrl()%> class="product_detail_img">
    </div>
    <div class="border">
      <div class="border"><!--제목 + 공유하기-->
        <h1 class="product_title"><b><%=dipd.get(0).getPlayName()%></b></h1>
        <div class="border">
          <span class="button gray medium"><a href="#"><img src="/Tcp2/assets/img/ticklink/icon_share.png" onclick="clip(); return false;"></a></span>
          <a href="#" target="_blank" onclick="javascript:window.open( 'https://twitter.com/intent/tweet?text=' + encodeURIComponent( document.title ) + '%20(' + encodeURIComponent( document.URL ) + ')', 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, width=600, height=600' ); return false;" title="트위터"><img src="https://namesaju.netlify.app/Twitter.png" alt="twitter"></a>
        </div>
      </div>
      <div class="border">
        <ul id="ul1">
          <li class="product_item border">
            <span class="product_info_title">장소</span>
            <div class="product_info_desc"><%=dipd.get(0).getPlayhallName()%></div>
          </li>
          <li class="product_item border">
            <span class="product_info_title">관람시간</span>
            <div class="product_info_desc"><%=dipd.get(0).getTime()%></div>
          </li>
          <li class="product_item border">
            <span class="product_info_title">기간</span>
            <div class="product_info_desc"><%=dipd.get(0).getStartDate() + "-" + dipd.get(0).getEndDate()%></div>
          </li>
          <li class="product_item border">
            <span class="product_info_title">관람등급</span>
            <div class="product_info_desc"><%=dipd.get(0).getViewage()%></div>
          </li>
        </ul>
        <ul id="ul2">
          <li class="product_info_item">
            <div class="spanfl"><span class="product_info_title">가격</span></div>
            <div class="product_info_desc"> <!-- 가격정보-->
              <ul class="product_info_sublist">
<%
				for (int i=0; i<spdto.size(); i++) {
%>
                <li class="product_info_subitem">
                  <%=spdto.get(i).getRank()%>석 <em class="text_emphasis"><%=spdto.get(i).getPrice()%></em>
                </li>
<% 
				}
%>
              </ul>
              <img src="/Tcp2/assets/img/ticklink/price_more.png" alt="가격정보더보기버튼" style="margin-top: 18px; width: unset;">
              </div>
            </li>
            <li class="product_info_item">
              <div class="spanfl"><span class="product_info_title">할인</span></div>
              <div class="product_info_desc">
                <ul class="product_info_sublist">
                  <li class="product_info_subitem no_wrap">
                    청소년 할인(본인만/ 증빙지참) <em class="text_emphasis">20</em>% 할인
                  </li>
                  <li class="product_info_subitem no_wrap">
                    장애인/국가유공자 할인 <em class="text_emphasis">30</em>% 할인
                  </li>
                </ul>
                <img src="/Tcp2/assets/img/ticklink/saleinfo.png" alt="할인정보" style="margin-top: 18px; width: unset;">
                </div>
            </li>
        </ul>
      </div>
    </div>
  </section>
  <section id="s2" class="border">
    <div> <!-- 동그란 네모박스-->
      <div>
        <div>
          <p class="step">STEP 1</p>
          <p class="stepinfo">날짜 선택</p>
        </div>
        <!-- 달력-->
        <div>
          <table class="scriptCalendar">
            <thead>
                <tr>
                    <td class="calendarBtn" id="btnPrevCalendar">&#60;</td>
                    <td colspan="5">
                        <span id="calYear">YYYY</span>년
                        <span id="calMonth">MM</span>월
                    </td>
                    <td class="calendarBtn" id="nextNextCalendar">&#62;</td>
                </tr>
                <tr>
                    <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
        </div>
      </div>
      <div>
        <div>
          <p class="step">STEP 2</p>
          <p class="stepinfo">회차 선택</p>
   
        </div>
        <ul style="width: 257px;">
	        <li class="time_list">
<%
    	String originalTime = gdd.get(0).getPlay_date();
		for(int i=0; i<gdd.size(); i++) {
				if (originalTime.equals("0")) { 
%>										
					<span style="display: block; font-weight: 700; font-size: 20px; margin-top: 100px;">&lt;이미 종료된 공연입니다.&gt;</span>
<%
			     	break;
				}
				if (!(originalTime.equals(gdd.get(i).getPlay_date()))) break;
%>
	           <button type="button" onclick="<%=gdd.get(i).getPlayinfo_idx()%>" class="episode_selection time_btn" style="margin-bottom: 15px;"> 
			      <span><b style="font-size: larger"><%=gdd.get(i).getStart_time()%></b></span>
			       <span>
			        <span class="c_member"></span>
			       </span>
			    </button>
<%
			}
%>
	        </li>
        </ul>
      </div>
      <div><!-- 3 -->
        <div><span>예매가능좌석</span></div>
        <ul class="product_seat_list">
        </ul>
      </div>
    </div>
    <div>
      <div>
        <img src="data:image/png;base64,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" alt="페이코결제">
      </div>
      <div class="detail_reserve">
        <a class="common_btn1 btn_primary1 btn_medium1" href="#" onclick="reservation();" aria-disabled="false">예매하기</a>
      </div>
    </div>
  </section>

<!-- 공연정보 탭바  -->
  <section id="common_section section_tab"> 
    <div id="detail_tab">
      <div class="common_tab type_linebox">
        <div class="common_tab_area">
          <ul class="common_tab_list" role="tablist">
            <li class="common_tab_item is-active" role="none">
              <!-- before -->
              <button type="button" class="common_tab_btn" role="tab" aria-selected="true" id="detail_information_btn">
                <span>상세정보</span>
              </button>
            </li>
            <li class="common_tab_item is-active" role="none">
              <!-- before -->
              <button type="button" class="common_tab_btn" role="tab" aria-selected="false" id="review_btn">
                <span>관람후기</span>
              </button>
            </li>
            <li class="common_tab_item is-active" role="none">
              <!-- before -->
              <button type="button" class="common_tab_btn" role="tab" aria-selected="false" id="preview_btn">
                <span>기대평</span>
              </button>
            </li>
            <li class="common_tab_item is-active" role="none">
              <!-- before -->
              <button type="button" class="common_tab_btn" role="tab" aria-selected="false" id="place_btn">
                <span>장소정보</span>
              </button>
            </li>
            <li class="common_tab_item is-active" role="none">
              <!-- before -->
              <button type="button" class="common_tab_btn" role="tab" aria-selected="false" id="productNotice_btn">
                <span>예매/취소안내</span>
              </button>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>

<!-- 공연 상세정보 본문 -->
<section class="common_section section_content" id="detail_information" style="display:block;">
  <div class="detail_tabcontent">
    <section class="section_detail">
      <h3 class="contect_subtit" style="font-size: 24px; margin-bottom: 15px;"><b>공연시간 정보</b></h3>
      <div class="editor">
       <p style="font-size: 20px;">	&lt;기간 : &nbsp; <b><%=dipd.get(0).getStartDate() + "-" + dipd.get(0).getEndDate()%>&gt; </b></p> <br/>
        <p>
          <b>
<%
	String originDate = gdd.get(0).getPlay_date();
	int count = 0;
	  for (int i=0; i<gdd.size(); i++) {
		  if (count > 6) break;
		  if (originDate.equals("0")) {
%>
		      	<span style="display: block; font-weight: 700; font-size: 12px; margin-top: 5px;">&lt;이미 종료된 공연입니다.&gt;</span>
<% 			  
			  break; 
		  }
%>       
       	  <%=gdd.get(i).getPlay_date()+ " "+ gdd.get(i).getStart_time() %> <%
       	  	if (originDate.equals(gdd.get(i).getPlay_date())) { %>   <%="&nbsp;&nbsp;&nbsp;&nbsp;"%>  
       	  <% }else { %>
       	  		<%="<br/>" %>
			
       	  <% 
       	  count++;
       	  } %>
<%
          originDate = gdd.get(i).getPlay_date(); 
	      }   %>

          </b>
        </p>
        <p>

    	<p>
        
    	</p>

        <p>&nbsp;</p>
        <h3 class="cast_member"><b>출연진 및 제작진</b></h3>
        <p>출연진 : <%=dipd.get(0).getCast()%></p>
        <p>제작진 : <%=dipd.get(0).getCrew()%></p>
      </div>
      <h3 class="content_subtit">공지사항</h3>
      <div class="banner">
          <img src="data:image/png;base64,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" alt="이 상품은 도서·공연비 소득공세 혜택이 적용됩니다." class="banner_img">
        </a>
      </div>
      <h3 class="content_subtit">작품상세정보</h3>
      <div class="templete">
        <p>
          <img src=<%=dipd.get(0).getImg_detail1()%> title="gloomy_info_0603.jpg">
          <br style="clear : both;">
        </p>
      </div>
      <h3 class="content_subtit">기획사 및 제작사 정보</h3>
      <div class="editor4">
        <p>주관 : 주식회사 네오&nbsp;</p>
        <p>제작 : 주식회사 네오&nbsp;</p>
        <p>고객문의 : 02-6954-0772&nbsp;</p>
        </div>
        <h3 class="content_subtit">상품관련정보</h3>
        <div class="info_table">
          <table>
            <caption>
              <span>상품관련정보</span>
            </caption>
            <colgroup>
              <col style="width: 168px;">
              <col style="width: 392px;">
              <col style="width: 168px;">
              <col>
            </colgroup>
            <tbody>
              <tr>
                <th scope="row">주최/기획</th>
                <td>주식회사 네오</td>
                <th scope="row">고객문의</th>
                <td>02-6954-0772</td>
              </tr>
              <tr>
                <th scope="row">공연시간</th>
                <td><%=dipd.get(0).getTime()%></td>
                <th scope="row">관람등급</th>
                <td><%=dipd.get(0).getViewage()%></td>
              </tr>
              <tr>  
                <th scope="row">주연</th>
                <td><%=dipd.get(0).getCast()%></td>
                <th scope="row">공연장소</th>
                <td><%=dipd.get(0).getPlayhallName()%></td>
              </tr>
              <tr>
                <th scope="row">예매수수료</th>
                <td>
                  2000
                  원
                </td>
                <th scope="row">배송료</th>
                <td class="align_center">현장수령</td>
              </tr>
              <tr>
                <th scope="row">유효기간/이용조건</th>
                <td colspan="3">2024.07.02 ~ 2024.09.22 예매한 공연 날짜, 회차에 한해 이용 가능</td>
              </tr>
              <tr>  
                <th scope="row">예매취소조건</th>
                <td colspan="3">
                  <span class="text_grey">
                    취고일자에 따라 아래와 같이 취소수수료가 부과됩니다. 예매일 기준보다 관람일 기준이 우선 적용됩니다.
                    <br/>
                    단, 예매 당일 밤 12시이전 취소 시에는 취소수수료가 없으며 예매수수료도 환불됩니다.(취소기한 내에 한함)
                    <br/>
                    <br/>
                    예매후 7일 이내 : 취소수수료 없음
                    <br/>
                    예매후 8일 ~ 관람일 10일 전 : 뮤지컬/콘서트/클래식등 공연 장당 4,000원, 연극/전시 등 입장권 정당 2,000원
                    <br/>
                    (단, 최대 티켓금액의 10%이내)
                    <br/>
                    관람일 9일 전 ~ 7일 전 : 티켓금액의 10%
                    <br/>
                    관람일 6일 전 ~ 3일 전 : 티켓금액의 20%
                    <br/>
                    관람일 2일 전 ~ 1일 전 : 티켓금앳의 30%
                    <br/>
                    공연 취소 시 : 없음
                    <br/>
                  </span>
                </td>
              </tr>
              <tr>
                <th scope="row">취소환불방법</th>
                <td colspan="3">
                  <span class="text_grey">
                    '마이페이지 > 예매/취소내역'에서 취소마감시간 이내에 취소할 수 있습니다. <br/>
                    단, 티켓이 배송된 이후에는 인터넷 취소가 불가하며 취소마감 시간 이전에 티켓이 아래 주소로 반송되어야 합니다.
                    <br/>
                    - 주소 : 06043, 서울 특별시 강남구 586, 제이빌딩
                    <br/>
                    - 받는 사람 : NHN LINK 환불담당자
                    <br/>
                    - 연락처 : 1588-7890
                    <br/> 
                    취소수수료는 도착일자 기준으로 부과되며 배송료는 환불되지 않습니다.
                    <br/>
                  </span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
    </section>
  </div>
</section>


<!-- 공연정보   -->
<section class="section_product_tabcont section_review" id="review" style="display:none;">
  <div class="content_heading">
    <h2 class="content_title">
      <b>관람후기</b>
      <input type="hidden" name="play_idx" value="${play_idx}">
      <span class="text_primary text_number">${scriptCount}</span>
    </h2>
    <div class="star_rate">
      <div class="star_rt" data-rate="<%=staravg %>">
        <!-- before -->
         <div class="star-wrap"><div class="star_r"><i class="fas fa-star" aria-hidden="true" id="rate_fa"></i></div></div>     
         <div class="star-wrap"><div class="star_r"><i class="fas fa-star" aria-hidden="true" id="rate_fa"></i></div></div>     
         <div class="star-wrap"><div class="star_r"><i class="fas fa-star" aria-hidden="true" id="rate_fa"></i></div></div>     
         <div class="star-wrap"><div class="star_r"><i class="fas fa-star" aria-hidden="true" id="rate_fa"></i></div></div>     
         <div class="star-wrap"><div class="star_r"><i class="fas fa-star" aria-hidden="true" id="rate_fa"></i></div></div>     
        <span class="star_per" style="width: 0%;">
        </span>
      </div>
      <span class="star_score">
      <span class="star_current"><%=staravg %></span>
      / 5
    </span>
    </div>
  </div>
  <div class="comment_write">
    <div class="comment_notice">
      <p class="comment_notice_desc">게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.</p>
      <a href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/popup.html" target="_blank" class="btn_hyperlink">
        <!-- before -->
         게시판 운영규정
      </a>
    </div>
   <form action="/Tcp2/ScriptwriteServlet">
     <input type="hidden" name="play_idx" value="<%=play_idx%>">
    <div class="comment_form">
      <div class="comment_content">
        <div class="comment_star_rate">
		 <!-- <input type="number" name="star_rating" class="star_rating" value="0"> -->
	          <span class="blind">별점 5점 중</span>
	          <div class="star_select">
	            <input type="radio" name="star2" id="star2_1" class="star_rating" value="1">
	            <label for="star2_1" class="star_label">
	            <i class="fa fa-star" aria-hidden="true" id="star1"></i>
	              <span class="blind">
	                1
	                점
	              </span>
	            </label>
	            <input type="radio" name="star2" id="star2_2" class="star_rating" value="2">
	            <label for="star2_2" class="star_label">
	            <i class="fa fa-star" aria-hidden="true" id="star2"></i>
	              <span class="blind">
	                2
	                점
	              </span>
	            </label>
	            <input type="radio" name="star2" id="star2_3" class="star_rating" value="3">
	            <label for="star2_3" class="star_label">
	            <i class="fa fa-star" aria-hidden="true" id="star3"></i>
	              <span class="blind">
	                3
	                점
	              </span>
	            </label>
	            <input type="radio" name="star2" id="star2_4" class="star_rating" value="4">
	            <label for="star2_4" class="star_label">
	           	<i class="fa fa-star" aria-hidden="true" id="star4"></i>
	             <span class="blind">
	                4
	                점
	              </span>
	            </label>
		            <input type="radio" name="star2" id="star2_5" class="star_rating" value="5">
		            <label for="star2_5" class="star_label">
		            <i class="fa fa-star" aria-hidden="true" id="star5"></i>
		              <span class="blind">
		                5
		                점
		              </span>
		            </label>
	          </div>
	          <p class="star_desc">별점을 선택해주세요</p>
	        </div>
	        <div class="input_box">
	        <label for="title">제목:</label><br>
	        <input type="text" id="title" name="title"  required><br><br>
	        
	  		<label for="content">내용:</label><br>
	        <textarea id="content" name="content" rows="4" cols="50" class="comment_textarea" placeholder="관람후기를 남겨보세요!" maxlength="1000" onkeydown="calc()" onkeyup="calc()" onkeypress="calc()" required></textarea><br><br>
	        </div>
	      </div>
	      <div class="comment_util">
	        <div class="comment_util_right">
	          <div class="comment_length">
	            <input type="number" class="curr_length" id="result1" value="0" readonly>
	            <span class="limit_length">/1000</span>
	          </div>
	          <div class="comment_btn_box">
	            <button type="submit"  onclick="ScriptwriteInsert();" value="등록" class="common_btn10 btn_secondary btn_small">등록</button>
	          </div>
	        </div>
	      </div>
	  </div>
	 </form>  
   </div>

<%
	int pageNum = 1;

	try {   // 지우지 마세요. 취업한 다음에 지우시...
		pageNum = Integer.parseInt(request.getParameter("page"));
	} catch(NumberFormatException e) { }   // 지우지 마세요.
	
	int startNum, endNum;
	int lastPageNum;
	
	ScriptwriteDAO swpage = new ScriptwriteDAO();
	ArrayList<ScriptwriteDTO> pagesw = swpage.getscriptwriteByPageNum(pageNum, play_idx);
	
	lastPageNum = swpage.getLastPageNum();
	startNum = (pageNum/5*5+1) - (pageNum%5==0 ? 5:0);
	endNum = startNum + 4;
	
	if(endNum > lastPageNum) 
		endNum = lastPageNum;

%>


<% 
	if (pagesw.size() == 0) {
%>
	  <p class="comment_empty">관람후기를 등록하세요.</p>
<% 		
	}	
%>
<div id="container">
<% for(int j=0; j<pagesw.size(); j++){%> 		

  <div class="empty_box" id="<%= pagesw.get(j).getScript_idx() %>">
  	<div class="empty_star" style="color:red">
  		<!-- ::before -->
<%
	for (int i=1; i<6; i++) {
		if (Integer.parseInt(pagesw.get(j).getStarRating()) >= i){
			%>★<% 
		} else {
			%>☆<%
		}
	}
%>

   	<span class="star14_per" style="width: 100%"></span>
  	</div>
  <h1 class="empty_title"><%=pagesw.get(j).getTitle()%></h1>
  <p class="empty_comment"><%=pagesw.get(j).getContent()%>
  </p>
    <div class="comment_info">
  	   <span class="comment_id"><%=pagesw.get(j).getEmail()%></span>
  	   <span class="comment_date">
  	   <%=pagesw.get(j).getRegDate() %>
  	   <!-- ::before -->
  	   </span>
  	   <span class="comment_purchaser">예매자</span>
	    <input type="hidden" name="script_idx" value="${script.script_idx}">
	    <button type="submit" class="script_delete">D</button>
    </div>
  </div>
 </div> 
 <% }%>
 

 
  <div class="paging">
    <a class="first" href="Prefor.detail(C).jsp?page=1&play_idx=<%=play_idx%>">
      맨앞
      <!-- after -->
    </a>
<%
	if (startNum > 1) {
%>
    <a class="prev" href="Prefor.detail(C).jsp?page=<%=startNum-5 %>&play_idx=<%=play_idx%>">&lt;   
      이전
      <!-- after -->
    </a>
<%  }%> 
<%
	for (int i=startNum; i<=endNum; i++) {
%>
<%
		if (i != pageNum) {
%>
		<a href="Prefor.detail(C).jsp?page=<%=i %>&play_idx=<%=play_idx%>"><%=i %></a>

<%  	}else {%>
    	<strong><%=i %></strong>
<% 		}%>
<%  }%>    
<%
	if (lastPageNum > endNum) {
%>
    <a class="next" href="Prefor.detail(C).jsp?page=<%=startNum+5 %>&play_idx=<%=play_idx%>">&gt;
      다음
      <!-- after -->
    </a>
<%	}%>    
    
    <a class="end" href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?page=<%=lastPageNum %>&play_idx=<%=play_idx%>">
      맨뒤
      <!-- after -->
    </a>
  </div>
</section>



<!-- 공연정보 기대평 -->
<section class="section_tabcont section_preview" id="preview" style="display:none;">
  <div class="product_content_heading">
    <h2 class="product_content_title">
      <b>기대평</b>
     <input type="hidden" name="play_idx" value="${play_idx}">
      <span class="text_primary text_number">${expCount}</span>
    </h2>
  </div>
  <div class="comment_write">
    <div class="comment_notice">
      <p class="comment_notice_desc">게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.</p>
      <a href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/popup.html" target="_blank" class="btn_hyperlink">
        <!-- before -->
        게시판 운영규정
      </a>
    </div>
  <form action="/Tcp2/Ins_Exp_ratingServlet">
     <input type="hidden" name="play_idx" value="<%=play_idx %>">
    <div class="product_comment_form">
      <div class="product_comment_content">
        <div class="comment_input_box">
          <textarea id="rating_content" name="rating_content" class="comment_textarea1" placeholder="기대평을 남겨보세요!" maxlength="1000"></textarea>
        </div>
      </div>
      <div class="comment_util1">
        <div class="comment_util_right">
          <div class="comment_length">
            <span class="current_length">0</span>
            <span class="limit_length">/1000</span>
          </div>
          <div class="comment_btn_box">
            <button type="submit" onclick="ratingwriteInsert()" class="common_btn10 btn_secondary btn_small">등록</button>
          </div>
        </div>
      </div>
    </div>
   </form>  
  </div>

<% 
	if (erd.size() == 0 ) {
%> 
  	<p class="comment_empty">기대평을 등록하세요.</p>  
<%
	}
%>
  
<% 
	for(int k=0; k<erd.size(); k++){
%> 
  <ul class="product_comment_list" id="<%=erd.get(k).getExp_rating_idx() %>"> 
    <li class="product_comment_item">
      <p class="product_comment_desc"><%=erd.get(k).getContent()%></p>
      <div class="product_comment_info">
        <span class="comment_id"><%=erd.get(k).getEmail()%></span>
        <span class="comment_date">
          <!-- before -->
           <%=erd.get(k).getRegDate() %>
        </span>
        <input type="hidden" name="Exp_rating_idx" value="<%=erd.get(k).getExp_rating_idx() %>">
        <button type="submit" class="rating_delete">D</button>
      </div>
    </li>
  </ul>
<% } %>

  <div class="paging">
    <a class="first">
      맨앞
      <!-- after -->
    </a>
    <a class="prev">
      이전
      <!-- after -->
    </a>
    <strong>1</strong>
    <a class="next">
      다음
      <!-- after -->
    </a>
    <a class="end">
      맨뒤
      <!-- after -->
    </a>
  </div>
</section>


<!-- 공연정보 장소 -->
<section class="product_tabcont section_place" id="place" style="display:none;">
  <div class="cont_heading">
    <h2 class="cont_title">공연장 정보 </h2>
  </div>
  <p class="prod_content_desc">
    장소:
    <%=phldto.get(0).getPlayHallName()%>
    <br/>
    주소:
    <%=phldto.get(0).getAddress()%>
    <br>
    대표번호:
    <%=phldto.get(0).getPhone_No()%>
  </p>
  <div class="place_map">
    <div class="map_area" id="mapContainer">
	  <div id="map" style="width:100%;height:800px;"></div>
    </div>
  <button type="button" onclick="window.open('https://www.google.com/maps/dir/?api=1&origin=위도1,경도1&destination=<%=phmd.get(0).getLatitude()%>, <%=phmd.get(0).getLongitude()%>')" class="common_btn50 btn_ghost btn_big">빠른 길찾기</button>
  </div>
</section>


<!-- 공연정보 예매/취소 안내 -->
<section class="common_tabcont section_notice" id="productNotice" style="display:none;" style="margin-top: 0;">
  <h2 class="blind">예매/취소안내</h2>
  <div class="product_detail_toggle">
    <button class="detail_toggle_btn" aria-expanded="true">
      <span class="detail_toggle_title">예매/취소안내</span>
      <span class="common_icon icon_arrow_down ty_sm">
        <!-- after -->
      </span>
    </button>
    <div class="detail_toggle_content">
      <h3 class="detail_toggle_title">티켓 수령안내</h3>
        <div>
          <p>
            <b>(1) 일반배송</b>
          </p>
          예매 완료(결제 완료)확인 후, 인편배송으로 영업일 기준 10일 이내 티켓을 수령하실 수 있습니다.
          <div>티켓을 배송하기 위한 배송료는 고객이 부담합니다.</div>
          "행사 또는 관람일에 따라 일반배송 선택이 제한될 수 있습니다."
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>
            <b>(2) 현장수령</b>
          </p>
          행사 당일 공연 시작 시간 1시간 전 ~ 30분 전까지 행사장 매표소에서 티켓을 수령하실 수 있습니다.
          <div>현장 매표소에서 예매 완료 SMS 또는 예매번호 및 예매자 정보 확인 후 티켓을 수령할 수 있습니다.</div>
          <p>기획사 정책 또는 행사일에 따라 현장 수령 방법의 선택이 제한될 수 있습니다.</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
        </div>
      <h3 class="detail_toggle_title">예매 취소안내</h3>
      <div>
        <p>예매 당일 취소하는 경우 이외에는 예매수수료는 환불되지 않습니다.</p>
        <p>&nbsp;</p>
        <div>
          티켓 예매 후 7일 이내 취소 시 취소수수료는 부과되지 않습니다.
        </div>
        <div>
          단, 예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.
        </div>
        <div>
          <br/>
        </div>
        <div>
          배송 받은 티켓의 반품 접수는 취소가능시간 이내(영업일 기준)에 우편(빠른 등기) 또는 본사 반품을 통해서 입고 완료 건에 한하여 취소 가능하며, 입고 일을 기준으로 취소수수료 적용됩니다.
        </div>
        <div>
          일반우편 또는 택배로 반송 시 발생되는 분실, 지연 도착 등의 문제는 티켓링크에서 책임지지 않으니 이점 유의하시기 바랍니다.
        </div>
        <table class="detail_info_tbl mgt15" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px">
          <colgroup>
            <col style="width: 300px;">
            <col style="width: 450px;">
          </colgroup>
        <thead>
        <tr>
          <th rowspan="1" colspan="1" scope="col" style="width: 300px; height: 38px; margin: 0; padding: 0; border: 1px solid rgb(219, 219, 217); text-align: center; height: 36px; background: rgb(219, 219, 217)">
            관람일 구분
          </th>
          <th rowspan="1" colspan="1" scope="col" style="width: 450px; height: 38px; margin: 0; padding: 0; border: 1px solid rgb(219, 219, 217); text-align: center; height: 36px; background: rgb(219, 219, 217)">
            취소가능시간
          </th>
        </tr>
        </thead>
        <tbody>
          <tr>
            <td style="width: 330px; height: 42px; margin: 0px; padding: 9px 10px 9px 20px; border: 1px solid rgb(219, 219, 217); line-height: 22px;">
              일반
            </td>
            <td style="width: 450px; height: 42px; margin: 0px; padding: 9px 10px 9px 20px; border: 1px solid rgb(219, 219, 217); line-height: 22px;">
              관람일 1일전 17:00시까지
            </td>
          </tr>
          <tr>
          <td style="width: 330px; height: 64px; margin: 0px; padding: 9px 10px 9px 20px; border: 1px solid rgb(219, 219, 217); line-height: 22px;">
           관람일이 연휴기간이거나 연휴 다음날인 경우
          </td>
          <td style="width: 330px; height: 64px; margin: 0px; padding: 9px 10px 9px 20px; border: 1px solid rgb(219, 219, 217); line-height: 22px;">
              연휴 시작일 1일전 17:00시까지
              <br/>
              (연휴기간이 '토요일~화요일'인 경우 금요일 17시까지 취소가능)
          </td>
          </tr>
        </tbody>
        </table>
        <p>&nbsp;</p>
        <p>일부 공연의 경우 취소 가능 시간이 상이할 수 있습니다.</p>
      </div>
      <h3 class="detail_toggle_title">티켓 환불안내</h3>
      <div>
        <p>예매취소 시 취소수수료와 배송료를 제외한 나머지 금액이 환불 됩니다.</p>
        <p>취소수수료는 상품별로 상이할 수 있으며 상품 상세정보 하단에서 확인할 수 있습니다. </p>
        <p>&nbsp;</p>
        <p>
          무통장입금으로 결제한 경우 환불처리를 위해 예매자 본인명의의 계좌정보(예금주, 은행, 계좌번호)를 입력해야 하며 접수일로부터 3~5일(영업일기준)이내 환불 받을 수 있습니다. 상품에 따라 환불 시 송금수수료 500원이 부과될 수 있습니다. ​
        </p>
        <p>&nbsp;</p>
        <p>
          신용카드로 결제한 경우 취소일로부터 3~6일(영업일기준)이내 카드사에서 승인취소를 확인할 수 있습니다. 
        </p>
        <p>&nbsp;</p>
        <div>계좌이체, 실시간 계좌출금으로 결제한 경우 취소 시 1~2일(영업일 기준)이내 환불 됩니다.  </div>
        <div>휴대폰결제로 결제한 경우 당월 취소 시 즉시 환불되나 익월 취소 시에는 최대 60일까지 소요됩니다. </div>
        <p>예매권, 상품권으로 결제한 경우 취소 시 즉시 계정으로 환불 됩니다.</p>
        <p>&nbsp;</p>
      </div>
      </div>
  </div>
</section>


<!-- 상단 예약 정보 확인 -->
  <section id="common_section section_summary is-fixed">
    <div id="detail_summary" style="display: none;">
      <div class="summary_imgbox">
        <!-- before -->
        <img class="summary_img" src="https://image.toast.com/aaaaab/ticketlink/TKL_2/gloomy_pst_0603.jpg" alt="뮤지컬 &lt;사의찬미&gt;">
      </div>
      <div class="summary_info">
        <strong class="summary_title">뮤지컬 &lt;사의찬미&gt;</strong>
        <div class="summary_sideinfo">
          <span class="summary_place">링크아트센터 페이코홀</span>
          <span class="summary_period">
            <!-- before -->
             2024.07.02 - 2024.09.22
          </span>
        </div>
      <div class="summary_selection">
        <div class="selection1">
          <button type="button" class="selection_btn" aria-haspopup="listbox" aria-expanded="false">
            <!-- before -->
            <span class="blind">현재 선택된 옵션</span>
            <span class="selection_current">2024.07.02 (화)</span>
            <span class="blind">다른 옵션 보기</span>
            <!-- after -->
          </button>
          <!-- 버튼 누를시 리스트 -->

          </div>
        <div class="selection2">
          <button type="button" class="selection_btn2"  aria-haspopup="listbox" aria-expanded="false">
            <!-- before -->
             <span class="blind"> 현재 선택된 옵션</span>
             <span class="selection_current2">22시 00분</span>
             <span class="blind">다른 옵션 보기</span>
            <!-- after -->
          </button>
              <!-- 버튼 누를시 리스트2 -->

        </div> 
      </div>
      </div>
        <div class="summary_btnarea">
          <!-- before -->
          <a class="common_btn btn_primary btn_medium">예매하기</a>
        </div>
  </div>
</section>

<!-- 공연상세정보 밑 추천 -->
  <section class="common_section section_product_recommend">
    <div class="recommend_heading">
      <h2 class="heading_title">추천 공연 · 전시 </h2>
    </div>
    <div class="heading_grid">
      <ul class="grid_list type_col5">
<%
		for (int i=0; i<5; i++) {
%>

   <li class="grid_item">
          <div class="grid_unit">
            <a href="http://localhost:9090/Tcp2/ticketlink/Detailed_Infor(Integrated)/Prefor.detail(C).jsp?play_idx=<%=rpd.get(i).getPlay_idx()%>">
              <div class="imgbox"> 
                <!-- before -->
                <img class="img" src="<%=rpd.get(i).getPoster_url()%>"/>
              </div>
              <div class="grid_info">
                <span class="region"><%=rpd.get(i).getAreaName() %></span>
                <span class="title"><%=rpd.get(i).getPlayName()%></span>
              <div class="sideinfo">
                  <span class="place"></span>
                  <span class="period"><%=rpd.get(i).getStartDate() %> ~ <%=rpd.get(i).getEndDate() %></span>
              </div>
              <div class="flag">
                <div class="flag_area"></div>
              </div>
            </div>
          </a>
        </div>
    </li>  
   
<%
		}
%> 
   </ul>
 </div>
</section>

<!-- 상단 예약 정보 확인 -->
  <section id="common_section section_summary is-fixed">
    <div id="detail_summary" style="display: none;">
      <div class="summary_imgbox">
        <!-- before -->
        <img class="summary_img" src="https://image.toast.com/aaaaab/ticketlink/TKL_2/gloomy_pst_0603.jpg" alt="뮤지컬 &lt;사의찬미&gt;">
      </div>
      <div class="summary_info">
        <strong class="summary_title">뮤지컬 &lt;사의찬미&gt;</strong>
        <div class="summary_sideinfo">
          <span class="summary_place">링크아트센터 페이코홀</span>
          <span class="summary_period">
            <!-- before -->
             2024.07.02 - 2024.09.22
          </span>
        </div>
      <div class="summary_selection">
        <div class="selection1">
          <button type="button" class="selection_btn" aria-haspopup="listbox" aria-expanded="false">
            <!-- before -->
            <span class="blind">현재 선택된 옵션</span>
            <span class="selection_current">2024.07.02 (화)</span>
            <span class="blind">다른 옵션 보기</span>
            <!-- after -->
          </button>
          <!-- 버튼 누를시 리스트 -->

          </div>
        <div class="selection2">
          <button type="button" class="selection_btn2"  aria-haspopup="listbox" aria-expanded="false">
            <!-- before -->
             <span class="blind"> 현재 선택된 옵션</span>
             <span class="selection_current2">22시 00분</span>
             <span class="blind">다른 옵션 보기</span>
            <!-- after -->
          </button>
              <!-- 버튼 누를시 리스트2 -->

        </div> 
      </div>
      </div>
        <div class="summary_btnarea">
          <!-- before -->
          <a class="common_btn btn_primary btn_medium">예매하기</a>
        </div>
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
</footer>
 
 <!-- 맨 밑 하단 회사정보-->
<section>
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

<!-- JavaScript -->

<script>
    
  $("#detail_information_btn").trigger('click');

  $(function() {
    $("#detail_information_btn").click(function() {
      $("#detail_information").css('display', 'block');
      $("#review").css('display', 'none');
      $("#preview").css('display', 'none');
      $("#place").css('display', 'none');
      $("#productNotice").css('display', 'none');

      $(this).attr('aria-selected', 'true');
      $("#review_btn").attr('aria-selected', 'false');
      $("#preview_btn").attr('aria-selected', 'false');
      $("#place_btn").attr('aria-selected', 'false');
      $("#productNotice_btn").attr('aria-selected', 'false');
    })
  })

  $(function() {
  $("#review_btn").click(function() {
      $("#review").css('display', 'block');
      $("#detail_information").css('display', 'none');
      $("#preview").css('display', 'none');
      $("#place").css('display', 'none');
      $("#productNotice").css('display', 'none');

      $(this).attr('aria-selected', 'true');
      $("#detail_information_btn").attr('aria-selected', 'false');
      $("#preview_btn").attr('aria-selected', 'false');
      $("#place_btn").attr('aria-selected', 'false');
      $("#productNotice_btn").attr('aria-selected', 'false');
    })
  })
  
  $(function() {
  $("#preview_btn").click(function() {
      $("#preview").css('display', 'block');
      $("#detail_information").css('display', 'none');
      $("#review").css('display', 'none');
      $("#place").css('display', 'none');
      $("#productNotice").css('display', 'none');

      $(this).attr('aria-selected', 'true');
      $("#detail_information_btn").attr('aria-selected', 'false');
      $("#review_btn").attr('aria-selected', 'false');
      $("#place_btn").attr('aria-selected', 'false');
      $("#productNotice_btn").attr('aria-selected', 'false');
    })
  })

  $(function() {
  $("#place_btn").click(function() {
      $("#place").css('display', 'block');
      $("#detail_information").css('display', 'none');
      $("#preview").css('display', 'none');
      $("#review").css('display', 'none');
      $("#productNotice").css('display', 'none');

      $(this).attr('aria-selected', 'true');
      $("#detail_information_btn").attr('aria-selected', 'false');
      $("#preview_btn").attr('aria-selected', 'false');
      $("#review_btn").attr('aria-selected', 'false');
      $("#productNotice_btn").attr('aria-selected', 'false');
    })
  })
  
  $(function() {
  $("#productNotice_btn").click(function() {
      $("#productNotice").css('display', 'block');
      $("#detail_information").css('display', 'none');
      $("#preview").css('display', 'none');
      $("#place").css('display', 'none');
      $("#review").css('display', 'none');

      $(this).attr('aria-selected', 'true');
      $("#detail_information_btn").attr('aria-selected', 'false');
      $("#preview_btn").attr('aria-selected', 'false');
      $("#place_btn").attr('aria-selected', 'false');
      $("#review").attr('aria-selected', 'false');
    })
  })
</script>

<script>
	function ScriptwriteInsert() {
	    const title = document.getElementById('title').value.trim();
	    const content = document.getElementById('content').value.trim();
	    const starRatings = document.querySelectorAll('.star_rating');
		const reg_date = document.querySelectorAll('.comment_date');
	    
		 // 별점을 저장할 변수를 초기화
		let star_rating = 1;
	
		 // 각 라디오 버튼에 이벤트 리스너 추가
	 	starRatings.forEach(radio => {
	  	radio.addEventListener('change', function() {
	       // 선택된 라디오 버튼의 값 가져오기
	    star_rating = Integer.parseInt(this.value);
	
	  	});
	  	
	      form.action = '/Tcp2/ScriptwriteServlet';
	      form.method = 'doget';
	      form.submit();
		});
	}
</script>

<script>
	function ratingwriteInsert() {
		
	
	form.action = '/Tcp2/Ins_Exp_ratingServlet';
	form.method = 'doget';
	form.submit();
	
	}
	
</script>

<script>
$(document).ready(function() {
    // 초기 색상 설정
    $(".fa-star").css("color", "black");

    $(".fa-star").click(function() {
        const starId = $(this).attr("id"); // 클릭한 스타의 ID 가져오기
        const starValue = parseInt(starId.replace("star", "")); // ID에서 숫자 추출

        // 현재 색상 상태 확인
        const isSelected = $(this).css("color") === "rgb(255, 0, 0)"; // 빨간색인지 확인

        if (isSelected) {
            // 클릭한 별이 이미 선택되어 있다면 그 별만 꺼짐
            $(this).css("color", "black");
        } else {
            // 클릭한 별과 이전 별들을 빨간색으로 변경
            for (let i = 1; i <= starValue; i++) {
                $("#star" + i).css("color", "#FF0000");
            }
            $("#star1").css("color", "#FF0000");
        }

        // 클릭한 별보다 높은 별들은 꺼지게 설정
        for (let i = starValue + 1; i <= 5; i++) {
            $("#star" + i).css("color", "black");
        }
        $("#star1").css("color", "#FF0000");
    });
});


</script>

<script>
var rating = $('.star_rt');
	rating.each(function() {
		var $this = $(this);
		var targetScore = $this.attr('data-rate');
		var firstdigit = targetScore.split('.');
		
		if (firstdigit.length > 1) {
			for (var i=0; i<firstdigit[0]; i++) {
				$(this).find('.star_r').eq(i).css({width: '100%'});
			}
			$this.find('.star_r').eq(firstdigit[0]).css({width: firstdigit[1]+ '0%'});
		}else {
			for (var i=0; i<targetScore; i++) {
				$this.find('star_r').eq(i) .css({width: '100%'});
			}
		}

	});
	
</script>

<script>
  // 기존 맵 생성 코드
  var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(<%=phmd.get(0).getLatitude()%>, <%=phmd.get(0).getLongitude()%>), // 위도와 경도를 올바르게 설정합니다.
    zoom: 18
  });

  // 기존 마커 설정
  var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(35.17982543369992, 129.07499499992576),
    map: map
  });

  // PlayhallMapDTO의 정보로 새로운 마커 추가
  var playhallMarker = new naver.maps.Marker({
    position: new naver.maps.LatLng(<%=phmd.get(0).getLatitude()%>, <%=phmd.get(0).getLongitude()%>), // DTO의 위도와 경도
    map: map
  });
  
  // 지도 크기 조정 함수
  var $window = $(window);

  function getMapSize() {
    var size = new naver.maps.Size(1120, 800);
    return size;
  }

  // 창 크기 변경 시 지도 크기 조정
  $window.on('resize', function() {
    map.setSize(getMapSize());
  });

  // 페이지 로드 시 지도 크기 조정
  $(document).ready(function() {
    map.setSize(getMapSize());
  });
</script>

<script>

	function calc() {
		document.getElementById('result1').value = document.getElementById('content').value.length;
	}

	$('.comment_textarea').keyup(function (e) {
		var content = $(this).val();
		$('.curr_length').html("("+content.length+"/ 1000)");
	
		if(content.length > 1000) {
		   alert("최대 1000자까지 입력 가능합니다.");
	           $(this).val($(this).val().substring(0, 200));
		   $('.curr_length').html("(1000/1000)");
		}
	});
	
</script>

<script>
  function reservation() {
	  const playinfoValue = document.querySelector('.product_seat_item').getAttribute('playinfo');
      window.open('/Tcp2/Payment_p0?pi='+ playinfoValue, '', 'width=1200, height=900');
	  
  }

</script>

<script>

function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}


</script>

</body>
</html>