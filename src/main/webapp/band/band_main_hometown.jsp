<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@page import="project.DatabaseUtil"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	/* int m_idx = Integer.parseInt(request.getParameter("member_idx")); */
	HttpSession hs = request.getSession();
	int m_idx = (int)hs.getAttribute("userIdx");
	int member_idx = (int)hs.getAttribute("userIdx");
	
	// 내 가입 밴드 출력
	MeetIntroduceWriteDAO mbwDao = new MeetIntroduceWriteDAO();
	
	MybandDAO mbDao = new MybandDAO();

	ArrayList<MybandDTO> mbListDao = new ArrayList<>();

	try { 
		mbListDao = mbDao.selectMybandDTO(m_idx);
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
                    <button type="submit" class="menuModalLink">로그아웃</button>
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
              <a href = "band_main.jsp?member_idx=<%=member_idx %>" class = "myband_text">
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
            <a href="#" class="btn_option" target="_blank">
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

  <!-- 소모임 메인 화면 -->
    <div id="main2">
      <div id="local_meet_band">
        <h2 id="local_title" style="padding-top: 38px;">
          <span class="setting_local"><%=areaDetailDto.getArea_detail() %></span>
          소모임
          <button type="button" class="open_keyword_btn">지역 선택</button>
        </h2>
      </div>
      <div id="content2">
        <h3 class="title_main_home">소모임 멤버를 모집합니다!
          <span class="help_guide_round" role="alert" aria-live="assertive" style="position:static">
            <button type="button" class="help_btn">
              <span class="help">도움말</span>
            </button>
            <span class="bubble_help_layer" style="width:348px; display:none">
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
    	<% for(SelectBandAreaDTO aDto : areaListDao) {
    		MeetIntroduceWriteDTO miDto = miDao.selectMeetIntroduceWriteDTO(aDto.getMeet_idx());
    		%>
          <div id="band_item_view">
            <div id="band_meet_content">
              <div id="band_meet_content_text">
                <h3 class="band_meet_content_title"><%=aDto.getName() %>
                </h3>
                <div class="band_meet_content_main"><%=aDto.getTitle() %></div>
                <div id="band_meet_content_tag">
                  <button class="local_tag"><%=aDto.getArea_detail() %></button>
                </div>
              </div>
              <div id="band_meet_content_img">
                <img src="<%=aDto.getUrl() %>" class="band_cover_img">
              </div>
              <a type="button" href="band_home.jsp?meet_idx=<%=aDto.getMeet_idx() %>&member_idx=<%=member_idx %>" class="band_meet_content_link" style="width:500px; height:150px"></a>
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