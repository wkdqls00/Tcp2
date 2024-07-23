<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@page import="project.DatabaseUtil"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// if(session.getAttribute("userIdx") == null) {
%>
<script>
	/* alert("로그인이 필요합니다.");
	location.href="../ticketlink/Login/Login.jsp"; */
</script>
<%		
	// } else {
		HttpSession hs = request.getSession();
		
		int member_idx = 0;
		
		if(session.getAttribute("userIdx") == null) {
			member_idx = Integer.parseInt(request.getParameter("member_idx"));
		} else {
			member_idx = (int)hs.getAttribute("userIdx");
		}
		
		// 내 가입 밴드 출력
		MeetIntroduceWriteDAO mbwDao = new MeetIntroduceWriteDAO();
		
		MybandDAO mbDao = new MybandDAO();
	
		ArrayList<MybandDTO> mbListDao = new ArrayList<>();
	
		try { 
			mbListDao = mbDao.selectMybandDTO(member_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		SelectBandDAO selectDao = new SelectBandDAO();
		
		//소모임 지역 idx
		SelectMeetAreaIdxDTO selectDto = selectDao.selectMeetAreaIdxDTO(member_idx);
		int meet_area_idx = selectDto.getMeet_area_idx();
		
		//지역별 소모임 출력
		ArrayList<SelectBandAreaDTO> areaListDao = new ArrayList<>();
		try {
			areaListDao = selectDao.selectBandAreaDTO(meet_area_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		SelectBandAreaDTO areaDetailDto = selectDao.selectAreaDetailDTO(meet_area_idx);
		
		//멤버 수 출력
		MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
		
		//모든 밴드 출력
		ArrayList<SelectAllBandDTO> bandListDao = new ArrayList<>();
		bandListDao = selectDao.selectAllBandDTO();
	// }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../assets/css/band_main.css">
  <link rel="stylesheet" href="../assets/css/clear.css">
  <link rel="stylesheet" href="../assets/css/band_header.css"> 
  <link rel="stylesheet" href="../assets/css/band.css">
  <title>BAND - 메인 페이지</title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <style>
  .member {
  	font-size: 13px;
  }
  </style>
</head>
<body>
  <div class="wrap">
    <header class="header_area">
      <div class="headerInner">
        <!-- 로고, 검색창 영역 -->
        <div class="logo_search_area">
          <!-- 로고 -->
          <h1 class = "logo_area">
            <a href="#" class="logo">
            </a>
          </h1>
        </div>
        <!-- 위젯 -->
        <div id="header_widget_area">
          <ul class="widgetList">
            <li class="ml_24 positionR">
              <button class="btnMySetting">
                <span class="uProfile">
                  <span class="profileInner">
                    <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240528100621/images/template/profile_60x60.png"
                    width="30" height="30">
                  </span>
                </span>
              </button>
              <!-- 프로필 클릭 시 드롭다운 -->
              <div class="menuModalLayer profileDropDown" id="off" style="display: none">
                <ul class="menuModalList">
                  <li class="menuMadalItem">
                  <form action="../LogoutAction">
                  	<button class="menuModalLink">로그아웃</button>
                    <!-- <a href="#" class="menuModalLink">로그아웃</a> -->
                   </form>
                  </li>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </header>
  </div>
  <!-- 내 밴드 소모임 버튼  -->
  <div class="header2_area">
    <div id="content"> 
      <div id="content_tab" >
        <div id="content_tab_left">
          <div id="tab_myband">
            <div id="myband_btn">
              <a href = "#main" class = "myband_text">
              내 밴드  
              </a>
            </div>
          </div>
          <div id="tab_meet">
            <div id="meet_btn">
              <a href="#main2" class="meet_text">
                소모임
              </a>
            </div>
          </div>
        </div>
        <!-- 동네 밴드 목록편집 버튼 -->
        <div id="content_tab_right">
          <div id="tab_place_band">
            <a href="band_main_hometown.jsp?member_idx=<%=member_idx %>" class="btn_option">
              <span class="local_icon"></span>
              <span class="option_text">동네 밴드</span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="wrap" style="background-color: transparent;">
    <!-- main 메인 -->
    <div id="main">
      <ul id="band_card_list">
        <li class="band_card_item">
          <div id="band_inner">
            <a href="band_new_create.jsp?member_idx=<%= member_idx %>" class="band_create_link">
              <div id="cover">
                <img class="create_band_img">
              </div>
              <div id="band_name">
                <a class="url_text">만들기</a>
              </div>
            </a>
          </div>
        </li>
        <!-- 내 밴드 목록 -->
        <% 
        for (MybandDTO mbDto : mbListDao) {
       	%>
        <li class="band_card_item">
          <div id="band_inner">
            <a href="band_home.jsp?member_idx=<%=member_idx%>&meet_idx=<%=mbDto.getMeet_idx()%>" class="band_cover_link">
            <div id="cover_band">
              <div class="uCoverImage -border">
                <span class="coverInner">
                <% if(mbDto.getUrl() != null) { %>
                  <img class="coverImg" src="<%= mbDto.getUrl() %>" alt>
                  <% } else { %>
                  <img class="coverImg">
                  <% } %>
                </span>
              </div>
            </div>
            <div id="band_name">
              <p class="url_text"> <%= mbDto.getMeet_name() %> </p>
              <span class="member">
                멤버
                  <em><%= mbDto.getMeet_member_count() %></em>
               </span>
            </div>
            </a>
          </div>
        </li>
        <%
        }
        %>
      </ul>
    </div>
  <!-- 소모임 메인 화면 -->
    <div id="main2">
      <div id="local_meet_band">
        <h2 id="local_title">
          소모임 목록
        </h2>
      </div>
      <div id="content2">
        <h3 class="title_main_home">소모임 멤버를 모집합니다!
          <span class="help_guide_round" role="alert" aria-live="assertive" style="position:static">
            <button type="button" class="help_btn">
              <span class="help">도움말</span>
            </button>
            <span class="bubble_help_layer" style="width:348px; display:none;">
              소모임 활동 주제가 분명하고, 오프라인 정모 활동이 활발한 밴드를 선정해 보여드려요!
              <button type="button" class="close_btn">
              <span class="help">닫기</span>
            </button>
          </span>
        </span>
      </h3>
    </div>
    <!-- 소모임 멤버 모집글 -->
    <div id="band_find_wrap">
        <div id="band_list">
    	<% for(SelectAllBandDTO sDto : bandListDao) {
    		MeetIntroduceWriteDTO miDto = miDao.selectMeetIntroduceWriteDTO(sDto.getMeet_idx());
    		%>
          <div id="band_item_view">
            <div id="band_meet_content">
              <div id="band_meet_content_text">
                <h3 class="band_meet_content_title"><%=sDto.getMeetName() %>
                </h3>
                <div class="band_meet_content_main"><%=sDto.getTitle() %></div>
                <div id="band_meet_content_tag">
                  <button class="local_tag"><%=sDto.getAreaDetail() %></button>
                </div>
              </div>
              <div id="band_meet_content_img">
              <% if (sDto.getUrl() != null) { %>
                <img src="<%=sDto.getUrl() %>" class="band_cover_img">
                <% } else { %>
                <img class="band_cover_img">
                <% } %>
              </div>
              <a type="button" href="band_home.jsp?meet_idx=<%=sDto.getMeet_idx() %>&member_idx=<%=member_idx %>" class="band_meet_content_link" style="width:500px; height:150px"></a>
            </div>
            <div id="band_meet_info_wrap">
              <div id="meet_info_box">
                <div id="meet_together">
                  <span class="-emphasis"><%= miDto.getMeet_member_count() %></span>
                  명 참여중
                </div>
              </div>
            </div>
          </div>
    	<% } %>
       </div>
    </div>
      <!-- footer -->
    </div>
  </div>
  <footer id="footer">
      <div id="footer_wrap">
        <ul class="menu_list">
          <li class="menu_list_item">
            <a href="#" target="_blank" class="menu_link">블로그</a>
          </li>
          <li class="menu_list_item">
            <a href="#" target="_blank" class="menu_link">이용약관</a>
          </li>
          <li class="menu_list_item">
            <a href="#" target="_blank" class="menu_link">
              <strong>개인정보처리방침</strong>
            </a>
          </li>
        </ul>
        <address>
          <strong>BAND</strong>
          © 2024
        </address>
      </div>
  </footer>
  <script>
  $(function(){
	// 프로필 클릭 시 드롭다운 (프로필 설정, 로그아웃)
      $(".btnMySetting").click(function() {
	  	let onOff = $(".profileDropDown").attr('id');
	  	if (onOff == 'off') {
			$(".profileDropDown").attr('id', 'on');
			$(".profileDropDown").css('display', 'block');
		} else {
			$(".profileDropDown").attr('id', 'off');
			$(".profileDropDown").css('display', 'none');
		}
      }) 
  });
  </script>
</body>
</html>