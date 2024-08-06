<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
     public String gender(String gender) {
    	String result = "";
    	if (gender != null) {
	    	if(gender.equals("M")){
	    		result = "남자";
	    	} else if (gender.equals("F")){
	    		result = "여자";
	    	} 
    	} else {
    		result = "제한없음";
    	}
    	return result;
    }
    %>
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
	HttpSession hs = request.getSession();
	int member_idx = (int)hs.getAttribute("userIdx");
	
	int meet_idx = 0;
	if(request.getParameter("meet_idx")==null) {
		meet_idx = (Integer)request.getAttribute("meet_idx");
	} else {
		meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	}

	MeetMemberSettingPrintDAO mmspDAO = new MeetMemberSettingPrintDAO();
	ArrayList<MeetMemberSettingPrintDTO> mmspListDAO = new ArrayList<>();
	
	try {
		mmspListDAO = mmspDAO.selectMeetMemberSettingPrintDTO(meet_idx);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<%
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
	
	// 채팅 목록 출력
	ChatListDAO cDao = new ChatListDAO();
	ArrayList<ChatListDTO> chatListDto = new ArrayList<>();
	
	chatListDto = cDao.selectChatListDTO(meet_idx);
	
	JoinConditionPrintDAO jcpDAO = new JoinConditionPrintDAO();
	JoinConditionPrintDTO jcpListDAO = jcpDAO.selectJoinConditionPrintDTO(meet_idx);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band_header.css'>
  <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/myband_setting.css">
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band_leave_popup.css'>
  <title>BAND - <%= miDto.getMeet_name() %> - Setting - Leader</title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script>
  // 가입 신청 받기 라디오 버튼 
  	$(function() {
  		$(".join_ok_input").click(function(){
  			let meet_idx = <%=meet_idx%>;
			let join_ok = $(this).attr("id");
			if(join_ok == 'Y'){
	  			$.ajax({
	  				url: '${pageContext.request.contextPath}/AjaxUpdateJoinApplyServlet',
	  				data: {meet_idx : meet_idx, join_ok : 'N' },
	  				type: 'get',
	  				success: function(response) {
	  					location.reload();
	  				}
  				})
			} else if(join_ok == 'N'){
				$.ajax({
	  				url: '${pageContext.request.contextPath}/AjaxUpdateJoinApplyServlet',
	  				data: {meet_idx : meet_idx, join_ok : 'Y'},
	  				type: 'get',
	  				success: function(response) {
	  					location.reload();
	  				}
  				})
			}
  		})
  	});
  // 가입 질문 받기 버튼
  $(function (){
	  $(".sub_qok").click(function() {
		  let meet_idx = <%= meet_idx %>
		  let sub_qok = $(this).attr("id");
		  if(sub_qok =='Y') {
			  $.ajax({
	  				url: '${pageContext.request.contextPath}/AjaxUpdateJoinQServlet',
	  				data: {meet_idx : meet_idx, sub_qok : 'N'},
	  				type: 'get',
	  				success: function(response) {
	  					location.reload();
	  				}
				})
		  }else if(sub_qok == 'N') {
			  $.ajax({
	  				url: '${pageContext.request.contextPath}/AjaxUpdateJoinQServlet',
	  				data: {meet_idx : meet_idx, sub_qok : 'Y'},
	  				type: 'get',
	  				success: function(response) {
	  					location.reload();
	  				}
				})
		  }
	  })
	  // 가입 질문하기 textarea 변경 버튼
	  $("#subQBtn").click(function() {
		  let meet_idx = <%=meet_idx%>;
		  let sub_q = $("#qnaText").val();
		  $.ajax({
				url: '${pageContext.request.contextPath}/AjaxUpdateJoinQuestionServlet',
				data: {meet_idx : meet_idx, sub_q : sub_q},
				type: 'get',
				success: function(response){
					alert("저장되었습니다.");
					location.reload();
				},
				error: function(){
					console.log('ajax 통신 실패');	
				}
			});
	  })
  });
  </script>
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
            <a href="band_main.jsp?member_idx=<%=member_idx %>" class="logo">
            </a>
          </h1>
        </div>
        <!-- 위젯 -->
        <div id="header_widget_area">
          <ul class="widgetList">
            <!-- 프로필 출력 -->
            <li class="ml_24 positionR">
              <button class="btnMySetting">
                <span class="uProfile">
                  <span class="profileInner">
               	   <% if (mMemberProfilePrintDTO.getProfile() != null) { %>
               		<img src="../upload/<%= mMemberProfilePrintDTO.getProfile() %>"
                    width="30" height="30">
                    <% } else { %>
                   <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240528100621/images/template/profile_60x60.png"
                   width="30" height="30">
                  	<% } %>
                  </span>
                </span>
              </button>
              <!-- 프로필 클릭 시 드롭다운 -->
              <div class="menuModalLayer profileDropDown" id="off" style="display: none">
                <ul class="menuModalList">
                  <li class="menuMadalItem">
                    <a href="band_profile.jsp?meet_idx=<%=meet_idx %>&member_idx=<%=member_idx %>" class="menuModalLink">프로필 설정</a>
                  </li>
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
                <div class="cover_img">
                  <span class="cover_inner">
                  <img
                    <% if (miDto.getUrl() != null) {%>
                    	src = "../upload/<%= miDto.getUrl() %>"
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
              <a class="member_count">멤버 <%= miDto.getMeet_member_count() %></a>
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
            <% if (bOkDTO.getPublic_ok().equals("Y")) { %>
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
            <img id="profile_inner" src="../upload/<%=mmppDTO.getProfile()%>" width="60" height="60" >
            <% } %>
            </span>
            <div class="set_body">
            <%if(mmppDTO.getNickname() == null){ %>
              <span class="name"><%=mmppDTO.getmNickname()%>님의 프로필</span>
              <% }else {%>
              <span class="name"><%=mmppDTO.getNickname()%>님의 프로필</span>
              <% } %>
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
          <%try {
        	  if (mPrintDAO.adminCheck(member_idx, meet_idx)) {%>
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
                <% if (bOkDTO.getPublic_ok().equals("Y")) { %>
                <span class="subtxt">공개</span>
                <% } else { %>
                <span class="subtxt">비공개</span>
                <% } %>
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
                <span class="subtxt">성별 <%= gender(jcpListDAO.getGender())%>, 나이 <% if(jcpListDAO.getAge() != 0){ %><%=jcpListDAO.getAge() %> 년생</span><%} %>
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
                  <input type="checkbox" class="check_input join_ok_input" id="<%=dto.getJoin_ok()%>" name="join_ok" <%=joinok(dto.getJoin_ok())%> >
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
                    <input type="checkbox" class="check_input sub_qok" id="<%=dto.getSub_qok() %>" <%=joinok(dto.getSub_qok()) %> id="join_ok_checkBox">
                  <span class="check_label">
                    <span class="shape"></span>
                  </span>
                </label>
              </div>
              </div>
              <div class="textareaBox">
              <!-- 가입질문 여부에 따라 textarea 출력 / 미출력 -->
              <% // if (dto.getSub_qok().equals("Y")) { %>
                <div class="uTextarea" style="height: 76px" id="join_ok_area">
                  <textArea class="_joinQuestionTextarea" 
                  id="qnaText" maxlength="100" 
                  placeholder="새로운 멤버가 밴드 가입을 신청할 때 물어볼 질문을 작성해 주세요."><% if (dto.getSub_q() != null) { %><%=dto.getSub_q()%><% } %></textArea>
                  <span class="border"></span>
                </div>
                <button type="button" id="subQBtn" class="band_update_btn" style="float: right; margin-top: 12px;
                ">변경</button>
              <% } %>
              </div>
            </li>
          </ul>
          <%
           }
          }	catch(Exception e) {
        		  e.printStackTrace();
        	  }
          %>
          <h2 class="hide_title"></h2>
          <ul class="setting_list">
            <% if(mPrintDAO.adminCheck(member_idx, meet_idx)) { %>
            <li class="setting_item">
              <div class="item_content">밴드 삭제</div>
              <div class="item_side">
                <button type="button" class="delete_btn">삭제하기</button>
              </div>
            </li>
            <% } %>
            <li class="setting_item">
              <div class="item_content">
                <span class="label">밴드 탈퇴</span>
              </div>
              <div class="item_side">
                <button type="button" class="band_leave_btn">탈퇴하기</button>
              </div>
            </li>
          </ul>
        </section>
      </main>
      <!-- 메인 내용 오른쪽 채팅방 목록 : 가입했을 시 출력 -->
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
  <!-- 팝업 : 글쓰기 -->
    <div class="layerContainerView" tabindex="-1" id="postWriteEditor_popUp" style="display: none;">
      <div class="layerContainerInnerView">
        <div class="postEditorLayerView" style="position: relative;">
          <section class="lyWrap">
            <div class="lyPostShareWrite" style="margin-top: 77px;">
              <header class="header">
                <h1 class="title">글쓰기</h1>
              </header>
              <div class="main">
                <div class="postWrite">
                  <div class="postWriteForm">
                    <textarea class="contentEditor cke_editable"></textarea>
                  </div>
                  <div class="buttonArea">
                    <ul class="toolbarList">
                      <li class="toolbarListItem">
                        <label class="photo">
                          <input type="file">
                          <span class="photoIcon"></span>
                        </label>
                      </li>
                    </ul>
                    <div class="writeSubmitBox">
                      <div class="buttonSubmit">
                        <button type="submit" class="uButton">게시</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <footer class="footer">
                <button class="btnLyClose"></button>
              </footer>
            </div>
          </section>
        </div>
      </div>
    </div>
    <!-- 팝업 : 새 채팅 -->
    <div class="layerContainerView" id="newChatWrap_popUp" style="display: none;">
      <div class="layerContainerInnerView">
        <section class="lyWrap">
          <div class="lyContent -w400">
            <header class="header">
              <h1 class="title">공개채팅방 만들기</h1>
            </header>
            <div class="main -tSpaceNone">
              <label for="chatName" class="title -sub2" style="margin-top: 20px">
                채팅방 이름
              </label>
              <div class="uInput" style="height: 36px; padding: 0 10px; margin-bottom: 20px;">
                <input type="text" placeholder="채팅방 이름을 입력해주세요.">
                <span class="border"></span>
              </div>
            </div>
            <footer class="footer">
              <button class="uButton -confirm -sizeL">완료</button>
              <button class="btnLyClose"></button>
            </footer>
          </div>
        </section>
      </div>
    </div>
  <!-- JavaScript -->
  <script>
    $(function() {
      // 삭제 팝업
      $(".delete_btn").click(function() {
        $("#bandDelete_popUp").css('display', 'block');
      })
      
      // 탈퇴 팝업
      $(".band_leave_btn").click(function() {
        $("#bandLeave_popUp").css('display', 'block');
      })
      $('input:checkbox[name="join_ok"]').is(":checked")==true
      
       //글쓰기 버튼 팝업
      $("#postWriteBtn").click(function() {
         $("#postWriteEditor_popUp").css('display', 'block');
       })
       
       // 채팅 팝업
       $(".btnIconStyle").click(function() {
         $("#newChatWrap_popUp").css('display', 'block');
       }) 
       $(".newChattingBtn").click(function() {
         $("#newChatWrap_popUp").css('display', 'block');
       }) 
       
       // 팝업 닫기
      $(".btnCancel").click(function() {
        $(".layer_wrap").css('display', 'none');
      })
       $(".btnLyClose").click(function() {
         $(".layerContainerView").css('display', 'none');
       })
       
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
      
      // 가입질문 체크 시 textarea 출력
      $("#join_ok_checkBox").change(function() {
		if($("#join_ok_checkBox").is(":checked")) {
			$("#join_ok_area").css('display', 'block');
		} else {
			$("#join_ok_area").css('display', 'none');
		}
	  })	
    });
    

  </script>
</body>
</html>