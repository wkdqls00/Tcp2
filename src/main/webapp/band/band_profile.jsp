<%@page import="dto.MeetMemberProfilePrintDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MeetMemberProfilePrintDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	int member_idx = Integer.parseInt(request.getParameter("member_idx"));
	MeetMemberProfilePrintDAO mmppDAO = new MeetMemberProfilePrintDAO();
	
	ArrayList<MeetMemberProfilePrintDTO> mmppListDAO = mmppDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_header.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_profile.css'>
  <title>BAND - PROFILE</title>
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
                    <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240528100621/images/template/profile_60x60.png"
                    width="30" height="30">
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
                    <img>
                  </span>
                </div>
              </a>
              <!-- 밴드 이름 -->
              <div class="band_name">
                <a class="band_name_txt">6조 밴드</a>
              </div>
            </div>
            <!-- 멤버 수 -->
            <p class="member">
              <a href="#" class="member_count">멤버 1</a>
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
              <a href="#" class="bandSetting_Link">
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
          <div class="headerWrap">
            <header class="profile_header">
            <%
            	for(MeetMemberProfilePrintDTO mmppDTO : mmppListDAO) {
            %>
              <h1 class="h1ProfileTitle"> 프로필 설정 </h1>
            </header>
          </div>
          <div class="profileSettingCardBox">
            <div class="profileSettingCard">
              <div class="imgBox _defaultProfileImgBox">
              </div>
              <div class="imgBox _existProfileImgBox" <%=(mmppDTO.getProfile()==null ? "style='display:none;'" : "") %>>
              <img class="profileImage" alt="프로필 사진" src="<%=mmppDTO.getProfile()%>">
              </div>
              <span class="addPhoto _btnProfile">
                <label for="addPhoto" class="_labelProfile">프로필 사진 추가</label>
                <input id="addPhoto" type="file" accept="image/*" name="attachment" class="inputFile" title>
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
                  <input type="text" id="selfIntroduction" maxlength="50" placeholder="닉네임입력" class="_descriptionInput" value="<%=mmppDTO.getNickname()%>">
                </div>
              </div>
            </li>
          </ul>
          <%
            	}
          %>
          <div class="btnFooter">
            <button type="button" class="btnCancel">취소</button>
            <button type="button" class="btnSave">저장</button>
          </div>
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
                        <button class="itemLink" onclick="window.open('chat.html', '', 'width=415, height=643')">
                          <span class="thum">
                            <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240603162344/images/template/multi_profile_60x60.png"
                            height="30" width="30">
                          </span>
                          <span class="cont">
                            <strong class="text">치이카와, 장예원</strong>
                            <span class="sub">장예원 : ㅎㅇ</span>
                          </span>
                        </button>
                      </li>
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
            <!-- 사진 목록 -->
            <div class="photoBox">
              <section class="photoList photo">
                <h2 class="tit">최근 사진</h2>
                <div class="body">
                  <div class="list">
                    <!-- 이미지 있을 경우 -->
                    <a href="#" data-index="0">
                      <img src="	https://coresos-phinf.pstatic.net/a/371ffi/f_460Ud018svc11ftqgy2zsi15_ezuzx0.png?type=s150"
                      width="73" height="73">
                    </a>
                    <!-- 이미지 없는 경우 -->
                    <span class="noImg"></span>
                    <span class="noImg"></span>
                    <span class="noImg"></span>
                    <span class="noImg"></span>
                    <span class="noImg"></span>
                  </div>
                </div>
                <a href="#" class="more">더보기</a>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>