<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int meet_idx = (int)request.getAttribute("meet_idx");
	int member_idx = (int)request.getAttribute("member_idx");
	
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = (MeetMemberProfilePrintDTO)request.getAttribute("mMemberProfilePrintDTO");
	MeetIntroduceWriteDTO miDto = (MeetIntroduceWriteDTO)request.getAttribute("miDto");
	MeetPostListPrintDAO mPrintDAO = new MeetPostListPrintDAO();
	BandPublicOkDTO bOkDTO = (BandPublicOkDTO)request.getAttribute("bOkDTO");
	ArrayList<ChatListDTO> chatListDto = (ArrayList<ChatListDTO>)request.getAttribute("chatListDto");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='<%= request.getContextPath() %>/assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%= request.getContextPath() %>/assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%= request.getContextPath() %>/assets/css/band_header.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%= request.getContextPath() %>/assets/css/band_profile.css'>
  <title>BAND - PROFILE</title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script>
   		function uploadImg(input) {
   			if(input.files && input.files[0]) {
   				let reader = new FileReader();
   				reader.onload = function (e) {
   					$(".profileImage").attr("src", e.target.result);
   				}
   				reader.readAsDataURL(input.files[0]);
   			}
   		}
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
            <a href="<%= request.getContextPath() %>/Controller?command=band_main" class="logo">
            </a>
          </h1>
        </div>
        <!-- 위젯 -->
        <div id="header_widget_area">
          <ul class="widgetList">
            <li class="ml_14">
              <button class="btnIconStyle">
                <span class="uIconChat bg_white"></span>
              </button>
            </li>
            <!-- 프로필 출력 -->
            <li class="ml_24 positionR">
              <button class="btnMySetting">
                <span class="uProfile">
                  <span class="profileInner">
               	   <% if (mMemberProfilePrintDTO.getProfile() != null) { %>
               		<img src="<%= request.getContextPath() %>/upload/<%= mMemberProfilePrintDTO.getProfile() %>"
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
                    <a href="<%= request.getContextPath() %>/Controller?command=band_profile&meet_idx=<%=meet_idx %>" class="menuModalLink">프로필 설정</a>
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
	          <a href="<%= request.getContextPath() %>/Controller?command=band_home&meet_idx=<%= meet_idx %>">
           		  <span class="menu_item_txt" style="padding:2px;">게시글</span>
	          </a>
          </li>
          <li class="menu_item">
           	<a href="<%= request.getContextPath() %>/Controller?command=band_member_list&meet_idx=<%= meet_idx %>">	
              <span class="menu_item_txt" style="padding: 2px;">멤버</span>
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
                    	src = "<%= request.getContextPath() %>/upload/<%= miDto.getUrl() %>"
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
            <div class="bandInfoBox">
             <% try {
            	 if (mPrintDAO.adminCheck(member_idx, meet_idx)) { %>
              <a href="band_information.jsp?meet_idx=<%=meet_idx %>&member_idx=<%=member_idx %>" class="showBandInfo">밴드 소개 설정
             <% 	} 
             	} catch(Exception e) {
             		e.printStackTrace();
             	}
             	%>
                <span class="uIconArrow"></span>
              </a>
            </div>
            <!-- 밴드 안내 문구 : 공개 여부 -->
            <% if (bOkDTO.getPublic_ok().equals("Y")) { %>
            <p class="bandTypeDesc">누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시물을 볼 수 있습니다.</p>
            <% } else { %>
            <p class="bandTypeDesc">밴드와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</p>
            <% } %>
            <!-- 밴드 설정 -->
            <div class="bandSetting">
              <a href="#" onClick="history.back()" class="bandSetting_Link">
                <span class="uIconSetting"></span>
                밴드 설정
              </a>
            </div>
          </div>
        </div>
      </aside>
      <!-- 프로필 설정 -->
      <main id="content" role="main" class="midContent">
        <div class="settingBand">
         <form action="<%= request.getContextPath() %>/UpdateProfileServlet" method="post" enctype="multipart/form-data">
          <input type="hidden" name="meet_idx" value="<%=meet_idx %>">
          <input type="hidden" name="member_idx" value="<%=member_idx %>">
          <div class="headerWrap">
            <header class="profile_header">
              <h1 class="h1ProfileTitle"> 프로필 설정 </h1>
            </header>
          </div>
          <div class="profileSettingCardBox">
            <div class="profileSettingCard">
              <div class="imgBox _defaultProfileImgBox"></div>
              <div class="imgBox _existProfileImgBox" <%=(mMemberProfilePrintDTO.getProfile()==null ? "style='display:none;'" : "") %>>
              	<img class="profileImage" alt="프로필 사진" src="<%= request.getContextPath() %>/upload/<%=mMemberProfilePrintDTO.getProfile()%>">
              </div>
              <span class="addPhoto _btnProfile">
                <label for="addPhoto" class="_labelProfile">프로필 사진 추가</label>
                <input id="addPhoto" type="file" accept="image/*" name="profile" class="inputFile" onchange="uploadImg(this)">
                <img class="profileImg">
             </span>
            </div>
          </div>
          <ul class="settingList">
            <li class="settingItem">
              <div class="settingItemMyInfo" style="min-height: auto; padding-top: 28px;">
                <div class="itemContent">
                  <label for="selfIntroduction" class="label"></label>
                  <span class="subTxt3"></span>
                </div>
              </div>
              <div class="textareaBox">
                <div class="introductionBox" style="min-height: auto; height: 40px;">
                <%if (mMemberProfilePrintDTO.getNickname() != null) {%>
                  <input type="text" id="selfIntroduction" name="nickname" maxlength="50" placeholder="닉네임입력" class="_descriptionInput" value="<%=mMemberProfilePrintDTO.getNickname()%>">
                  <% } else {%>
                  <input type="text" id="selfIntroduction" name="nickname" maxlength="50" placeholder="닉네임입력" class="_descriptionInput">
                  <% } %>
                </div>
              </div>
            </li>
          </ul>
          <div class="btnFooter">
            <button type="button" onClick="history.back()" class="btnCancel">취소</button>
            <button type="submit" class="btnSave">저장</button>
          </div>
          </form>
        </div>
      </main>
       <!-- 메인 내용 오른쪽 채팅방 목록 : 가입했을 시 출력 -->
      <div id="banner">
        <div id="bannerInner">
          <div class="chatSticky">
            <section class="bandChannerView">
              <h2 class="tit">채팅</h2>
              <div class="chat_setting_wrap">
                <!-- <button class="chat_setting_btn">설정</button> -->
              </div>
              <div class="body" style="max-height: none;">
                <div class="new_chatting_wrap">
                  <div class="buttonBox">
                    <button class="newChattingBtn">
                      <span class="iconPlusSquare"></span>
                      새 채팅
                    </button>
                  </div>
                </div>
                <!-- 채팅 목록 -->
                <div class="nano" style="max-height: none;">
                  <div class="nano_content">
                    <ul class="chat">
                    <% for (ChatListDTO cDto2 : chatListDto) { %>
                      <li>
                        <button class="itemLink" onclick="window.open('<%= request.getContextPath() %>/Controller?command=band_chat&chat_idx=' + <%= cDto2.getChat_idx()  %> + '&meet_idx=' + <%= meet_idx %>, '', 'width=415, height=643')">
                          <span class="thum">
                            <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240603162344/images/template/multi_profile_60x60.png"
                            height="30" width="30">
                          </span>
                          <span class="cont">
                            <strong class="text"><%= cDto2.getTitle() %></strong>
                            <% if (cDto2.getContent() != null) { %>
                            <span class="sub"><%= cDto2.getContent() %></span>
                            <% } else { %>
                            <span class="sub">채팅을 시작해보세요.</span>
                            <% } %>
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
    <!-- 팝업 : 글쓰기 -->
    <form action="${pageContext.request.contextPath}/PostWriteServlet" method="post" enctype="multipart/form-data">
    <div class="layerContainerView" tabindex="-1" id="postWriteEditor_popUp" style="display: none;">
      <div class="layerContainerInnerView">
        <div class="postEditorLayerView" style="position: relative;">
          <section class="lyWrap">
           <input type="hidden" name="meet_idx" value="<%=meet_idx %>">
            <div class="lyPostShareWrite" style="margin-top: 77px;">
              <header class="header">
                <h1 class="title">글쓰기</h1>
              </header>
              <div class="main">
                <div class="postWrite">
                  <div class="postWriteForm">
                    <textarea class="contentEditor cke_editable" name="content"></textarea>
                  </div>
                  <div class="buttonArea">
                    <ul class="toolbarList" style="justify-content: space-between;">
                      <li class="toolbarListItem">
                        <label class="photo" for="postInputFile">
                          <input type="file" accept="image/*" id="postInputFile" onchange="uploadImg(this)" name="file_url">
                          <span class="photoIcon"></span>
                        </label>
                      </li>
                      <li class="toolbarListItem" >
                        <img class="postImg" style="width:70px; height: 70px; margin-bottom:10px;" src="https://i.ibb.co/N1V2tXT/image.png">
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
                <button type="button" class="btnLyClose"></button>
              </footer>
            </div>
          </section>
        </div>
      </div>
    </div>
   </form>
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
   </div>
<!-- JavaScript -->
  <script>
    // 팝업 닫기
    $(function(){
   	  $("#postWriteBtn").click(function() {
        $("#postWriteEditor_popUp").css('display', 'block');
        let a = $(".contentEditor.cke_editable").val();
      })
      //글쓰기 버튼 팝업
      $(".newChattingBtn").click(function() {
        $("#newChatWrap_popUp").css('display', 'block');
      }) 
      
      $(".btnLyClose").click(function() {
        $(".layerContainerView").css('display', 'none');
      })
      // 오른쪽 상단 채팅 버튼 팝업
      $(".btnIconStyle").click(function(){
	    $("#newChatWrap_popUp").css('display', 'block');
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
    });
  </script>
</body>
</html>