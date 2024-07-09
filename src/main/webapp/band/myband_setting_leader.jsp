<%@page import="dto.MeetPostListPrintDTO"%>
<%@page import="dao.MeetPostListPrintDAO"%>
<%@page import="dto.BandPublicOkDTO"%>
<%@page import="dao.BandPublicOkDAO"%>
<%@page import="dao.MeetIntroduceWriteDAO"%>
<%@page import="dto.MeetIntroduceWriteDTO"%>
<%@page import="dto.MeetSettingPrintDTO"%>
<%@page import="dao.MeetSettingPrintDAO"%>
<%@page import="dto.MeetMemberProfilePrintDTO"%>
<%@page import="dao.MeetMemberProfilePrintDAO"%>
<%@page import="dto.MeetMemberSettingPrintDTO"%>
<%@page import="dao.MeetMemberSettingPrintDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BandDeleteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public String joinok(String input){
		if(input.equals("Y")){
			return "checked";
		} else {
			return "";
		}
	}
%>
<%
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));

	MeetMemberSettingPrintDAO mmspDAO = new MeetMemberSettingPrintDAO();
	ArrayList<MeetMemberSettingPrintDTO> mmspListDAO = new ArrayList<>();
	
	try {
		mmspListDAO = mmspDAO.selectMeetMemberSettingPrintDTO(meet_idx);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<%
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));
	MeetMemberProfilePrintDAO mmppDAO = new MeetMemberProfilePrintDAO();
	MeetMemberProfilePrintDTO mmppDTO = mmppDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);
	
