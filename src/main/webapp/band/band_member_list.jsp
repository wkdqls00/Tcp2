<%@page import="dao.NoJoinMeetDAO"%>
<%@page import="dto.ChatListDTO"%>
<%@page import="dao.ChatListDAO"%>
<%@page import="dto.MeetMemberProfilePrintDTO"%>
<%@page import="dao.MeetMemberProfilePrintDAO"%>
<%@page import="dao.MeetPostListPrintDAO"%>
<%@page import="dao.MeetIntroduceWriteDAO"%>
<%@page import="dto.MeetIntroduceWriteDTO"%>
<%@page import="dto.MeetMemberListPrintDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MeetMemberListPrintDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));
	//멤버 목록
	MeetMemberListPrintDAO mmlpDAO = new MeetMemberListPrintDAO();
	ArrayList<MeetMemberListPrintDTO> mmlpDTO = new ArrayList<>();
	
	try {
		mmlpDTO = mmlpDAO.selectMeetMemberListPrintDTO(meet_idx);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	//리더 출력
	MeetPostListPrintDAO mPrintDAO = new MeetPostListPrintDAO();
	
	// 밴드 왼쪽 소개
	MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
	MeetIntroduceWriteDTO miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
	
	//내 프로필 출력
	MeetMemberProfilePrintDAO mMemberProfilePrintDAO = new MeetMemberProfilePrintDAO();
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = mMemberProfilePrintDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);

	// 채팅 목록 출력
	ChatListDAO cDao = new ChatListDAO();
	ArrayList<ChatListDTO> chatListDto = new ArrayList<>();
	
	chatListDto = cDao.selectChatListDTO(meet_idx);
	
	// 밴드 가입 여부
	NoJoinMeetDAO njDao = new NoJoinMeetDAO();
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_header.css'>
  <title>BAND - 멤버 목록</title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
  <div id="wrap">
    <!-- 최상단 헤더 -->
    <header class="header_area bg_blue">
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
                <span class="uIconNews bg_white"></span>
              </button>
            </li>
            <li class="ml_14">
              <button class="btnIconStyle">
                <span class="uIconChat bg_white"></span>
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
             <form action="band_home.jsp" method="post">
	          <a>
	          	<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
   		  	 	<input type="hidden" value="<%=member_idx %>" name="member_idx">
             	<button type="submit">
           		  <span class="menu_item_txt" style="padding:2px;">게시글</span>
            	</button>
	          </a>
            </form>
          </li>
          <li class="menu_item">
           <form action="band_member_list.jsp" method="post">
           	<a>	
   		  	 <input type="hidden" value="<%=meet_idx %>" name="meet_idx">
   		  	 <input type="hidden" value="<%=member_idx %>" name="member_idx">
             <button type="submit">
              <span class="menu_item_txt active">멤버</span>
             </button>
  	        </a>
           </form>
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
              <a href="#" class="member_count">멤버 <%=miDto.getMeet_member_count() %></a>
            </p>
            <!-- 밴드 소개 설정 -->
            <div class="band_info_setting">
              <a href="#" class="band_setting_link">밴드 소개 설정</a>
            </div>
            <!-- 글쓰기 버튼 -->
            <div class="btnBox">
              <button class="uButton bg_blue">글쓰기</button>
            </div>
            <!-- 밴드 안내 문구 -->
            <p class="bandTypeDesc">
              밴드와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.
            </p>
            <!-- 밴드 설정 -->
            <div class="bandSetting">
            	<form action="myband_setting_leader.jsp" method="post">
	            	<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
	            	<input type="hidden" value="<%=member_idx %>" name="member_idx">
	              	<button type="submit" class="bandSetting_Link">
		                <span class="uIconSetting"></span>
		                밴드 설정
	                </button>
              </form>
            </div>
          </div>
        </div>
      </aside>
      <!-- 메인 내용 가운데 멤버 목록 -->
      <main class="band_main">
        <div class="memberSection">
          <!-- 멤버 검색 영역 -->
          <div class="mHeaderWrap">
            <header class="header">
              <h1 class="title">멤버
                <em class="count sf_blue"><%=miDto.getMeet_member_count() %></em>
              </h1>
            </header>
            <div class="uInputSearch">
              <input type="text" placeholder="멤버 검색" id="keyword">
              <button class="search" type="submit"></button>
              <span class="border"></span>
            </div>
          </div>
          <!-- 멤버 목록 -->
          <div class="memberWrap">
            <div class="memberListWrap">
              <div class="memberListView">
                <div class="subTitle">
                  <h2 class="title">멤버</h2>
                  <div class="uSelect">
                  </div>
                </div>
                <% 
                	for(MeetMemberListPrintDTO dto : mmlpDTO) {
                %>
                <ul class="memberList">
                  <li class="uFlexItem">
                    <a class="uProfile">
                      <span class="profileInner">
                        <img src="<%=dto.getProfile() %>"
                        width="50" height="50">
                      </span>
                    </a>
                    <div class="body">
                      <span class="text -flex">
                        <span class="ellipsis"><%=dto.getNickname() %></span>
                        <% if (dto.getAdmin_ok().equals("Y")) { %>
                        <em class="leader">리더</em>
                        <% } else {  %>
                       	<em></em>
                       	<% } %>
                      </span>
                    </div>
                  </li>
                </ul>
                <%
                	}
                %>
              </div>
            </div>
          </div>
        </div>
      </main>
     <!-- 메인 내용 오른쪽 채팅방 목록 : 가입했을 시 출력 -->
      <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
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
                    <% for (ChatListDTO cDto2 : chatListDto) { %>
                      <li>
                        <button class="itemLink" onclick="window.open('chat.jsp', '', 'width=415, height=643')">
                          <span class="thum">
                            <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240603162344/images/template/multi_profile_60x60.png"
                            height="30" width="30">
                          </span>
                          <span class="cont">
                            <strong class="text"><%= cDto2.getTitle() %></strong>
                            <span class="sub"><%= cDto2.getContent() %></span>
                          </span>
                        </button>
                      </li>
                      <% } %>
                    </ul>
                  </div>
                </div>
              </div>
            </section>
          </div>
        </div>
      </div>
     <% } %>
  </div>
</body>
</html>