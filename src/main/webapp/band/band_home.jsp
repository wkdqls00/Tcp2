<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 밴드 가입 여부
	NoJoinMeetDAO njDao = new NoJoinMeetDAO();
	
	// 댓글 목록 출력
	CommentListViewDAO clViewDAO = new CommentListViewDAO();
	
	// 밴드 글 목록 출력
	MeetPostListPrintDAO mPrintDAO = new MeetPostListPrintDAO();
	
	// 밴드 글 좋아요 갯수
	LikeCountDAO lCountDAO = new LikeCountDAO();
	
	// 댓글 작성 시간 출력 (~시간, ~분, ~일 전)
	MeetCommentElapsedTimeDAO mCDao = new MeetCommentElapsedTimeDAO();
	
	int member_idx = (Integer)request.getAttribute("member_idx");
	int meet_idx = (Integer)request.getAttribute("meet_idx");
	int meet_member_idx = (Integer)request.getAttribute("meet_member_idx");
	
	MeetIntroduceWriteDTO miDto = (MeetIntroduceWriteDTO)request.getAttribute("miDto");
	String nickname = (String)request.getAttribute("nickname");
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = (MeetMemberProfilePrintDTO)request.getAttribute("mMemberProfilePrintDTO");
	BandPublicOkDTO bOkDTO = (BandPublicOkDTO)request.getAttribute("bOkDTO");
	MeetInfoWriteDTO mDto = (MeetInfoWriteDTO)request.getAttribute("mDto");
	ArrayList<MeetPostListPrintDTO> mPrintListDTO = (ArrayList<MeetPostListPrintDTO>)request.getAttribute("mPrintListDTO");
	ArrayList<CommentListViewDTO> clListDTO = (ArrayList<CommentListViewDTO>)request.getAttribute("clListDTO");
	ArrayList<ChatListDTO> chatListDto = (ArrayList<ChatListDTO>)request.getAttribute("chatListDto");
	MeetJoinQnAPrintDTO mAPrintDTO = (MeetJoinQnAPrintDTO)request.getAttribute("mAPrintDTO");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band_header.css'>
  <title>BAND - <%= miDto.getMeet_name() %></title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script>
  	$(function() {
		$(".postEmpty").load("<%=request.getContextPath()%>/band/band_no_write_div.html");
		
		let meet_member_idx = <%= meet_member_idx %>;
		let meet_idx = <%= meet_idx %>;
		
		// 좋아요 버튼 +1
		$(".postAddBox .addCol:first-child").click(function() {
			let post_idx = $(this).closest(".postLayoutView").attr("id");
			$.ajax({
				url: '${pageContext.request.contextPath}/AjaxPostGoodServlet',
				data: {post_idx : post_idx, meet_member_idx : meet_member_idx},
				type: 'get',
				success: function(response){
					var likeCount = $(".uEmotionView > .count").attr("id");
					likeCount = parseInt(likeCount);
					
					if (parseInt($(".uEmotionView > .count").html()) > likeCount) {
						$(".uEmotionView > .count").html(likeCount);
					} else {
						$(".uEmotionView > .count").html(likeCount + 1);
					}
				},
				error: function(){
					console.log('ajax 통신 실패');		
				}
			});
		});
		
		// 댓글 쓰기 (Insert)
		$(".cCommentWrite").find(".writeSubmit").click(function() {
		
			let post_idx = $(this).closest(".postLayoutView").attr("id");
			let content = $(".commentWrite").val();
			
			$.ajax({
				url: '${pageContext.request.contextPath}/AjaxPostCommentInsertServlet',
				data: {post_idx : post_idx, meet_member_idx : meet_member_idx, content : content},
				type: 'get',
				success: function(response){
					alert("댓글 작성 완료되었습니다.");
					location.reload();
				},
				error: function(){
					console.log('ajax 통신 실패');	
				}
			});
		
		})
		
		// 팝업 : 댓글 쓰기 (Insert)
		$("#popupCommentWrite").click(function() {
		
			let post_idx = $(this).closest(".layerContainerView").attr("postIdx");
			let content = $(".popupCommentInput").val();
			
			console.log(post_idx + " " + content);
			
			$.ajax({
				url: '${pageContext.request.contextPath}/AjaxPostCommentInsertServlet',
				data: {post_idx : post_idx, meet_member_idx : meet_member_idx, content : content},
				type: 'get',
				success: function(response){
					alert("댓글 작성 완료되었습니다.");
					location.reload();
				},
				error: function(){
					console.log('ajax 통신 실패');	
				}
			});
		
		})
		
		// 댓글 삭제 (Delete Update)
		$(".commentDeleteBtn").click(function() {

			let comment_idx = $(this).closest(".cComment").attr("id");
			
			$.ajax({
				url: '${pageContext.request.contextPath}/AjaxCommentDeleteUpdateServlet',
				data: {comment_idx : comment_idx},
				type: 'get',
				success: function(response){
					alert("댓글이 삭제되었습니다.");
					$("#" + comment_idx + ".cComment").hide();
					$("#comment" + comment_idx).hide();
				},
				error: function(){
					console.log('ajax 통신 실패');	
				}
			});
		})
		
		// 최신순, 오래된 순
		
		<%-- if ($(".buttonSorting").attr("id") == "downArrow") {
			<% String order = "DESC"; %>
		} else {
			<% order = "ASC"; %>
		} --%>
		
		//밴드 가입하기 답변 작성
		$("#insertBtn").click(function() {
			let member_idx = <%=member_idx %>;
			let meet_idx = <%=meet_idx %>;
			let sub_a = $("#sub_a").val();
			let nickname = $("#inputNickname").val();
			
			$.ajax({
				url: '${pageContext.request.contextPath}/AjaxInsertJoinQWriteServlet',
				data: {member_idx : member_idx, meet_idx : meet_idx, sub_a : sub_a, nickname : nickname},
				type: 'get',
				success: function(response){
					<% if(!(njDao.noWaitJoinOk(meet_idx, member_idx))){ %>
					alert("가입 신청이 완료되었습니다.");
					location.reload();
					<% } else {%>
					alert("이미 가입 신청이 되어있습니다.");
					location.reload();
					<% } %>
				}
			});
		})
		
		// 채팅방 만들기
		$("#createChatButton").click(function() {
			let member_idx = <%= member_idx %>;
			let title = $("#chatTitleInput").val();
			let meet_idx = <%= meet_idx %>;
			
			$.ajax({
				url: '${pageContext.request.contextPath}/AjaxCreateChatServlet',
				data: {member_idx : member_idx, title : title, meet_idx : meet_idx },
				type: 'get',
				success: function(response){
					alert("채팅방 생성이 완료 되었습니다!");
					location.reload();
				}
			});
		})
		
  	})
  	function uploadImg(input) {
   			if(input.files && input.files[0]) {
   				let reader = new FileReader();
   				reader.onload = function (e) {
   				 $(".postImg").attr("src", e.target.result);
   				}
   				reader.readAsDataURL(input.files[0]);
   			}
   		}
  	
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
              <a href="<%=request.getContextPath() %>/Controller?command=band_member_list&meet_idx=<%=meet_idx %>" class="member_count">멤버 <%= miDto.getMeet_member_count() %></a>
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
      <!-- 메인 내용 게시글 목록 및 글쓰기 -->
      <main class="band_main">
        <section>
          <!-- 게시글 검색 form : 가입했을 시 출력 -->
          <% if (njDao.noJoinOk(meet_idx, member_idx)) { %>
          <!-- <div class="searchWrap">
            <form>
              <div class="inputSearch">
                <input type="text" id="input_search" placeholder="글 내용, #태그, @작성자 검색"
                maxlength="200" class="searchTxt">
                <button type="submit" class="search"></button>
              </div>
            </form>
          </div> -->
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
                    <a class="areaButton">
                      <span class="iconLocal"></span>
                      <%=mDto.getName()%> <%= mDto.getArea_detail() %>
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
            <!-- <div class="boardTagHead">
              <div class="sortingMenu">
                <button class="buttonSorting" id="downArrow">최신순</button>
              </div>
            </div> -->
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
             	// mPrintListDTO = mPrintDAO.selectMeetPostListPrintDTO(meet_idx, order);
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
					         	<img src="<%=request.getContextPath()%>/upload/<%= mPDto.getProfile() %>"
					                   width="34" height="34">
			                   <% } %>
					         </span>
					       </a>
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
				                 <img src="<%=request.getContextPath()%>/upload/<%= mPDto.getFile_url() %>">
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
                       	<form action="<%= request.getContextPath() %>/Controller?command=band_post_delete" method="post">
                       	  <input type="hidden" name="meet_idx" value="<%=meet_idx%>">
                       	  <input type="hidden" name="post_idx" value="<%= mPDto.getPost_idx() %>">
                       	  <input type="submit" style="width: 100%;
						   height: 37px;
						   position: absolute;
						   left: 0;
						   cursor:pointer;">
                          <a href="#" id="postDeleteBtn">삭제하기</a>
                       	</form>
                       	</li>
                        <li>
                           <a href="#" id="postRetouch" class="postRetouch">수정하기</a>
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
				           <span class="count" id="<%= lCountDTO.getLike() %>"><%= lCountDTO.getLike() %></span>
				         </button>
				         <button class="comment">댓글<span class="count"><%= clListDTO.size() %></span>
				         </button>
				       </span>
				     </div>
				     <!-- 조회수 -->
				     <div class="postCountRight" id="<%= mPDto.getViews() %>">
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
	                    <button type="button" class="addStatus">
	                      <span class="uFaceIcon"></span>
	                     <span>좋아요</span>
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
				           <div class="itemWrap" id="comment<%=clDto.getComment_idx()%>">
				             <div class="writeInfo">
				             <% if (mPrintDAO.adminCheck(clDto.getMember_idx(), meet_idx)) {%>
				               <a href="#" class="uProfile -leader">
				               <% } else { %>
				               <a href="#" class="uProfile">
				               <% } %>
				                 <span class="profileInner">
				                 <% if (clDto.getProfile() != null) { %>
				                   <img src="<%=request.getContextPath()%>/upload/<%= clDto.getProfile() %>"
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
					                 	
					                 	String result = null;
					                 	
					                 	if (day > 10 && time > 23 && minute > 60) { 
					                 		result = clDto.getReg_date();
					                 	} else if (day < 10 && time > 24 && minute > 60) {
					                 		result = day + "일 전";
					                 	} else if (day < 10 && time < 24 && minute > 60) {
					                 		result = time + "시간 전";
					                 	} else if (day < 10 && time < 24 && minute < 60 && minute != 0) {
					                 		result = minute + "분 전";
					                 	} else if (day == 0 && time == 0 && minute == 0) {
					                 		result = "방금 전";
					                 	}
					                 	%>
					                 	<%= result %>
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
                                      	src="<%=request.getContextPath()%>/upload/<%= mMemberProfilePrintDTO.getProfile() %>"
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
                            <button class="writeSubmit">보내기</button>
                          </div>
                        </div>
                      </section>
                    </div>
                   <% } %>
				</article>
                </div>
                <!-- 팝업 : 게시글 디테일 뷰 -->
                <div class="layerContainerView" id="postDetail<%= mPDto.getPost_idx() %>" style="display: none" postIdx = "<%= mPDto.getPost_idx() %>">
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
			                        <img src="<%=request.getContextPath()%>/upload/<%= mPDto.getProfile() %>" width="40" height="40">
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
			                    <button class="btnLyClose" style="z-index: 20; top: 30px;" id="postDetailClose"></button>
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
			                              <img src="<%=request.getContextPath()%>/upload/<%= mPDto.getFile_url() %>">
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
			                          <% for(CommentListViewDTO clDto : clListDTO) { 
								         	MeetCommentElapsedTimeDTO mCDto = mCDao.selectMeetCommentElapsedTimeDTO(clDto.getComment_idx());
								         	%>
			                        <div class="cComment" id="<%= clDto.getComment_idx() %>">
			                          <div class="DCommentView">
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
			                                    	src="<%=request.getContextPath()%>/upload/<%= clDto.getProfile() %>"
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
								                 	
								                 	String result = null;
								                 	
								                 	if (day > 10 && time > 23 && minute > 60) { 
								                 		result = clDto.getReg_date();
								                 	} else if (day < 10 && time > 24 && minute > 60) {
								                 		result = day + "일 전";
								                 	} else if (day < 10 && time < 24 && minute > 60) {
								                 		result = time + "시간 전";
								                 	} else if (day < 10 && time < 24 && minute < 60 && minute != 0) {
								                 		result = minute + "분 전";
								                 	} else if (day == 0 && time == 0 && minute == 0) {
								                 		result = "방금 전";
								                 	}
								                 	%>
								                 	<%= result %>
								               </time>
			                                </div>
			                              </div>
			                            </div>
			                            <% if(clDto.getMember_idx() == member_idx) { %>
			                            <div class="feedback" id="off">
			                              <button class="commentEdit"></button>
			                              <div class="lyMenu" style="display: none;">
			                                <ul>
			                                  <li>
			                                    <a href="#" class="commentDeleteBtn">댓글 삭제</a>
			                                  </li>
			                                </ul>
			                              </div>
			                            </div>
			                            <% } %>
			                          </div>
			                        </div>
		                            <% } %>
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
			                                      src = "<%=request.getContextPath()%>/upload/<%= mMemberProfilePrintDTO.getProfile() %>"
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
			                                      <textarea cols="20" rows="1" placeholder="댓글을 남겨주세요." class="popupCommentInput"></textarea>
			                                    </div>
			                                  </div>
			                                </div>
			                              </div>
			                            </div>
			                          </div>
			                          <div class="submitWrap">
			                            <button id="popupCommentWrite" class="writeSubmit">보내기</button>
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
                        <textarea id="sub_a"  maxlength="200" placeholder="답변을 작성해주세요."></textarea>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="questionBox">
                  <div class="questionText" style="margin-top:5px;">닉네임 설정</div>
                </div>
                <div class="answerInputBox">
                  <div class="answerInputWrap">
                    <div class="mentions-input">
                      <div class="mentions">
                        <textarea id="inputNickname" maxlength="200" placeholder="닉네임을 작성해주세요."></textarea>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="modalFooter">
              <button class="uButton -cancle">취소</button>
              <button class="uButton -confirm" id="insertBtn">다음</button>
            </div>
          </div>
        </section>
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
  <!-- 팝업 : 게시글 수정 -->
   <%for (MeetPostListPrintDTO mPDto : mPrintListDTO) { 
   		int post_idx = mPDto.getPost_idx();
   		MeetPostListPrintDAO mplDao = new MeetPostListPrintDAO();
   		MeetPostListPrintDTO mplDto = mplDao.selectContentDTO(post_idx);%>
   <form action="${pageContext.request.contextPath}/PostRetouchServlet" method="post" enctype="multipart/form-data">
    <div class="layerContainerView" tabindex="-1" id="postRetouchEditor_popUp<%=post_idx%>" style="display: none;">
      <div class="layerContainerInnerView">
        <div class="postEditorLayerView" style="position: relative;">
          <section class="lyWrap">
           <input type="hidden" name="meet_idx" value="<%=meet_idx %>">
           <input type="hidden" name="post_idx" value="<%=post_idx%>">
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
                        <label class="photo" for="postFile">
                          <input type="file" accept="image/*" id="postFile" onchange="uploadImg(this)" name="file_url">
                          <span class="photoIcon"></span>
                        </label>
                      </li>
                      <li class="toolbarListItem" >
                        <img class="postImg" style="width:70px; height: 70px; margin-bottom:10px;" src="<%=request.getContextPath()%>/upload/<%=mplDto.getFile_url()%>">
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
	<% } %>
    
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
                <input id="chatTitleInput" type="text" placeholder="채팅방 이름을 입력해주세요.">
                <span class="border"></span>
              </div>
            </div>
            <footer class="footer">
              <button class="uButton -confirm -sizeL" id="createChatButton">완료</button>
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
    });
   <% } %>
   // 글쓰기
   $(function() {
      $(".postWriteEventWrapper").click(function() {
        $("#postWriteEditor_popUp").css('display', 'block');
        let a = $(".contentEditor.cke_editable").val();
      })
      $("#postWriteBtn").click(function() {
        $("#postWriteEditor_popUp").css('display', 'block');
    	let a = $(".contentEditor.cke_editable").val();
      })
      $(".newChattingBtn").click(function() {
        $("#newChatWrap_popUp").css('display', 'block');
      })
      
      // 글 디테일 클릭 이벤트, 조회수 Ajax
      $(".postListItemView").click(function() {
		let post_idx = $(this).parent().parent().attr('id');
		let view = $("#" + post_idx).find(".postCountRight").attr('id');
		view = parseInt(view);

		$.ajax({
			url: '${pageContext.request.contextPath}/AjaxViewAddServlet',
			data: {post_idx : post_idx},
			type: 'get',
			success: function(response){
				$("#postDetail" + post_idx).css('display', 'block');
				view++;
				$("#" + post_idx).find(".read").find(".count").html(view);
				$("#postDetail" + post_idx).find(".postReaders").find(".sf_color").html(view + "명");
				$("#" + post_idx).find(".postCountRight").attr('id', view);
			},
			error: function() {
				console.log('ajax 통신 실패');
			}
		});
		
	  });
      
	  // 팝업 닫기
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
	  
	  // 댓글 삭제 버튼 클릭 이벤트
	  $(".commentEdit").click(function() {
		let feedback = $(this).parent();
		let onOff = $(this).parent().attr('id');
		
		if (onOff == 'off') {
			feedback.attr('id', 'on');
			feedback.find(".lyMenu").css('display', 'block');
		} else {
			feedback.attr('id', 'off');
			feedback.find(".lyMenu").css('display', 'none');
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
	  /* $(".buttonSorting").click(function() {
		if ($(this).attr('id') == 'downArrow') {
			$(this).attr('id', 'upArrow');
		} else {
			$(this).attr('id', 'downArrow');
		}
	  }) */
	  //오른쪽 상단 채팅 버튼 클릭시 새 채팅 화면
	  $(".btnIconStyle").click(function(){
    	$("#newChatWrap_popUp").css('display', 'block');
      })
      
       //글쓰기 수정하기
      $(".postRetouch").click(function() {
    	  let post_idx = $(this).closest(".postLayoutView").attr('id');
    	  $("#postRetouchEditor_popUp" + post_idx).css('display','block');
      })
      
    });
  </script>
</body>
</html>