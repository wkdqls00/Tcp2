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
<%
	HttpSession hs = request.getSession();
	int member_idx = (int)hs.getAttribute("userIdx");
	
	int meet_idx = 0;
	if(request.getParameter("meet_idx")==null) {
		meet_idx = (Integer)request.getAttribute("meet_idx");
	} else {
		meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	}
	
	UpdateJoinBandSettingDAO ujbsDAO = new UpdateJoinBandSettingDAO();
	// 밴드 가입 여부
	NoJoinMeetDAO njDao = new NoJoinMeetDAO();
	MeetIntroduceWriteDTO miDto = (MeetIntroduceWriteDTO)request.getAttribute("miDto");
	JoinConditionPrintDTO jcpListDAO = (JoinConditionPrintDTO)request.getAttribute("jcpListDAO");
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = (MeetMemberProfilePrintDTO)request.getAttribute("mMemberProfilePrintDTO");
	ArrayList<ChatListDTO> chatListDto = (ArrayList<ChatListDTO>)request.getAttribute("chatListDto");
	BandPublicOkDTO bOkDTO = (BandPublicOkDTO)request.getAttribute("bOkDTO");
	
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
  <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/assets/css/joining_condition.css">
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band_condition_age_popup.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='<%=request.getContextPath()%>/assets/css/band_condition_gender.css'>

  <script src="https://code.jquery.com/jquery-latest.min.js"></script>

  <title>BAND - Setting - Join - Condition</title>
  <script>

  $(function() {
	  // 성별 체크박스 값 넣기
		$(".genderBtn").click(function() {
			let gender = $('input[name=check]:checked').val();
			let meet_idx = <%=meet_idx%>;
			
			$.ajax({
  				url: '${pageContext.request.contextPath}/AjaxBandJoinConditionGender',
  				data: {meet_idx : meet_idx, gender : gender},
  				type: 'get',
  				success: function(response) {
  					alert("변경되었습니다.");
  					location.reload();
  				}
			})
		})
		// 나이 selectbox 값 넣기
		$(".ageBtn").click(function() {
			let meet_idx = <%=meet_idx %>;
			let age = $('select#maxAge').val();
			
			$.ajax({
  				url: '${pageContext.request.contextPath}/AjaxBandJoinConditionAgeServlet',
  				data: {meet_idx : meet_idx, age : age},
  				type: 'get',
  				success: function(response) {
  					alert("변경되었습니다.");
  					location.reload();
  				}
			})
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
            <a href="Controller?command=band_main&meet_idx=<%=meet_idx %>&member_idx=<%=member_idx %>" class="logo">
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
               		<img src="<%= request.getContextPath() %>/upload/<%= mMemberProfilePrintDTO.getProfile() %>"
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
                    <a href="Controller?command=band_profile&meet_idx=<%=meet_idx %>&member_idx=<%=member_idx %>" class="menuModalLink">프로필 설정</a>
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
      <!-- header lnb 메뉴 -->
      <div class="header_lnb bg_blue">
        <ul class="header_lnb_menu">
          <li class="menu_item">
	          <a href="<%= request.getContextPath() %>/Controller?command=band_home&meet_idx=<%= meet_idx %>">
           		  <span class="menu_item_txt">게시글</span>
	          </a>
          </li>
          <li class="menu_item">
           	<a href="<%= request.getContextPath() %>/Controller?command=band_member_list&meet_idx=<%= meet_idx %>">	
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
            <!-- 밴드 소개 설정 -->
            <div class="bandInfoBox">
              <button class="showBandInfo" onclick="location.href='<%= request.getContextPath() %>/Controller?command=band_information&meet_idx=<%= meet_idx %>'">밴드 소개 설정
                <span class="uIconArrow"></span>
              </button>
            </div>
            <!-- 밴드 안내 문구 -->
            <% if (bOkDTO.getPublic_ok().equals("Y")) { %>
            <p class="bandTypeDesc">누구나 밴드를 검색해 찾을 수 있고, 밴드 소개와 게시물을 볼 수 있습니다.</p>
            <% } else { %>
            <p class="bandTypeDesc">밴드와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</p>
            <% } %>
            <!-- 밴드 설정 -->
            <div class="bandSetting">
              <a href="<%=request.getContextPath()%>/Controller?command=band_setting&meet_idx=<%=meet_idx %>" class="bandSetting_Link">
                <span class="uIconSetting"></span>
                밴드 설정
              </a>
            </div>
          </div>
        </div>
      </aside>
      <!-- 밴드 가입 조건 설정 -->
      <main class="main_content">
        <div class="bandJoinConditionView">
          <div class="headerWrap">
            <header class="contentHeader">
              <h1 class="h1_title">가입 조건 설정</h1>
            </header>
          </div>
          <ul class="setting_list">
            <li class="setting_item">
              <div class="itemContent">
                <span class="label">성별</span>
                <span class="subTxt gender" id="<%=jcpListDAO.getGender() %>"><%= gender(jcpListDAO.getGender())%></span>
              </div>
              <div class="itemSide">
                <button type="button" class="change_btn gender_btn">변경</button>
              </div>
            </li>
            <li class="setting_item">
              <div class="itemContent">
                <span class="label">나이</span>
                <% if (jcpListDAO.getAge() != 0) { %>
                <span class="subTxt"><%=jcpListDAO.getAge() %></span>
                <% } else { %>
                <span class="subTxt">제한없음</span>
                <% } %>
              </div>
              <div class="itemSide">
                <button type="button" class="change_btn age_btn">변경</button>
              </div>
            </li>
          </ul>
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
  </div>
  <!-- 나이 조건 설정 : 팝업 -->
 <input type="hidden" name="meet_idx" value="<%=request.getParameter("meet_idx") %>">
  <section class="lyWrap" id="ageChange_popUp" style="display: none;">
    <div class="ageContent">
      <header class="modalHeader">
        <h1 class="h1Header">나이</h1>
      </header>
      <div class="modalBody">
        <div class="modalContentAge">
          <div class="tableList">
              <span class="age_select">
                <select id="maxAge" class="selectMaxYear">
                  <option value="0">제한없음</option>
                  <option value="2024">2024년생</option>
                  <option value="2023">2023년생</option>
                  <option value="2022">2022년생</option>
                  <option value="2021">2021년생</option>
                  <option value="2020">2020년생</option>
                  <option value="2019">2019년생</option>
                  <option value="2018">2018년생</option>
                  <option value="2017">2017년생</option>
                  <option value="2016">2016년생</option>
                  <option value="2015">2015년생</option>
                  <option value="2014">2014년생</option>
                  <option value="2013">2013년생</option>
                  <option value="2012">2012년생</option>
                  <option value="2011">2011년생</option>
                  <option value="2010">2010년생</option>
                  <option value="2009">2009년생</option>
                  <option value="2008">2008년생</option>
                  <option value="2007">2007년생</option>
                  <option value="2006">2006년생</option>
                  <option value="2005">2005년생</option>
                  <option value="2004">2004년생</option>
                  <option value="2003">2003년생</option>
                  <option value="2002">2002년생</option>
                  <option value="2001">2001년생</option>
                  <option value="2000">2000년생</option>
                  <option value="1999">1999년생</option>
                  <option value="1998">1998년생</option>
                  <option value="1997">1997년생</option>
                  <option value="1996">1996년생</option>
                  <option value="1995">1995년생</option>
                  <option value="1994">1994년생</option>
                  <option value="1993">1993년생</option>
                  <option value="1992">1992년생</option>
                  <option value="1991">1991년생</option>
                  <option value="1990">1990년생</option>
                  <option value="1989">1989년생</option>
                  <option value="1988">1988년생</option>
                  <option value="1987">1987년생</option>
                  <option value="1986">1986년생</option>
                  <option value="1985">1985년생</option>
                  <option value="1984">1984년생</option>
                  <option value="1983">1983년생</option>
                  <option value="1982">1982년생</option>
                  <option value="1981">1981년생</option>
                  <option value="1980">1980년생</option>
                  <option value="1979">1979년생</option>
                  <option value="1978">1978년생</option>
                  <option value="1977">1977년생</option>
                  <option value="1976">1976년생</option>
                  <option value="1975">1975년생</option>
                  <option value="1974">1974년생</option>
                  <option value="1973">1973년생</option>
                  <option value="1972">1972년생</option>
                  <option value="1971">1971년생</option>
                  <option value="1970">1970년생</option>
                  <option value="1969">1969년생</option>
                  <option value="1968">1968년생</option>
                  <option value="1967">1967년생</option>
                  <option value="1966">1966년생</option>
                  <option value="1965">1965년생</option>
                  <option value="1964">1964년생</option>
                  <option value="1963">1963년생</option>
                  <option value="1962">1962년생</option>
                  <option value="1961">1961년생</option>
                  <option value="1960">1960년생</option>
                  <option value="1959">1959년생</option>
                  <option value="1958">1958년생</option>
                  <option value="1957">1957년생</option>
                  <option value="1956">1956년생</option>
                  <option value="1955">1955년생</option>
                  <option value="1954">1954년생</option>
                  <option value="1953">1953년생</option>
                  <option value="1952">1952년생</option>
                  <option value="1951">1951년생</option>
                  <option value="1950">1950년생</option>
                </select>
              </span>
          </div>
        </div>
      </div>
      <footer class="modalFooter">
        <button type="button" class="btnCancel">취소</button>
        <button type="button" class="btnConfirm ageBtn">확인</button>
      </footer>
    </div>
  </section>
  <!-- 성별 조건 설정 : 팝업 -->
  <div class="layer_wrap">
    <section class="lyWrap" id="genderChange_popUp" style="display: none;">
      <div class="lyContent">
        <header class="modalHeader">
          <h1 class="title">성별</h1>
        </header>
        <div class="modalBody">
          <div class="modalContentGender">
            <ul class="selectArea">
              <li>
                <label for="radio_view3" class="check_gender">
                  <input type="radio" id="null" name="check" class="checkInput" value="">
                  <span class="checkLabel">
                    <span class="shape"></span>
                    <span class="text">제한없음</span>
                  </span>
                </label>
              </li>
              <li>
                <label for="radio_view2" class="check_gender">
                  <input type="radio" id="M" name="check" class="checkInput" value="M">
                  <span class="checkLabel">
                    <span class="shape"></span>
                    <span class="text">남자</span>
                  </span>
                </label>
              </li>
              <li>
                <label for="radio_view1" class="check_gender">
                  <input type="radio" id="F" name="check" class="checkInput" value="F">
                  <span class="checkLabel">
                    <span class="shape"></span>
                    <span class="text">여자</span>
                  </span>
                </label>
              </li>
            </ul>
          </div>
        </div>
        <footer class="modalFooter">
          <button type="button" class="btnCancel">취소</button>
          <button type="button" class="btnConfirm genderBtn">확인</button>
        </footer>
      </div>
    </section>
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
  <!-- JavaScript -->
  <script>
    $(function() {
      $(".age_btn").click(function() {
        $("#ageChange_popUp").css('display', 'block');
      });
      $(".gender_btn").click(function() {
        $("#genderChange_popUp").css('display', 'block');
      });
      $(".newChattingBtn").click(function() {
        $("#newChatWrap_popUp").css('display', 'block');
      });
      $(".btnCancel").click(function() {
        $(".lyWrap").css('display', 'none');
        $("#genderChange_popUp").css('display', 'none');
      })
      $("#postWriteBtn").click(function() {
         $("#postWriteEditor_popUp").css('display', 'block');
       })
       // 성별 라디오 체크
       $('input:radio[name="check"]:input[id="<%=jcpListDAO.getGender() %>"]').prop('checked', true);
      // 나이 제한 selectbox
      $("#maxAge").val("<%=jcpListDAO.getAge() %>").prop("selected", true);
        //글쓰기 버튼 팝업
        $(".newChattingBtn").click(function() {
          $("#newChatWrap_popUp").css('display', 'block');
          let a = $(".contentEditor.cke_editable").val();
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