<%@page import="dao.UpdateJoinBandSettingDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.JoinConditionPrintDTO"%>
<%@page import="dao.JoinConditionPrintDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String notCondition = "제한없음";
    %>
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
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	JoinConditionPrintDAO jcpDAO = new JoinConditionPrintDAO();
	JoinConditionPrintDTO jcpListDAO = jcpDAO.selectJoinConditionPrintDTO(meet_idx);
%>
<%
	UpdateJoinBandSettingDAO ujbsDAO = new UpdateJoinBandSettingDAO();
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_header.css'>
  <link rel="stylesheet" type="text/css" media="screen" href="../assets/css/myband_setting.css">
  <link rel="stylesheet" type="text/css" media="screen" href="../assets/css/joining_condition.css">
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_condition_age_popup.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_condition_gender.css'>

  <script src="https://code.jquery.com/jquery-latest.min.js"></script>

  <title>BAND - Setting - Join - Condition</title>
  <script>
	<% if (jcpListDAO.getGender() == "남자") { %>
		$(function({
						
		});
	<% } %>
</script>
</head>
<body>
  <div id="wrap">
    <!-- 최상단 헤더 -->
    <header class="header_area">
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
                <span class="uIconNews"></span>
              </button>
            </li>
            <li class="ml_14">
              <button class="btnIconStyle">
                <span class="uIconChat"></span>
              </button>
            </li>
            <li class="ml_24 positionR">
              <button class="btnMySetting">
                <span class="uProfile">
                  <span class="profileInner">
                    <img src="	https://ssl.pstatic.net/cmstatic/webclient/dres/20240528100621/images/template/profile_60x60.png"
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
                <span class="subTxt"><%= gender(jcpListDAO.getGender())%></span>
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
  <!-- 나이 조건 설정 : 팝업 -->
 <form action="../../UpdateBandSettingServlet" method="post">
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
                  <option value="none" selected>제한없음</option>
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
        <button type="button" class="btnConfirm">확인</button>
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
                  <input type="radio" id="radio_view1" name="check" class="checkInput" value="none" checked="checked">
                  <span class="checkLabel">
                    <span class="shape"></span>
                    <span class="text">제한없음</span>
                  </span>
                </label>
              </li>
              <li>
                <label for="radio_view2" class="check_gender">
                  <input type="radio" id="radio_view2" name="check" class="checkInput" value="male">
                  <span class="checkLabel">
                    <span class="shape"></span>
                    <span class="text">남자</span>
                  </span>
                </label>
              </li>
              <li>
                <label for="radio_view1" class="check_gender">
                  <input type="radio" id="radio_view3" name="check" class="checkInput" value="female">
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
          <button type="button" class="btnConfirm">확인</button>
        </footer>
      </div>
    </section>
  </div>
  </form>
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
      $(".btnConfirm").click(function(){
    	  let a = $("input[name='check']:checked").val();
      });
    });
    
  </script>
</body>
</html>