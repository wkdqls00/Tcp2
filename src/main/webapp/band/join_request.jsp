<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	HttpSession hs = request.getSession();
	int member_idx = (int)hs.getAttribute("userIdx");
	
	int meet_idx = 0;
	if(request.getParameter("meet_idx")==null) {
		meet_idx = (Integer)request.getAttribute("meet_idx");
	} else {
		meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	}
	//리더 출력
	MeetPostListPrintDAO mPrintDAO = new MeetPostListPrintDAO();
	//내 프로필 출력
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = (MeetMemberProfilePrintDTO)request.getAttribute("mMemberProfilePrintDTO");
	//밴드 왼쪽 소개
	MeetIntroduceWriteDTO miDto = (MeetIntroduceWriteDTO)request.getAttribute("miDto");
	// 밴드 공개
	BandPublicOkDTO bOkDTO = (BandPublicOkDTO)request.getAttribute("bOkDTO");
	// 밴드 가입 질문
	MeetJoinQuestionWriteDTO mjqwDTO = (MeetJoinQuestionWriteDTO)request.getAttribute("mjqwDTO");
	// 밴드 가입 여부
	NoJoinMeetDAO njDao = new NoJoinMeetDAO();
	
	UpdateBandDAO updateDAO = new UpdateBandDAO();
	// 가입 신청자 출력
	MeetMemberListPrintDAO joinWaitDAO = new MeetMemberListPrintDAO();
	ArrayList<MeetMemberListPrintDTO> jwListDto = new ArrayList<>();	
	try {
		jwListDto = joinWaitDAO.selectJoinWaitMemberList(meet_idx);
	} catch (Exception e) {
		e.printStackTrace();
	}
	ArrayList<ChatListDTO> chatListDto = (ArrayList<ChatListDTO>)request.getAttribute("chatListDto");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band_header.css'>
  <title>BAND - 멤버 목록</title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script>
  	$(function() {
  		//수락하기
  		$(".acceptBtn").click(function() {
  			let meet_idx = <%= meet_idx%>;
  			let member_idx = $(this).closest(".requestJoinMemberItem").attr("id");
  			let join_count = $(".requestJoinMemberList").children().length;
  			$.ajax({
  				url: '${pageContext.request.contextPath}/AjaxJoinAcceptServlet',
  				data: {member_idx : member_idx, meet_idx : meet_idx},
  				type: 'get',
  				success: function(response){
  					$("#" + member_idx).remove();
  					alert("수락되었습니다.");
  					$(".joinCount").html(join_count-1);
  				}
  			});
  		});
  	});
  	//거절하기
  	$(function(){
  		$(".refuseBtn").click(function() {
	 		let meet_idx = <%=meet_idx%>;
	  		let member_idx = $(this).closest(".requestJoinMemberItem").attr("id");
			let join_count = $(".requestJoinMemberList").children().length;
	  		$.ajax({
	  			url: '${pageContext.request.contextPath}/AjaxJoinDeleteServlet',
	  			data: {member_idx : member_idx, meet_idx : meet_idx},
	  			type: 'get',
	  			success: function(response) {
	  				$("#" + member_idx).remove();
	  				alert("삭제되었습니다.");
	  				$(".joinCount").html(join_count-1);
	  				
	  			}	
		  	});
  		});
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
            <a href="band_main.jsp?meet_idx=<%=meet_idx %>&member_idx=<%=member_idx %>" class="logo">
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
                    <a href="<%=request.getContextPath()%>/Controller?command=band_profile&meet_idx=<%=meet_idx %>&member_idx=<%=member_idx %>" class="menuModalLink">프로필 설정</a>
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
             <form action="<%=request.getContextPath()%>/Controller?command=band_home" method="post">
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
           <form action="<%=request.getContextPath()%>/Controller?command=band_member_list" method="post">
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
              <a href="<%=request.getContextPath()%>/Controller?command=band_information&meet_idx=<%=meet_idx %>&member_idx=<%=member_idx %>" class="member_count">멤버 <%=miDto.getMeet_member_count() %></a>
            </p>
            <!-- 글쓰기 버튼 -->
            <div class="btnBox">
              <button class="uButton bg_blue" id="postWriteBtn">글쓰기</button>
            </div>
             <!-- 밴드 소개 설정 : 리더일 시 출력 -->
            <div class="bandInfoBox">
             <% try {
            	 if (mPrintDAO.adminCheck(member_idx, meet_idx)) { %>
              <a href="<%=request.getContextPath()%>/Controller?command=band_information&meet_idx=<%=meet_idx %>" class="showBandInfo">밴드 소개 설정
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
            	<form action="<%=request.getContextPath()%>/Controller?command=band_setting" method="post">
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
      <!-- 가입 신청 목록 -->
      <main class="mainContent">
      	<section class="requestJoinSection">
      		<div class="headerWrap">
      			<header class="joinHeader">
      				<h1 class="joinTitle">가입 신청자
      					<em class="joinCount" id="<%=mjqwDTO.getJoin_wait_count() %>"><%=mjqwDTO.getJoin_wait_count() %></em>
      				</h1>
      			</header>
      		</div>
      		<% if(joinWaitDAO.joinWait(meet_idx)) { %>
      		<div class="requestJoinMember">
      			<ul class="requestJoinMemberList">
      			<% for(MeetMemberListPrintDTO dto : jwListDto) {%>
      				<li class="requestJoinMemberItem" id="<%=dto.getMember_idx()%>">
      					<div class="flexItem">
      						<a href="#" role="button" class="joinProfile">
      							<span class="joinProfileInner">
<!--       								<img width="40" height="40" class="requestJoinProfile"> -->
      							</span>
      						</a>
      						<span class="joinBody">
      							<span class="textFlex">
      								<span class="ellipsis"><%=dto.getNickname() %></span>
      							</span>
      							<span class="requestJoinInfo">
<!--       								<span class="ellipsisDate">2024년 7월 11일 신청</span> -->
      							</span>
      						</span>
      						<span class="joinEtc">
      							<button type="button" class="acceptBtn">수락</button>
      							<button type="button" class="refuseBtn">거절</button>
      						</span>
      					</div>
      					<dl class="qna">
      						<dt class="questionText"><%=dto.getSub_q() %></dt>
      						<dd class="answerText"><%=dto.getSub_a() %></dd>
      					</dl>
      					<div class="buttonBox"></div>
      				</li>
   					<% } %>
      			</ul>
      		</div>
      		<% } %>
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
    <!-- 팝업 : 가입신청 프로필 버튼 클릭 -->
    <div class="layerContainerView" id="joinRequestWrap_popUp" style="display: none;">
    	<section class="lyWrap">
	    	<button type="button" aria-hidden="true" class="layerFirstElement" style="position: fixed;
	    	left: 0; top: 0; width: 1px; height: 1px; overflow:hidden; background: transparent; color: transparent">layer focus check First element</button>
    		<div class="originalProfile">
<!--     			<header> -->
<!--     				<h1>프로필 사진 확대 보기</h1> -->
<!--     			</header> -->
    			<div class="mainProfile">
    				<img src="<%=mMemberProfilePrintDTO.getProfile() %>"class="originalProfileImg">
    			</div>
    			<footer class="closeBtn">
    				<button type="button" class="btnLyClose">레이어닫기</button>
    			</footer>
    		</div>
    	</section>
    	<button type="button" aria-hidden="true" class="layerLastElement" style="position: fixed;
    	left: 0; top: 0; width: 1px; height: 1px; overflow:hidden; background: transparent; color: transparent">layer focus check last element</button>
    </div>
  </div>
  <script>
  
  $(function(){
    //글쓰기 버튼 팝업
 	$("#postWriteBtn").click(function() {
 		$("#postWriteEditor_popUp").css('display', 'block');
    })
    //채팅 팝업
    $(".newChattingBtn").click(function() {
    	$("#newChatWrap_popUp").css('display', 'block');
    }) 
	  // 팝업 닫기
    $(".btnLyClose").click(function() {
    	$(".layerContainerView").css('display', 'none');
    })
    // 오른쪽 상단 채팅 버튼 팝업
    $(".btnIconStyle").click(function(){
    	$("#newChatWrap_popUp").css('display', 'block');
	})
	// 가입신청 프로필 클릭하면 사진 크게 보기
	$(".joinProfile").click(function(){
		$("#joinRequestWrap_popUp").css('display', 'block');
	})
	//
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