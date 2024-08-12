<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 밴드 소개글, 지역 업데이트
	UpdateMeetInfoWriteDAO umiwDAO = new UpdateMeetInfoWriteDAO();
	
	// 밴드 가입 여부
	NoJoinMeetDAO njDao = new NoJoinMeetDAO();
	
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = (MeetMemberProfilePrintDTO)request.getAttribute("mMemberProfilePrintDTO");
	
	int meet_idx = (int)request.getAttribute("meet_idx");
	int member_idx = (int)request.getAttribute("member_idx");
	MeetIntroduceWriteDTO miDto = (MeetIntroduceWriteDTO)request.getAttribute("miDto");
	MeetPostListPrintDAO mPrintDAO = new MeetPostListPrintDAO();
	BandPublicOkDTO bOkDTO = (BandPublicOkDTO)request.getAttribute("bOkDTO");
	ArrayList<MeetInfoWriteDTO> areaListDTO = (ArrayList<MeetInfoWriteDTO>)request.getAttribute("areaListDTO");
	MeetInfoWriteDTO miwDTO = (MeetInfoWriteDTO)request.getAttribute("miwDTO");
	MeetInfoWriteDAO miwDAO = new MeetInfoWriteDAO();
	ArrayList<ChatListDTO> chatListDto = (ArrayList<ChatListDTO>)request.getAttribute("chatListDto");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band_header.css'>
  <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/myband_setting.css">
  <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/band_information.css">
  <title>BAND - Information - Setting</title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script>
 
 	 	$(function() {
 	 	// 밴드 소개글, 지역 설정	
  		$(".btnConfirm").click(function() {
  			let title = $("#bandIntroduce").val();
  			let meet_idx = <%=meet_idx%>;
  			let meet_area_idx = $("#area_detailSelect option:selected").val();
  			
  			$.ajax({
				url: '${pageContext.request.contextPath}/AjaxUpdateBandIntroductionServlet',
				data: {meet_idx : meet_idx, title : title, meet_area_idx : meet_area_idx},
				type: 'get',
				success: function(response){
					alert("저장되었습니다.");
					location.href = "${pageContext.request.contextPath}/Controller?command=band_setting&meet_idx=" + <%=meet_idx%>;
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
            <a href="<%=request.getContextPath()%>/Controller?command=band_main" class="logo">
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
           <!-- 가입했을 시 프로필 출력 -->
            <li class="ml_24 positionR">
           <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
              <button class="btnMySetting">
                <span class="uProfile">
                  <span class="profileInner">
               	   <% if (mMemberProfilePrintDTO.getProfile() != null) { %>
               		<img src="<%=request.getContextPath()%>/upload/<%= mMemberProfilePrintDTO.getProfile() %>"
                    width="30" height="30">
                    <% } else { %>
                   <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240528100621/images/template/profile_60x60.png"
                   width="30" height="30">
                  	<% } %>
                  </span>
                </span>
              </button>
            <% } else { %>
            <button class="btnMySetting">
                <span class="uProfile">
                  <span class="profileInner">
                   <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240528100621/images/template/profile_60x60.png"
                   width="30" height="30">
                  </span>
                </span>
              </button>
              <% } %>
              <!-- 프로필 클릭 시 드롭다운 -->
              <div class="menuModalLayer profileDropDown" id="off" style="display: none">
                <ul class="menuModalList">
                <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
                  <li class="menuMadalItem">
                    <a href="<%= request.getContextPath() %>/Controller?command=band_profile&meet_idx=<%=meet_idx %>" class="menuModalLink">프로필 설정</a>
                  </li>
                <% } %>
                  <li class="menuMadalItem">
                    <button onclick="if(confirm('로그아웃 하시겠습니까?')) { window.location.href='/Tcp2/Controller?command=logout'; } return false;" class="menuModalLink">로그아웃</button>
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
      <!-- header lnb 메뉴 : 가입했을 시 출력 -->
      <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
      <div class="header_lnb bg_blue">
        <ul class="header_lnb_menu">
          <li class="menu_item">
	          <a href="<%= request.getContextPath() %>/Controller?command=band_home&meet_idx=<%= meet_idx %>">
           		  <span class="menu_item_txt active">게시글</span>
	          </a>
          </li>
          <li class="menu_item">
           	<a href="<%= request.getContextPath() %>/Controller?command=band_member_list&meet_idx=<%= meet_idx %>">	
              <span class="menu_item_txt" style="padding:2px;">멤버</span>
  	        </a>
          </li>
        </ul>
      </div>
      <% } %>
      <!-- 메인 내용 왼쪽 밴드 소개 -->
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
                    	src = "<%=request.getContextPath()%>/upload/<%= miDto.getUrl() %>"
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
            <!-- 글쓰기 버튼 : 가입했을 시 출력 -->
            <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
            <div class="btnBox">
              <button class="uButton bg_blue" id="postWriteBtn">글쓰기</button>
            </div>
            <% } else { %>
            <!-- 가입하기 버튼 -->
            <div class="btnBox">
              <button type="submit" class="uButton" id="joinBtn">밴드 가입하기</button>
            </div>
            <% } %>
            <!-- 밴드 소개 설정 : 리더일 시 출력 -->
            <div class="bandInfoBox">
             <% try {
            	 if (mPrintDAO.adminCheck(member_idx, meet_idx)) { %>
              <button class="showBandInfo" onclick="location.href='<%= request.getContextPath() %>/Controller?command=band_information&meet_idx=<%= meet_idx %>'">밴드 소개 설정
             <% 	} 
             	} catch(Exception e) {
             		e.printStackTrace();
             	}
             	%>
                <span class="uIconArrow"></span>
              </button>
            </div>
            <!-- 밴드 안내 문구 : 공개 여부 -->
            <% if (bOkDTO.getPublic_ok().equals("Y")) { %>
            <p class="bandTypeDesc">누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시물을 볼 수 있습니다.</p>
            <% } else { %>
            <p class="bandTypeDesc">밴드와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</p>
            <% } %>
            <!-- 밴드 설정 : 가입헀을 시 출력 -->
            <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
            <div class="bandSetting">
              	<button onclick="location.href='<%= request.getContextPath() %>/Controller?command=band_setting&meet_idx=<%= meet_idx %>'" class="bandSetting_Link">
	                <span class="uIconSetting"></span>
	                밴드 설정
                </button>
            </div>
            <% } %>
          </div>
        </div>
      </aside>
      <!-- 밴드 가입 조건 설정 -->
      <main class="main_content">
        <div class="bandIntroView">
          <div class="headerWrap">
            <header class="contentHeader">
              <h1 class="h1_title">밴드 소개</h1>
            </header>
          </div>
            <div class="bandIntroWrapper">
              <!-- 주제 선택 -->
              <div class="_selectedKeyword"></div>
              <!-- 소개글 입력 -->
              <div class="textareaBox _introDescription">
                <div class="uTextarea">
                  <textarea class="_introDescription" id="bandIntroduce" cols="30" rows="10" maxlength="500" placeholder="밴드 소개말을 입력하세요." style="height: 100%" value="<%=miwDTO.getTitle() %>"><%=miwDTO.getTitle() %></textarea>
                  <span class="border"></span>
                </div>
              </div>
              <!-- 위치 등록 -->
              <div class="_locationText" style="display:flex;">
                <div class="introOptionBox">
                  <div class="addressText">
                  	<select id="areaSelect">
                  		<% for(MeetInfoWriteDTO areaDto : areaListDTO) { %>                  		
                  		<option value="<%=areaDto.getName()%>" idx="<%=areaDto.getArea_idx()%>"><%=areaDto.getName() %></option>
                  		<% } %>
                  	</select>
                  	<select id="area_detailSelect">
                  		<% areaListDTO = miwDAO.meetInfoAreaListDTO();
                  		for(MeetInfoWriteDTO adDto : areaListDTO) { %>
                  		<option value="<%=adDto.getMeet_area_idx() %>" id="<%=adDto.getMeet_area_idx() %>" idx="<%=adDto.getArea_idx()%>"><%=adDto.getArea_detail() %></option>
                  		<% } %>
                  	</select>
                  </div>
                </div>
              </div>
              <!-- 저장 버튼 -->
              <div class="introOption">
                <div class="introOptionBox2">
	                <button type="button" class="btnConfirm" id="areaBtn">변경</button>
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
     <% } %>
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
      // 지역 selectbox
      $("#areaSelect").val("<%=miwDTO.getName() %>").prop("selected", true);
 	  $("#area_detailSelect").val("<%=miwDTO.getMeet_area_idx()%>").prop("selected", true);
 	  
 	  $("#areaSelect").change(function () {
		let a = $("#areaSelect>option:selected").attr("idx");
		
		$("#area_detailSelect > option").hide();
		
		$("#area_detailSelect > option").each(function() {
	        if ($(this).attr("idx") == a) {
	            $(this).show();
	        }
	    });
	})
  });
  </script>
</body>
</html>