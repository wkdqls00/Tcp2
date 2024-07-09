<%@page import="dto.MeetMemberProfilePrintDTO"%>
<%@page import="dao.MeetMemberProfilePrintDAO"%>
<%@page import="dto.BandPublicOkDTO"%>
<%@page import="dao.BandPublicOkDAO"%>
<%@page import="dto.MeetIntroduceWriteDTO"%>
<%@page import="dao.MeetIntroduceWriteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public String publicOk(String input) {
		if(input.equals("Y")) {
			return "checked";
		} else {
			return "";
		}
	}

	public String publicNo(String input) {
		if(input.equals("N")) {
			return "checked";
		} else {
			return "";
		}
	}
%>
<%
	//밴드 왼쪽 소개
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
	MeetIntroduceWriteDTO miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
	
	//밴드공개 여부
	BandPublicOkDAO bpoDAO = new BandPublicOkDAO();
	BandPublicOkDTO bpoDTO = bpoDAO.selectBandPublicOkDTO(meet_idx);
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));
	
	//내 프로필 출력
	MeetMemberProfilePrintDAO mMemberProfilePrintDAO = new MeetMemberProfilePrintDAO();
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = mMemberProfilePrintDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_header.css'>
  
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
   
  <title>Band public_or_not</title>
</head>
<body>
  <div id="wrap">
    <!-- 최상단 헤더 -->
    <header class="header_area">
      <div class="headerInner">
        <!-- 로고, 검색창 영역 -->
        <div class="logo_search_area">
          <!-- 로고 -->
          <h1 class = "logo_area">
            <a href="#" class="logo">
            </a>
          </h1>
          <!-- 검색창 -->
          <form action>
            <fieldset>
              <div class="search_input">
                <input type="text" id="input_serach_view" class="inputBandSearch" role="search" placeholder="밴드, 페이지, 게시글 검색" autocomplete="off">
                <button type="submit" class="btn_search">
                </button>
              </div>
            </fieldset>
          </form>
        </div>
        <!-- 위젯 -->
        <div id="header_widget_area">
          <ul class="widgetList">
            <li>
              <button class="btnIconStyle">
                <span class="uIconNews"></span>
              </button>
            </li>
            <li class="ml_14">
              <button class="btnIconStyle">
                <span class="uIconChat"></span>
              </button>
            </li>
            <li class="ml_24 positionR">
              <button class="btnMySetting">
                <span class="uProfile">
                  <span class="profileInner">
                  <% try {
                	  if (mMemberProfilePrintDTO.getProfile() != null) { %>
                  		<img src="<%= mMemberProfilePrintDTO.getProfile() %>"
                    width="30" height="30">
                    <% } else { %>
                   <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240528100621/images/template/profile_60x60.png"
                   width="30" height="30">
                  	<% } 
                  	} catch (Exception e) {
                  		e.printStackTrace();
                  	} %>
                  </span>
                </span>
              </button>
            </li>
          </ul>
        </div>
      </div>
    </header>
    <!-- 내용 시작 -->
    <div id="container" class="band_main_area">
      <!-- header lnb 메뉴 -->
      <div class="header_lnb bg_blue">
        <ul class="header_lnb_menu">
          <li class="menu_item">
            <a href="#">
              <span class="menu_item_txt active">게시글</span>
            </a>
          </li>
          <li class="menu_item">
            <a href="#">
              <span class="menu_item_txt">멤버</span>
            </a>
          </li>
        </ul>
      </div>
      <!-- 메인 내용 왼쪽 밴드 소개 -->
      <aside class="band_info">
        <div class="info_inner">
          <div class="sticky_side_bar">
            <!-- 밴드 이미지 -->
            <div class="side_cover">
                <div class="cover_img">
                  <span class="cover_inner">
                  <img
                    <% if (miDto.getUrl() != null) {%>
                    	src = "<%= miDto.getUrl() %>"
                   	<% } %>
                   	>
                  </span>
                </div>
              <!-- 밴드 이름 -->
              <div class="band_name">
                <a class="band_name_txt"><%= miDto.getMeet_name() %></a>
              </div>
            </div>
            <!-- 멤버 수 -->
            <p class="member">
              <a href="#" class="member_count">멤버 <%= miDto.getMeet_member_count() %></a>
            </p>
            <!-- 글쓰기 버튼 -->
            <div class="btnBox">
              <button class="uButton bg_blue" id="postWriteBtn">글쓰기</button>
            </div>
            <!-- 밴드 정보 보기 -->
            <div class="bandInfoBox">
              <a href="#" class="showBandInfo">밴드 정보 보기
                <span class="uIconArrow"></span>
              </a>
            </div>
            <p class="bandTypeDesc">누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시물을 볼 수 있습니다.</p>
            <!-- 밴드 설정 -->
            <div class="bandSetting">
              <a href="#" onClick="history.back()"  class="bandSetting_Link">
                <span class="uIconSetting"></span>
                밴드 설정
              </a>
            </div>
          </div>
        </div>
      </aside>
      <!-- 밴드 공개 -->
      <main class="main_content">
        <div class="band_type_condition_view">
          <section class="setting_band">
            <div class="header_wrap">
              <header class="content_header">
                <h1 class="h1_title">밴드 공개</h1>
              </header>
            </div>
            <ul class="set_list">
              <li class="set_item">
                <div class="itemContent">
                  <label for="secret" class="label -point">비공개 밴드</label>
                  <span class="subTxt">밴드와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</span>
                </div>
                <div class="itemSide">
                  <label class="check_btn">
                    <input type="radio" id="secret" class="check_input" name="type_check" <%=publicNo(bpoDTO.getPublic_ok()) %> >
                    <span class="check_label">
                      <span class="shape"></span>
                    </span>
                  </label>
                </div>
              </li>
              <li class="set_item -flexWrap">
                <div class="-flexible">
                  <div class="itemContent">
                    <label for="closed" class="label">공개 밴드</label>
                    <span class="subTxt">누구나 밴드를 검색해 찾을 수 있고 밴드 소개와 게시글을 볼 수 있습니다.</span>
                  </div>
                  <div class="itemSide">
                    <label class="check_btn">
                      <input type="radio" id="public" class="check_input" name="type_check" <%=publicOk(bpoDTO.getPublic_ok()) %>>
                      <span class="check_label">
                        <span class="shape"></span>
                      </span>
                    </label>
                  </div>
                </div> 
              </li>
            </ul>
            <div class="guide_area">
              <p class="guide_area_txt">타입 변경시 멤버들에게 알림이 발송됩니다.</p>
            </div>
	            <div class="btn_footer">
            		<form action="myband_setting_leader.jsp" method="get">
	              		<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
	              		<input type="hidden" value="<%=member_idx%>" name="member_idx">
	              		<button type="submit" class="confirm_btn">저장</button>
            		</form>
	            </div>
          </section>
        </div>
      </main>
      <!-- 메인 내용 오른쪽 채팅방 목록 -->
      <div id="banner">
        <div id="bannerInner">
          <div class="chatSticky">
            <section class="bandChannerView">
              <h2 class="tit">채팅</h2>
              <div class="chat_setting_wrap">
                <button class="chat_setting_btn">설정</button>
              </div>
              <div class="body">
                <div class="new_chatting_wrap">
                  <div class="buttonBox">
                    <button class="newChattingBtn">
                      <span class="iconPlusSquare"></span>
                      새 채팅
                    </button>
                  </div>
                </div>
                <!-- 채팅 목록 -->
                <div class="nano">
                  <div class="nano_content">
                    <ul class="chat">
                      <li>
                        <button class="itemLink">
                          <span class="thum">
                            <img src="https://coresos-phinf.pstatic.net/a/34g065/e_5a2Ud018admg69oqx3t5mng_5ksoqj.png?type=s75"
                            height="30" width="30">
                          </span>
                          <span class="cont">
                            <strong class="text">6조 밴드</strong>
                            <span class="sub">밴드 전체 멤버들과 함께 하는 채팅방</span>
                          </span>
                        </button>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </section>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>