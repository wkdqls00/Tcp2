<%@page import="dto.BandPublicOkDTO"%>
<%@page import="dao.BandPublicOkDAO"%>
<%@page import="dto.ChatListDTO"%>
<%@page import="dao.ChatListDAO"%>
<%@page import="dto.MeetWriteViewDTO"%>
<%@page import="dao.MeetWriteViewDAO"%>
<%@page import="dao.NoJoinMeetDAO"%>
<%@page import="dto.MeetCommentElapsedTimeDTO"%>
<%@page import="dao.MeetCommentElapsedTimeDAO"%>
<%@page import="dto.MeetMemberProfilePrintDTO"%>
<%@page import="dao.MeetMemberProfilePrintDAO"%>
<%@page import="dto.LikeCountDTO"%>
<%@page import="dao.LikeCountDAO"%>
<%@page import="dto.CommentListViewDTO"%>
<%@page import="dao.CommentListViewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.MeetPostListPrintDTO"%>
<%@page import="dao.MeetPostListPrintDAO"%>
<%@page import="dto.MeetJoinQnAPrintDTO"%>
<%@page import="dao.MeetJoinQnAPrintDAO"%>
<%@page import="dto.MeetInfoWriteDTO"%>
<%@page import="dao.MeetInfoWriteDAO"%>
<%@page import="dto.MeetIntroduceWriteDTO"%>
<%@page import="dao.MeetIntroduceWriteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));
	
	// 내 프로필 출력
	MeetMemberProfilePrintDAO mMemberProfilePrintDAO = new MeetMemberProfilePrintDAO();
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = mMemberProfilePrintDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);

	// 밴드 소개
	MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
	MeetIntroduceWriteDTO miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
	
	// 밴드 소개글
	MeetInfoWriteDAO mDao = new MeetInfoWriteDAO();
	MeetInfoWriteDTO mDto = mDao.selectMeetInfoWriteDTO(meet_idx);
	
	// 밴드 가입질문
	MeetJoinQnAPrintDAO mAPrintDAO = new MeetJoinQnAPrintDAO();
	MeetJoinQnAPrintDTO mAPrintDTO = mAPrintDAO.selectMeetJoinQnAPrintDTO(meet_idx);
	
	// 밴드 글 목록 출력
	MeetPostListPrintDAO mPrintDAO = new MeetPostListPrintDAO();
	ArrayList<MeetPostListPrintDTO> mPrintListDTO = new ArrayList<>();
	
	mPrintListDTO = mPrintDAO.selectMeetPostListPrintDTO(meet_idx);
	
	// 댓글 목록 출력
	CommentListViewDAO clViewDAO = new CommentListViewDAO();
	ArrayList<CommentListViewDTO> clListDTO = new ArrayList<>();
	
	// 밴드 글 좋아요 갯수
	LikeCountDAO lCountDAO = new LikeCountDAO();
	
	// 댓글 작성 시간 출력 (~시간, ~분, ~일 전)
	MeetCommentElapsedTimeDAO mCDao = new MeetCommentElapsedTimeDAO();
	
	// 밴드 가입 여부
	NoJoinMeetDAO njDao = new NoJoinMeetDAO();
	
	// 팝업 : 글 디테일 뷰
	MeetWriteViewDAO mwDao = new MeetWriteViewDAO();
	
	// 채팅 목록 출력
	ChatListDAO cDao = new ChatListDAO();
	ArrayList<ChatListDTO> chatListDto = new ArrayList<>();
	
	chatListDto = cDao.selectChatListDTO(meet_idx);
	
	// 밴드 공개 여부
	BandPublicOkDAO bDao = new BandPublicOkDAO();
	BandPublicOkDTO bOkDTO = bDao.selectBandPublicOkDTO(meet_idx);
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_header.css'>
  <title>BAND - <%= miDto.getMeet_name() %></title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script>
  	$(function() {
		$(".postEmpty").load("band_no_write_div.html");
  	})
  </script>
  <style>
  	#container.band_main_area {
	  	<% if (!(njDao.noJoinOk(meet_idx, member_idx))) { %>
	  	min-height: calc(100% - 70px);
	    margin-top: 70px;
	    <% } %>
    }
    #upArrow::before {
    	background-position: -770px -585px;
    }
    #downArrow::before {
    	background-position: -429px -667px;
    }
  </style>
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
           <!-- 가입했을 시 프로필 출력 -->
           <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
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
           	<% } %>
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
            <form action="band_home.jsp" method="post">
	          <a>
	          	<input type="hidden" value="<%=meet_idx %>" name="meet_idx">
   		  	 	<input type="hidden" value="<%=member_idx %>" name="member_idx">
             	<button type="submit">
           		  <span class="menu_item_txt active">게시글</span>
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
              <a href="#" class="showBandInfo">밴드 소개 설정
             <% 	} 
             	} catch(Exception e) {
             		e.printStackTrace();
             	}
             	%>
                <span class="uIconArrow"></span>
              </a>
            </div>
            <% if (bOkDTO.getPublic_ok() == "Y") { %>
            <p class="bandTypeDesc">누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시물을 볼 수 있습니다.</p>
            <% } else { %>
            <p class="bandTypeDesc">밴드와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</p>
            <% } %>
            <!-- 밴드 설정 : 가입헀을 시 출력 -->
            <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
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
            <% } %>
          </div>
        </div>
      </aside>
      <!-- 메인 내용 게시글 목록 및 글쓰기 -->
      <main class="band_main">
        <section>
          <!-- 게시글 검색 form : 가입했을 시 출력 -->
          <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
          <div class="searchWrap">
            <form>
              <div class="inputSearch">
                <input type="text" id="input_search" placeholder="글 내용, #태그, @작성자 검색"
                maxlength="200" class="searchTxt">
                <button type="submit" class="search"></button>
              </div>
            </form>
          </div>
          <!-- 글쓰기 영역 : 가입했을 시 출력 -->
          <div class="writeWrap">
            <div class="postWrite">
              <button class="postWriteEventWrapper"></button>
              <div class="postWriteForm">
                <div class="contentEditor">새로운 소식을 남겨보세요.</div>
              </div>
              <div class="buttonArea">
                <ul class="toolbarList">
                  <li class="toolbarListItem">
                    <button>
                      <span class="photoIcon"></span>
                    </button>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <% } %>
          <!-- 밴드 소개 영역 -->
          <% if (!(njDao.noJoinOk(meet_idx, member_idx))) { %>
          <div class="bandIntroRegion">
            <div class="contentsCard">
              <div class="bandIntro">
                <h2 class="bandIntroTitle">밴드 소개</h2>
                <ul class="areaSelect">
                  <li class="areaSelectItem">
                    <a href="#" class="areaButton">
                      <span class="iconLocal"></span>
                      <%= mDto.getArea() %>
                    </a>
                  </li>
                </ul>
                <div class="bandIntroDetail">
                  <p class="desc">
                    <%= mDto.getTitle() %>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <% } %>
          <!-- 게시글 목록 : 헤더 영역 -->
          <div class="boardTag">
            <div class="boardTagHead">
              <div class="sortingMenu">
                <button class="buttonSorting" id="downArrow">최신순</button>
              </div>
            </div>
          </div>
          <!-- 게시글 목록 : 내용 영역 -->
          <div class="moduleBox">
            <div class="postWrap">
              <div>
              <span></span>
            <!-- 게시글이 없을 경우 -->
              <% 
              if (mPrintListDTO.size() == 0) {
              %>
                <div class="postEmpty">
                </div>
              <% } else { %>
             <!-- 게시글이 있을 경우 -->
             <% 
             	for (MeetPostListPrintDTO mPDto : mPrintListDTO) {
            	 clListDTO = clViewDAO.selectCommentListViewDTO(mPDto.getPost_idx());
            	 LikeCountDTO lCountDTO = lCountDAO.selectLikeCountDTO(mPDto.getPost_idx());
            	 
            	 int n = 0;
            	 n++;
            	 
            	 ArrayList<String> photoList = new ArrayList<>();
            	 if (mPDto.getFile_url() != null) {
            		 photoList.add(mPDto.getFile_url());
            	 }
            	 %>
           		<div class="postLayoutView" id="<%= mPDto.getPost_idx() %>">
           		<article class="contentsCard">
				 <!-- 게시글 상단 -->
				 <div class="postListItemView">
				   <div class="postAuthorRegion">
				     <div class="postWriter">
				     <!-- 관리자인지 확인 -->
				     <% if (mPrintDAO.adminCheck(mPDto.getMember_idx(), meet_idx)) { %>
				       <a href="#" class="uProfile -leader">
				       <% } else { %>
				       <a href="#" class="uProfile">
				       <% } %>
				       <!-- 프로필 사진 있는지 확인 -->
				         <span class="profileInner">
			         		<% if (mPDto.getProfile() != null) { %>
				         	<img src="<%= mPDto.getProfile() %>"
				                   width="34" height="34">
		                   <% } %>
				         </span>
				       </a>
				       <div class="postWriterInfoWrap">
				         <span class="name">
				           <a href="#" class="text"><%= mPDto.getNickname() %></a>
				         </span>
				         <div class="postListInfoWrap">
				           <time class="time"><%= mPDto.getReg_date() %></time>
				         </div>
				       </div>
				     </div>
				   </div>
				   <div class="postMain">
				     <div class="postBody">
				       <div class="postTextView">
				         <div class="postText">
				           <p class="txtBody"><%= mPDto.getContent() %></p>
				         </div>
				         <!-- 게시글에 사진 있는지 확인 -->
				         <% if (mPDto.getFile_url() != null) { %>
				         <div class="postPhoto">
				           <ul class="photoCollage">
				             <li class="collageItem">
				               <button class="collageImg">
				                 <img src="<%= mPDto.getFile_url() %>">
				               </button>
				             </li>
				           </ul>
				         </div>
				         <% } %>
				       </div>
				     </div>
				   </div>
				 </div>
				 <!-- 게시글 옵션 : 본인 게시글일 시 출력 -->
				 <% if (mPDto.getMember_idx() == member_idx) { %>
				 <div class="postOptionListView">
                   <div class="postFunction" id="off">
                     <button class="postSet">글 옵션</button>
                     <div class="lyMenu" style="display: none">
                       <ul>
                         <li>
                           <a href="#">삭제하기</a>
                         </li>
                         <li>
                           <a href="#">수정하기</a>
                         </li>
                       </ul>
                     </div>
                   </div>
                 </div>
                 <% } %>
				 <!-- 게시글 하단 -->
				 <div class="postCountView">
				   <div class="postCount">
				     <!-- 댓글, 좋아요수 -->
				     <div class="postCountLeft">
				       <span class="faceComment">
				         <button class="uEmotionView">
				           <span class="emotionWrap">
				             <span class="icon">
				               <span class="uFaceIcon"></span>
				             </span>
				           </span>
				           <span class="count"><%= lCountDTO.getLike() %></span>
				         </button>
				         <button class="comment">댓글<span class="count"><%= clListDTO.size() %></span>
				         </button>
				       </span>
				     </div>
				     <!-- 조회수 -->
				     <div class="postCountRight">
				       <span class="shareRead">
				         <span class="read">
				           <span class="count">
				             <%= mPDto.getViews() %>
				           </span>
				         </span>
				       </span>
				     </div>
				   </div>
   			  <!-- 댓글 쓰기, 좋아요 버튼 : 가입했을 시 출력 -->
			   <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
                 <div class="postAdded">
                   <div class="postAddBox">
                     <div class="addCol">
                       <button class="addStatus">
                         <span class="uFaceIcon"></span>
                         <span>좋아요
                         </span>
                       </button>
                     </div>
                     <div class="addCol">
                       <button class="addStatus addComment">
                         <span class="uIconComment"></span>
                         <span>댓글쓰기</span>
                       </button>
                     </div>
                   </div>
                 </div>
                <% } %>
			   </div>
				 <!-- 댓글 내용 -->
				 <div class="commentMainView">
				   <div>
				     <!-- 댓글 목록 -->
				     <div class="commentList">
				       <div class="cComment">
				         <div>
				         <% for(CommentListViewDTO clDto : clListDTO) { 
				         	MeetCommentElapsedTimeDTO mCDto = mCDao.selectMeetCommentElapsedTimeDTO(clDto.getComment_idx());
				         %>
				           <div class="itemWrap">
				             <div class="writeInfo">
				             <% if (mPrintDAO.adminCheck(clDto.getMember_idx(), meet_idx)) {%>
				               <a href="#" class="uProfile -leader">
				               <% } else { %>
				               <a href="#" class="uProfile">
				               <% } %>
				                 <span class="profileInner">
				                 <% if (clDto.getProfile() != null) { %>
				                   <img src="<%= clDto.getProfile() %>"
				                   width="34" height="34">
				                   <% } %>
				                 </span>
				               </a>
				               <button class="nameWrap">
				                 <strong class="name"><%= clDto.getNickname() %></strong>
				               </button>
				             </div>
				             <div class="commentBody">
				               <p class="txt"><%= clDto.getContent() %></p>
				               <div class="func">
				               <!-- 댓글 작성 시간 출력 -->
				                 <time class="time">
				                 	<% 
				                 	int day = Integer.parseInt(mCDto.getDay());
				                 	int time = Integer.parseInt(mCDto.getTime());
				                 	int minute = Integer.parseInt(mCDto.getMinute());
				                 	
				                 	if (day > 10) { %>
				                 	<%= clDto.getReg_date() %>
				                 	<% } else if (time > 23) { %>
				                 			<%= day %>일 전
			                 			<% } else if (minute > 60) { %>
			                 					<%= time %>시간 전
			                 				<% } else { %>
			                 					<%= minute %>분 전
			                 					<% } %>
				                 </time>
				               </div>
				             </div>
				           </div>
				           <% } %>
				         </div>
				       </div>
				     </div>
				   </div>
				   <!-- 댓글 입력창 : 가입했을 시 출력 -->
				   <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
                    <div class="cCommentWrite" id="off" style="display: none;">
                      <section class="commentInputView">
                        <div class="writeMain">
                          <div class="writeWrap">
                            <div class="flexBox">
                              <div class="profileStatus profileInputRegion">
                                <div class="messageInputProfileView">
                                  <span class="current uProfile">
                                    <span class="profileInner">
                                      <img
                                      <% if(mMemberProfilePrintDTO.getProfile() != null) { %>
                                      	src="<%= mMemberProfilePrintDTO.getProfile() %>"
                                      	<% } %>
                                      width="21" height="21">
                                    </span>
                                  </span>
                                </div>
                              </div>
                              <div class="mentionsWrap">
                                <div class="uInputComment">
                                  <div class="mentions-input">
                                    <div class="mentions">
                                      <div></div>
                                    </div>
                                    <textarea cols="20" rows="1" class="commentWrite" placeholder="댓글을 남겨주세요."></textarea>
                                    <div style="position: absolute; display: none; overflow-wrap: break-word; 
                                    white-space: pre-wrap; border-color: rgb(68, 68, 68);
                                    border-style: none; border-width: 0px; font-weight: 400; width: 333px;
                                    line-height: 20.02px; font-size: 13px; padding: 8px 15px 0px 10px;">&nbsp;</div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- 댓글 submit -->
                          <div class="submitWrap">
                            <button type="submit" class="writeSubmit">보내기</button>
                          </div>
                        </div>
                      </section>
                    </div>
                   <% } %>
				</article>
                </div>
                <!-- 팝업 : 게시글 디테일 뷰 -->
                <div class="layerContainerView" id="postDetail<%= mPDto.getPost_idx() %>" style="display: none">
			      <div class="layerContainerInnerView">
			        <section class="lyWrap">
			          <div class="lyPostViewer">
			            <div class="postViewer">
			              <article class="cPostCard">
			                <div class="cContentsCard">
			                  <!-- 작성자 영역 -->
			                  <div class="postWriter">
			                    <% if (mPrintDAO.adminCheck(mPDto.getMember_idx(), meet_idx)) { %>
                                <a class="uProfile -leader -border">
                                <% } else { %>
                                <a class="uProfile -border">
                                <% } %>
			                      <span class="profileInner">
			                      <% if (mPDto.getProfile() != null) { %>
			                        <img src="<%= mPDto.getProfile() %>" width="40" height="40">
		                          <% } %>
			                      </span>
			                    </a>
			                    <div class="postWriterInfoWrap">
			                      <span class="ellipsis">
			                        <a href="#" class="text"><%= mPDto.getNickname() %></a>
			                      </span>
			                      <div class="postListInfoWrap">
			                        <time class="time"><%= mPDto.getReg_date() %></time>
			                      </div>
			                    </div>
			                    <button class="btnLyClose" style="z-index: 20; top: 30px;"></button>
			                  </div>
			                  <div class="postMain">
			                    <!-- 읽은 사람 수 출력 -->
			                    <div class="readNotice">
			                      <p class="postReaders">
			                        <strong class="sf_color"><%= mPDto.getViews() %>명</strong>
			                       이 읽었습니다.
			                      </p>
			                    </div>
			                    <div class="postBody">
			                      <div class="postTextView">
			                        <div class="postText">
			                          <div class="txtBody"><%= mPDto.getContent() %></div>
			                        </div>
			                      </div>
			                      <!-- 이미지 있을 경우 -->
			                      <% if (mPDto.getFile_url() != null) { %>
			                      <div class="postPhoto">
			                        <ul class="uCollage">
			                          <li class="collageItem">
			                            <a href="#" class="collageImg">
			                              <img src="<%= mPDto.getFile_url() %>">
			                            </a>
			                          </li>
			                        </ul>
			                      </div>
			                      <% } %>
			                    </div>
			                  </div>
			                  <!-- 댓글, 좋아요 수 -->
			                   <div class="dPostCountView">
			                    <div class="postCount">
			                      <div class="postCountLeft">
			                        <span class="faceComment">
			                          <div class="uEmotionView">
			                            <span class="emotionWrap">
			                              <span class="icon">
			                                <span class="uFaceIcon">좋아요</span>
			                              </span>
			                            </span>
			                            <span class="count"><%= lCountDTO.getLike() %></span>
			                          </div>
			                          <span class="comment">댓글<span class="count"><%= clListDTO.size() %></span>
			                          </span>
			                        </span>
			                      </div>
			                    </div>
			                   </div>
			                   <div class="dPostCommentMainView">
			                    <div>
			                      <div class="sCommentList">
			                        <div class="cComment">
			                          <div class="DCommentView">
			                          <% for(CommentListViewDTO clDto : clListDTO) { 
								         	MeetCommentElapsedTimeDTO mCDto = mCDao.selectMeetCommentElapsedTimeDTO(clDto.getComment_idx());
							          %>
			                            <div class="itemWrap">
			                              <div class="writeInfo">
			                              <% if (mPrintDAO.adminCheck(clDto.getMember_idx(), meet_idx)) { %>
			                                <a class="uProfile -leader -border">
			                                <% } else { %>
			                                <a class="uProfile -border">
			                                <% } %>
			                                  <span class="profileInner">
			                                    <img 
			                                    <% if (clDto.getProfile() != null) { %>
			                                    	src="<%= clDto.getProfile() %>"
			                                    <% } %>
			                                    width="34" height="34">
			                                  </span>
			                                </a>
			                                <button class="nameWrap">
			                                  <strong class="name"><%= clDto.getNickname() %></strong>
			                                </button>
			                              </div>
			                              <div class="commentBody">
			                                <p class="txt"><%= clDto.getContent() %></p>
			                                <div class="func">
			                                  <!-- 댓글 작성 시간 출력 -->
								                <time class="time">
								                 <% 
								                 	int day = Integer.parseInt(mCDto.getDay());
								                 	int time = Integer.parseInt(mCDto.getTime());
								                 	int minute = Integer.parseInt(mCDto.getMinute());
								                 	
								                 	if (day > 10) { %>
									                <%= clDto.getReg_date() %>
									                <% } else if (time > 23) { %>
									                 	<%= day %>일 전
								                 	<% } else if (minute > 60) { %>
								                 			<%= time %>시간 전
								                 		<% } else { %>
								                 			<%= minute %>분 전
								                 			<% } %>
								               </time>
			                                </div>
			                              </div>
			                            </div>
			                            <% } %>
			                          </div>
			                        </div>
			                      </div>
			                    </div>
			                    <!-- 댓글 입력창 -->
			                    <div class="cCommentWrite">
			                      <section class="_messageInputView">
			                        <div class="writeMain">
			                          <div class="writeWrap">
			                            <div class="flexBox">
			                              <div class="profileStatus profileInputRegion">
			                                <div class="messageInputProfileView">
			                                  <span class="current uProfile">
			                                    <span class="profileInner">
			                                      <img
			                                      <% 
			                                      try {
			                                    	  if (mMemberProfilePrintDTO.getProfile() != null) { %>
			                                      src = "<%= mMemberProfilePrintDTO.getProfile() %>"
			                                      <% }
		                                    	  } catch(Exception e) {
		                                    		  e.printStackTrace();
		                                    	  }
		                                    	  %>
			                                      width="21" height="21">
			                                    </span>
			                                  </span>
			                                </div>
			                              </div>
			                              <div class="mentionsWrap">
			                                <div class="uInputComment">
			                                  <div class="mentions-input">
			                                    <div class="mentions">
			                                      <textarea cols="20" rows="1" placeholder="댓글을 남겨주세요."></textarea>
			                                    </div>
			                                  </div>
			                                </div>
			                              </div>
			                            </div>
			                          </div>
			                          <div class="submitWrap">
			                            <button class="writeSubmit">보내기</button>
			                          </div>
			                        </div>
			                      </section>
			                    </div>
			                   </div>
			                </div>
			              </article>
			            </div>
			          </div>
			        </section>
			      </div>
			    </div>
             <% } %>
           	<% } %>
              </div>
            </div>
          </div>
        </section>
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
    <!-- 팝업 : 가입질문 -->
    <div class="layerContainerView" tabindex="-1" id="memberJoinQ_popUp" style="display: none;">
      <div class="layerContainerInnerView">
        <section class="lyWrap">
          <div class="lyContent">
            <header class="modalHeader">
              <h1 class="title">
                <%= miDto.getMeet_name() %>
                <p class="titleDesc">가입 질문에 답해주세요.</p>
              </h1>
            </header>
            <div class="modalBody">
              <div class="joinQnAArea">
                <div class="questionBox">
                  <div class="questionText"><%= mAPrintDTO.getSub_q() %></div>
                </div>
                <div class="answerInputBox">
                  <div class="answerInputWrap">
                    <div class="mentions-input">
                      <div class="mentions">
                        <textarea maxlength="200" placeholder="답변을 작성해주세요."></textarea>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="modalFooter">
              <button class="uButton -cancle">취소</button>
              <button class="uButton -confirm">다음</button>
            </div>
          </div>
        </section>
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
  </div>
  <!-- JavaScript -->
  <script>
  <% if (mAPrintDTO.getSub_q() != null) { %>
    $(function() {
      $("#joinBtn").click(function() {
        $("#memberJoinQ_popUp").css('display', 'block');
      })
      $(".-cancle").click(function() {
        $("#memberJoinQ_popUp").css('display', 'none');
      })
    })
   <% } %>
   $(function() {
      $(".postWriteEventWrapper").click(function() {
        $("#postWriteEditor_popUp").css('display', 'block');
      })
      $("#postWriteBtn").click(function() {
        $("#postWriteEditor_popUp").css('display', 'block');
      })
      $(".newChattingBtn").click(function() {
        $("#newChatWrap_popUp").css('display', 'block');
      })
      // 글 디테일 클릭 이벤트
      $(".postListItemView").click(function() {
		let postIdx = $(this).parent().parent().attr('id');
		$("#postDetail" + postIdx).css('display', 'block');
	  })
	  // 팝업 닫기
      $(".btnLyClose").click(function() {
        $(".layerContainerView").css('display', 'none');
      })
      // 글 옵션 버튼 눌렀을 시 클릭 이벤트
      $(".postSet").click(function() {
		let postFunction = $(this).parent();
		let onOff = $(this).parent().attr('id');
		if (onOff == 'off') {
			postFunction.attr('id', 'on');
			postFunction.find(".lyMenu").css('display', 'block');
		} else {
			postFunction.attr('id', 'off');
			postFunction.find(".lyMenu").css('display', 'none');
		}
	  })
	  // 댓글 입력창 댓글쓰기 버튼 눌렀을 시 출력 클릭 이벤트
	  $(".addComment").click(function() {
		let postId = $(this).parent().parent().parent().parent().parent().parent();
		let cCommentWrite = postId.find(".cCommentWrite");
		if (cCommentWrite.attr('id') == 'off') {
			cCommentWrite.attr('id', 'on');
			cCommentWrite.css('display', 'block');
		} else {
			cCommentWrite.attr('id', 'off');
			cCommentWrite.css('display', 'none');
		}
	  })
	  // 최신순 버튼 클릭 시 화살표 모양 바뀌기
	  $(".buttonSorting").click(function() {
		if ($(this).attr('id') == 'downArrow') {
			$(this).attr('id', 'upArrow');
		} else {
			$(this).attr('id', 'downArrow');
		}
	  })	
    });
  </script>
</body>
</html>