%>
<%
	MeetSettingPrintDAO mspDAO = new MeetSettingPrintDAO();
	MeetSettingPrintDTO mspDTO = mspDAO.selectMeetSettingPrintDTO(meet_idx);
	
	// 밴드 왼쪽 소개
	MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
	MeetIntroduceWriteDTO miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
	
	//내 프로필 출력
	MeetMemberProfilePrintDAO mMemberProfilePrintDAO = new MeetMemberProfilePrintDAO();
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = mMemberProfilePrintDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);
	
	// 밴드 공개 여부
	BandPublicOkDAO bDao = new BandPublicOkDAO();
	BandPublicOkDTO bOkDTO = bDao.selectBandPublicOkDTO(meet_idx);
	
	// 밴드 글 목록 출력
	MeetPostListPrintDAO mPrintDAO = new MeetPostListPrintDAO();
	ArrayList<MeetPostListPrintDTO> mPrintListDTO = new ArrayList<>();
	
	mPrintListDTO = mPrintDAO.selectMeetPostListPrintDTO(meet_idx);
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_header.css'>
  <link rel="stylesheet" type="text/css" media="screen" href="../assets/css/myband_setting.css">
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_leave_popup.css'>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <title>BAND - <%= miDto.getMeet_name() %> - Setting - Leader</title>
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
               	   <% if (mMemberProfilePrintDTO.getProfile() != null) { %>
               		<img src="<%= mMemberProfilePrintDTO.getProfile() %>"
                    width="30" height="30">
                    <% } else { %>
                   <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240528100621/images/template/profile_60x60.png"
                   width="30" height="30">
                  	<% } %>
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
              <span class="menu_item_txt" style="padding:2px;">멤버</span>
             </button>
  	        </a>
           </form>
          </li>
        </ul>
      </div>
      <aside class="band_info">
        <div class="info_inner">
          <div class="sticky_side_bar">
            <!-- 밴드 이미지 -->
            <div class="side_cover">
              <a href="#">
                <div class="cover_img">
                  <span class="cover_inner">
                  <img
                    <% if (miDto.getUrl() != null) {%>
                    	src = "<%= miDto.getUrl() %>"
                   	<% } %>
                   	>
                  </span>
                </div>
              </a>
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
            <!-- 밴드 소개 설정 : 리더일 시 출력 -->
            <form action="band_information.jsp" method="post">
            	<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
   		  	 	<input type="hidden" value="<%=member_idx %>" name="member_idx">
	            <div class="bandInfoBox">
	             <% try {
	            	 if (mPrintDAO.adminCheck(member_idx, meet_idx)) { %>
	              <button type="submit" class="showBandInfo">밴드 소개 설정
	             <% 	} 
	             	} catch(Exception e) {
	             		e.printStackTrace();
	             	}
	             	%>
	                <span class="uIconArrow"></span>
	              </button>
	            </div>
            </form>
            <!-- 밴드 안내 문구 -->
            <% if (bOkDTO.getPublic_ok() == "Y") { %>
            <p class="bandTypeDesc">누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시물을 볼 수 있습니다.</p>
            <% } else { %>
            <p class="bandTypeDesc">밴드와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</p>
            <% } %>
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
      <!-- 내 밴드 설정 -->
      <main class="band_main">
        <section class="setting_band">
          <div class="setting_header">
            <header class="set_header">
              <h1 class="title">밴드 설정</h1>
            </header>
          </div>
          <div class="profile_view">
          	<span class="profile_inner">
            <% if (mmppDTO.getProfile() != null) { %>
            <img id="profile_inner" src="<%=mmppDTO.getProfile()%>" width="60" height="60" >
            <% } %>
            </span>
            <div class="set_body">
              <span class="name"><%=mmppDTO.getNickname() %>님의 프로필</span>
              <span class="subtxt"></span>
            </div>
            <form action="band_profile.jsp" method="post">
            	<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
            	<input type="hidden" value="<%=member_idx %>" name="member_idx">
	            <div class="etc">
	              <button type="submit" class="etc_btn">설정</button>
	            </div>
            </form>
          </div>
          <h2 class="setting_title">밴드 정보 관리</h2>
          <ul class="setting_list">
            <li class="setting_item">
              <div class="item_content">
                <span class="label">밴드 이름 및 커버</span>
                <span class="subtxt"></span>
              </div>
              <div class="item_side">
            <form action="setting_leader_band_name.jsp" method="post">
           		<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
            	<input type="hidden" value="<%=member_idx %>" name="member_idx">
                <button type="submit" class="band_update_btn">변경</button>
              </form>
              </div>
            </li>
          </ul>
          <ul class="setting_list">
            <li class="setting_item">
              <div class="item_content">
                <span class="label">밴드 공개</span>
                <span class="subtxt">비공개</span>
              </div>
              <div class="item_side">
               <form action="band_public_or_not.jsp" method="get">
	           		<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
	            	<input type="hidden" value="<%=member_idx %>" name="member_idx">
	                <button type="submit" class="band_update_btn">변경</button>
                </form>
              </div>
            </li>
          </ul>
          <ul class="setting_list">
            <li class="setting_item">
              <div class="item_content">
                <span class="label">가입 조건 설정</span>
                <span class="subtxt">성별 제한없음, 나이 제한없음</span>
              </div>
              <div class="item_side">
               <form action="band_joining_condition.jsp" method="post">
	           		<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
	            	<input type="hidden" value="<%=member_idx %>" name="member_idx">
	                <button type="submit" class="band_update_btn">변경</button>
                </form>
              </div>
            </li>
          </ul>
          <ul class="setting_list">
            <li class="setting_item">
              <div class="item_content">
                <span class="label">밴드 소개</span>
                <span class="subtxt">밴드 주소, 소개글을 관리하세요.</span>
              </div>
              <div class="item_side">
	              <form action="band_information.jsp" method="post">
		           		<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
		            	<input type="hidden" value="<%=member_idx %>" name="member_idx">
		                <button type="submit" class="band_update_btn">변경</button>
	                </form>
              </div>
            </li>
          </ul>
          <h2 class="setting_title">멤버 가입 관리</h2>
          <ul class="setting_list">
            <li class="setting_item">
              <div class="item_content">
                <span class="label">가입 신청 받기</span>
                <span class="subtxt">멤버 가입시 리더의 승인이 필요합니다.</span>
              </div>
              <%
              	for(MeetMemberSettingPrintDTO dto : mmspListDAO){
              %>
              <div class="item_side">
                <label class="check_switch">
                  <input type="checkbox" class="check_input" name="join_ok" <%=joinok(dto.getJoin_ok())%> >
                  <span class="check_label">
                    <span class="shape"></span>
                  </span>
                </label>
              </div>
             
            </li>
            <li class="setting_item -minHeightAuto">
              <div class="-flexible" style="min-height: auto; padding-top: 28px;">
                <div class="item_content">
                  <span class="label">가입 질문 하기</span>
                </div>
                <div class="item_side">
                  <label class="check_switch -switch">
                    <input type="checkbox" class="check_input" <%=joinok(dto.getSub_qok()) %>>
                  <span class="check_label">
                    <span class="shape"></span>
                  </span>
                </label>
              </div>
              </div>
              <div class="textareaBox">
                <div class="uTextarea" style="height: 76px">
                  <textArea class="_joinQuestionTextarea" id="qnaText" maxlength="100" placeholder="새로운 멤버가 밴드 가입을 신청할 때 물어볼 질문을 작성해 주세요."><%=dto.getSub_q()%></textArea>
                  <span class="border"></span>
                </div>
              </div>
            </li>
          </ul>
          <%
          	}
          %>
          <h2 class="hide_title"></h2>
          <ul class="setting_list">
            <li class="setting_item">
              <div class="item_content">
                <span class="label">밴드 탈퇴</span>
              </div>
              <div class="item_side">
                <button type="button" class="band_leave_btn">탈퇴하기</button>
              </div>
            </li>
            <li class="setting_item">
              <div class="item_content">밴드 삭제</div>
              <div class="item_side">
                <button type="button" class="delete_btn">삭제하기</button>
              </div>
            </li>
          </ul>
        </section>
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
  <!-- 밴드 삭제 : 팝업 -->
  <div class="layer_wrap" id="bandDelete_popUp" style="display: none;">
    <section class="lyWrap">
      <div class="lyContent">
        <header class="modalHeader">
          <h1 class="title">밴드 삭제</h1>
        </header>
        <div class="modalBody">
          <div class="modalContentWrap">
            <p>
              <span class="-pintColor"></span>
            </p>
            <div class="msgList">
              <p class="pText2">
                밴드를 삭제하시겠습니까?
                <br>
                삭제 후에는 복구가 불가능합니다.
              </p>
            </div>
          </div>
        </div>
        <footer class="modalFooter">
        <form action="../bandDeleteServlet" method="post">
	      <input type="hidden" name="meet_idx" value="<%=request.getParameter("meet_idx") %>"/>
	      <input type="hidden" name="member_idx" value="<%=request.getParameter("member_idx") %>"/> 
          <button type="button" class="btnCancel">아니오</button>
          <button type="submit" id="deleteBtn" class="btnLeaveBand">예</button>
        </form>
        </footer>
      </div>
    </section>
  </div>
  <!-- 밴드 탈퇴 : 팝업 -->
  <div class="layer_wrap" id="bandLeave_popUp" style="display: none;">
    <section class="lyWrap">
      <div class="lyContent">
        <header class="modalHeader">
          <h1 class="title">밴드 탈퇴</h1>
        </header>
        <div class="modalBody">
          <div class="modalContentWrap">
            <p class="pText1">
              <span class="-pointColor">밴드 탈퇴 전에 꼭 확인하세요</span>
            </p>
            <div class="msgList">
              <p class="pText2">밴드를 탈퇴하시겠습니까?</p>
            </div>
          </div>
        </div>
        <footer class="modalFooter">
        <form action="../UpdateLeaveBandServlet" method="post">
        	<input type="hidden" name="meet_idx" value="<%=request.getParameter("meet_idx")%>">
        	<input type="hidden" name="member_idx" value="<%=request.getParameter("member_idx")%>">
          <button type="button" class="btnCancel">취소</button>
          <button type="submit" id="leaveBtn" class="btnLeaveBand">탈퇴하기</button>
        </form>          
        </footer>
      </div>
    </section>
  </div>
  
  <!-- JavaScript -->
  <script>
    $(function() {
      $(".delete_btn").click(function() {
        $("#bandDelete_popUp").css('display', 'block');
      });
      $(".band_leave_btn").click(function() {
        $("#bandLeave_popUp").css('display', 'block');
      });
      $(".newChattingBtn").click(function() {
        $("#newChatWrap_popUp").css('display', 'block');
      });
      $(".btnCancel").click(function() {
        $(".layer_wrap").css('display', 'none');
      });
      $('input:checkbox[name="join_ok"]').is(":checked")==true
      
    });
    

  </script>
</body>
</html>