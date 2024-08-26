<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int member_idx = (Integer)request.getAttribute("member_idx");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/clear.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/band_header.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/setting_leader_band_name.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/band.css">
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <title>밴드 생성</title>
   <script src="https://code.jquery.com/jquery-latest.min.js"></script>
   <script>
   		function uploadImg(input) {
   			if(input.files && input.files[0]) {
   				let reader = new FileReader();
   				reader.onload = function (e) {
   				 $(".selectedCover").attr("src", e.target.result);
   				}
   				reader.readAsDataURL(input.files[0]);
   			}
   		}
   </script>
   
</head>
<body>
  <div class="wrap">
    <header class="header_area">
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
            <li class="ml_24 positionR">
              <button class="btnMySetting">
                <span class="uProfile">
                  <span class="profileInner">
                    <img src="https://ssl.pstatic.net/cmstatic/webclient/dres/20240528100621/images/template/profile_60x60.png"
                    width="30" height="30">
                  </span>
                </span>
              </button>
              <!-- 프로필 클릭 시 드롭다운 -->
              <div class="menuModalLayer profileDropDown" id="off" style="display: none">
                <ul class="menuModalList">
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
    <!-- 밴드 이름 설정 -->
    <div id="home_main_view">
      <div id="aside_wrap"></div>
      <main id="aside_content">
        <section class="band_make">
          <h2 class="band_name_cover">밴드 이름 및 커버</h2>
          <form action="<%= request.getContextPath() %>/CreateNewBandServlet" method="post" enctype="multipart/form-data">
            <fieldset>
              <legend class="band_name_cover">밴드 이름 및 커버</legend>`
              <div class="make_cover">
                <label class="make_title" for="ex_name">밴드 이름</label>
                <div class="input_band">
                  <input type="text" class="_input_band_name" id="ex_name" placeholder="밴드 이름 입력" name="name" required>
                </div>
                <div class="cover_select">
                  <div class="main_cover">
                    <span class="m_cover">
                      <img class="selectedCover coverImg" width="300" height="225" name="input">
                    </span>
                  </div>
                  <div class="cover_list">
                    <div class="cover_list_head">
                      <h3>커버 선택</h3>
                    </div>
                  <ul class="change_cover_list">
                    <li>
                      <span class="cover_change">
                        <label for="add_photo" class="label_add_photo">사진 추가</label>
                        <input type="file" class="image_update" id="add_photo" accept="image/*" onchange="uploadImg(this)">
                        <span class="focus_outline"></span>
                      </span> 
                    </li>
                    <li class="cover_set">
                      <button type="button" data-cover="#" class="default_cover">
                        <img class="cover_img" src="https://coresos-phinf.pstatic.net/a/34g04d/3_ea3Ud018admaj6npplibe76_5ksoqj.png?type=cover_a264" width="120" height="90" alt="게임기 이미지">
                        <span class="mask"></span>
                      </button>
                    </li>
                    <li class="cover_set">
                      <button type="button" data-cover="#" class="default_cover">
                        <img class="cover_img" src="https://coresos-phinf.pstatic.net/a/34g0c2/9_ba1Ud018adm15mc94lwd582j_5ksoqj.png?type=cover_a264" width="120" height="90" alt="고양이 이미지">
                        <span class="mask"></span>
                      </button>
                    </li>
                    <li class="cover_set">
                      <button type="button" data-cover="#" class="default_cover">
                        <img class="cover_img" src="https://coresos-phinf.pstatic.net/a/34g0bd/f_6a2Ud018adm1cc8mit3kn4po_5ksoqj.png?type=cover_a264
                        " width="120" height="90" alt="색연필들 이미지">
                        <span class="mask"></span>
                      </button>
                    </li>
                    <li class="cover_set">
                      <button type="button" data-cover="#" class="default_cover">
                        <img class="cover_img" src="https://coresos-phinf.pstatic.net/a/2ih0hj/c_36hUd018adma3lmqcmkw1bu_fnol82.jpg?type=cover_a264" width="120" height="90" alt="손목시계 이미지">
                        <span class="mask"></span>
                      </button>
                    </li>
                    <li class="cover_set">
                      <button type="button" data-cover="#" class="default_cover">
                        <img class="cover_img" src="https://coresos-phinf.pstatic.net/a/34g07j/c_4a1Ud018adm1egyqqdem7w3r_5ksoqj.png?type=cover_a264" width="120" height="90" alt="커피가 담긴 잔 이미지">
                        <span class="mask"></span>
                      </button>
                    </li>
                    <li class="cover_set">
                      <button type="button" data-cover="#" class="default_cover">
                        <img class="cover_img" src="https://coresos-phinf.pstatic.net/a/34g09g/g_7a2Ud018admxatsgz9wapsi_5ksoqj.png?type=cover_a264" width="120" height="90" alt="테니스 코트 이미지">
                        <span class="mask"></span>
                      </button>
                    </li>
                    <li class="cover_set">
                      <button type="button" data-cover="#" class="default_cover">
                        <img class="cover_img" src="https://coresos-phinf.pstatic.net/a/34g0d8/i_ga2Ud018admahr9rwbxt2ua_5ksoqj.png?type=cover_a264" width="120" height="90" alt="노을빛 산과 나무 이미지">
                        <span class="mask"></span>
                      </button>
                    </li>
                  </ul>
                </div>
              </div>
                <div class="make_not_ice_area">
                  <p class="make_not_ice_text">밴드이름과 사진은 개설 후에도 변경할 수 있어요</p>
                </div>
              </div>
              <div class="sub_q_label" style="padding-bottom:40px;" >
              	<label class="sub_q make_title">밴드 가입 질문</label>
              	<div class="input_subQ">
              		<input type="text" id="inputSubQ" placeholder="가입 질문을 입력해주세요." name="sub_q">
              	</div>
              </div>
              <div class="sub_q_label" style="border-top:1px solid #e7e7e7;">
              	<label class="sub_q make_title">닉네임</label>
              	<div class="input_subQ">
              		<input type="text" id="inputNickname" placeholder="닉네임을 입력해주세요." name="nickname">
              	</div>
              </div>
              <div class="btn_footer">
              	<button type="button" class="_btnCancel" onClick="history.back()">취소</button>
                <button type="submit" class="_btnConfirm">완료</button>
              </div>
            </fieldset>
          </form>
        </section>
      </main>
    </div>
  </div>
  <script>
  $(function(){
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
   
   // 밴드 이미지 클릭 미리보기
   $(".cover_img").click(function() {
	   let a = $(this).attr('src');
	   $(".selectedCover").attr("src",a);
   })

  });
  </script>
</body>
</html>