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
              <button type="submit" class="uButton" id="joinBtn">밴드 가입하기</button>
            </div>
            <div class="bandInfoBox">
              <a href="#" class="showBandInfo">밴드 정보 보기
                <span class="uIconArrow"></span>
              </a>
            </div>
            <p class="bandTypeDesc">누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시물을 볼 수 있습니다.</p>
          </div>
        </div>
      </aside>
      <!-- 메인 내용 게시글 목록 및 글쓰기 -->
      <main class="band_main">
        <section>
          <!-- 게시글 검색 form -->
          <!-- <div class="searchWrap">
            <form>
              <div class="inputSearch">
                <input type="text" id="input_search" placeholder="글 내용, #태그, @작성자 검색"
                maxlength="200" class="searchTxt">
                <button type="submit" class="search"></button>
              </div>
            </form>
          </div> -->
          <!-- 밴드 소개 영역 -->
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
          <!-- 게시글 목록 : 헤더 영역 -->
          <div class="boardTag">
            <div class="boardTagHead">
              <div class="sortingMenu">
                <button class="buttonSorting">최신순</button>
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
             <% for (MeetPostListPrintDTO mPDto : mPrintListDTO) {
            	 clListDTO = clViewDAO.selectCommentListViewDTO(mPDto.getPost_idx());
            	 LikeCountDTO lCountDTO = lCountDAO.selectLikeCountDTO(mPDto.getPost_idx());
            	 %>
           		<div class="postLayoutView">
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
				 <!-- 게시글 옵션 -->
				 <div class="postOptionListView">
				   <div class="postFunction">
				     <button class="postSet">글 옵션</button>
				   </div>
				 </div>
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
				</article>
                </div>
             <% } %>
           	<% } %>
              </div>
            </div>
          </div>
        </section>
      </main>
    </div>
    <!-- 가입질문 팝업 -->
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
  </div>
  <!-- JavaScript -->
  <script>
  <% if (mAPrintDTO.getSub_q() != null) { %>
    $(function() {
      $("#joinBtn").click(function() {
        $(".layerContainerView").css('display', 'block');
      })
      $(".-cancle").click(function() {
        $(".layerContainerView").css('display', 'none');
      })
    })
   <% } %>
  </script>
</body>
</html>