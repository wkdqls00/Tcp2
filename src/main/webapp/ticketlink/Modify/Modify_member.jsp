<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정</title>
    <link rel="stylesheet" href="/Tcp2/assets//css/modify_member.css">
    <link rel="stylesheet" href="/Tcp2/assets//css/footer.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <%
    String id = (String)request.getAttribute("id");  
    String name = (String)request.getAttribute("name");  
    String phone = (String) request.getAttribute("phone");
    String phoneHy = phone.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");   
    String email = (String)request.getAttribute("email");  
    String birth = (String)request.getAttribute("birth");  
    String gender = (String)request.getAttribute("gender");
    String address = (String)request.getAttribute("address");  
    String detailed_address = (String)request.getAttribute("detailed_address");  
   
    %>
   
    <div class="common_header"> <!--홈페이지상단-->
        <div class="header_inner">
            <div class="inner">
                <a href="https://www.naver.com" class="header_logo"><span class="hidden">사이트이름</span></a>
                <ul class="my_menu">
                    <li>
                        <a href="#">로그아웃</a>
                    </li>
                </ul>
            </div>
        </div>
    </div> <!--홈페이지상단-->
    <div class="wrap">
        <div class="content_wrap">
            <div class="left_menu_area">
                <div class="my_area"> 
                    <p>환영합니다</p>
                    <p name="name"><%=request.getAttribute("name") %>님</p>
                </div>
                <div class="my_menu_area"> <!--왼쪽 메뉴들-->
                    <ul>
                          <li class="modify current"><a href="/Tcp2//Modify_memberServlet">회원정보수정</a></li>
                        <li class="password"><a href="/Tcp2/Modify_passwordServlet">비밀번호변경</a></li>
                        <li class="sns"><a href="http://127.0.0.1:5500/TicketProject/Modify/modify_memberjoin.html">계정연결설정</a></li>
                        <li class="withdrawal"><a href="/Tcp2//Modify_withdrawalServlet">회원탈퇴</a></li>
                    </ul>
                </div> <!--왼쪽 메뉴들-->
            </div>
           
            <form action="" method="post"> <!--가운데 회원정보들-->
                <div class="sub_content_wrap">
                    <h2 class="main_title">회원정보수정</h2>
                    <div class="modify_box">
                        <h4 class="sub_title">기본정보</h4>
                        <div class="con_table">
                            <dl>
                                <dt>아이디</dt>
                                <dd class="btn_pd">
                                	<span><%=id%></span>
                                </dd>
                            </dl>
                            <dl>
                                <dt>이름</dt>
                                <dd class="btn_pd">
                                    <span><%=name%></span>
                                    <a href="#" class="btn_common" id="name_open">수정</a>
                                </dd>
                                <div class="modify_box_small">
                                  <span class="em_noti">개명하신 경우 본인인증 하시면 이름이 변경됩니다.</span>
                                  <div class="enter_box">
                                    <p class="btn_block"><a href="#" class="btn_red">본인명의 휴대폰으로 인증</a></p>
                                    <span class="icon_noti">이동통신사 및 신용평가기관 모두 변경된 이름으로 등록되어 있는지 확인 후 진행해주세요.</span>
                                  </div>
                                </div>
                            </dl>
              </form>
              <form action="/Tcp2/Modify_phoneDao" id="modify_ph" method="post">
                            <dl>
                                <dt>휴대폰번호</dt>
                                <dd class="btn_pd">
                                    <span><%=phoneHy %></span>
                                    <a href="#" class="btn_common" id="phone_open">수정</a>
                                </dd>
                                <div class="modify_box_small">
                                  <span class="em_noti">휴대폰번호 변경을 위해 인증이 필요합니다.</span>
                                  <div class="enter_box">
                                    <div class="style_input">
                                      <input type="text" class="con_input" id="input_phoneN" name="input_phoneN" placeholder="변경 휴대폰번호 (-없이 입력)">
                                      <input type="text" class="con_input" id="input_certyNum" style="display: none;">
                                      <span id="timer"></span>
                                      <span id="conClear" class="del_btn" style="display: none;"></span>
                                      <span id="errorText_phone" style="display: none;" class="error_text"></span>
                                    </div>
                                  </div>
                                  <p class="btn_area"><a href="#" class="btn_red  disabled" name="phone_certy" id="phone_certy">인증번호 전송</a></p>
                                  <p class="btn_area"><a href="#" class="btn_red" name="certy_check" id="certy_check" style="display: none;">인증</a></p>
                                </div>
                            </dl>
               </form>
                            <dl>
                                <dt>이메일</dt>
                                <dd class="btn_pd">
                                    <span><%=email%></span>
                                    <a href="#" class="btn_common " id="name_open">수정</a>
                                </dd>
                                <div class="modify_box_small">
                                  <span class="em_noti">이메일 변경을 위해 인증이 필요합니다.</span>
                                  <div class="enter_box">
                                    <div class="email_box">
                                      <div class="style_input">
                                        <input type="email" class="con_input" placeholder="변경 이메일">
                                        <span id="conClear" class="del_btn" style="display: none;"></span>
                                      </div>
                                      <div class="custom_select">
                                        <!-- <select name="slctEmailList" id="slctEmailList" style="visibility: hidden;">
                                          <option value="">선택하세요</option>
                                          <option value="naver.com">naver.com</option>
                                          <option value="hanmail.net">hanmail.net</option>
                                          <option value="gmail.com">gmail.com</option>
                                          <option value="nate.com">nate.com</option>
                                          <option value="hotmail.com">hotmail.com</option>
                                          <option value="etc"> 직접입력</option>
                                        </select> -->
                                        <div class="new_list">직접입력</div>
                                        <ul class="options">
                                          <li class="option">선택하세요</li>
                                          <li class="option">naver.com</li>
                                          <li class="option">daum.com</li>
                                          <li class="option">gmail.com</li>
                                          <li class="option">nate.com</li>
                                          <li class="option">직접입력</li>
                                        </ul>

                                      </div>
                                    </div>
                                    
                                    <p class="btn_area"><a href="#" class="btn_red">인증번호 전송</a></p>
                                  </div>
                                </div>
                            </dl>
                            <dl>
                                <dt>생년월일</dt>
                                <dd class="btn_pd"><span><%=birth%></span></dd>
                            </dl>
                           <form action="Modify_addressAction" id="modify_address" method="post">
                           <dl>
                			 <dt>주소</dt>
                             <dd class="btn_pd">
                               <span style="display: inline-block; width: 86%;"><%=address%> <%=detailed_address%></span>
                               <a href="#" class="btn_common address" id="name_open">수정</a>
                             </dd>
                             <div class="modify_box_small">
                               <button type="button" class="btn_common" onclick="sample3_execDaumPostcode()">주소 검색</button>
                               <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:absolute;z-index:5;">
                                  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                               </div>
                              <span class="em_noti" style="color: #ef3e42">변경할 주소를 상세주소까지 정확하게 입력해주세요.</span>
                              <div class="enter_box">
                                <div class="style_input">
                                  <input type="text" class="con_input" id="input_newAddress" name="input_newAddress">
                                  <input type="text" class="con_input" id="input_newAddressD" name="input_newAddressD">
                                </div>
                              </div>
                              <p class="btn_area"><button type="submit" class="btn_red" name="mf_address" id="mf_address">수정</button></p>
                            </div>
                            </dl>
                            </form>
                            <dl>
                                <dt>성별</dt>
                                <dd class="radio">
                                	<span>
	                                    <%if(gender.equals("M")){%>남
	                                    <%}else {%>여 <%}%>
                                    </span>
                                </dd>
                            </dl>
                            <dl>
                                <dt>본인인증</dt>
                                <dd class="btn_pd">완료</dd>
                            </dl>
                            <dl>
                                <p class="dormancy">성별 및 생년월일은 정확한 본인확인을 위해 본인인증 시 인증된 정보로 변경되어 이후 수정 불가능합니다.</p>
                            </dl>
                            <dl></dl>
                        </div>
                    </div>
                    <div class="inter_btn_area"> <!--취소, 수정 버튼-->
                        <span>
                            <button type="button" class="btn_white">취소</button>
                        </span>
                        <span>
                            <button type="button" class="btn_red_success">수정</button>
                        </span> 
                    </div> <!--취소, 수정 버튼-->
                </div>
        </div>
    </div>
    <!-- 맨 밑 하단 안내사항 -->
<footer id="common_footer">
    <button type="button" class="btn_move_top is-active is-stuck">
      <!-- ::before -->
      <span class="blind1">맨 위로 이동하기</span>
    </button>
    <div class="footer_menu">
      <ul class="footer_menu_list">
        <li class="footer_menu_item">
          <a href="/introduction/company" class="footer_menu_link">회사소개</a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/terms/personalInforamtion" class="footer_menu_link">
          <span class="text_bold">개인정보 처리방침</span>
        </a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/term/youth" class="footer_menu_link">청소년 보호정책</a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/terms/use" class="footer_menu_link">이용약관</a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/help/main" class="footer_menu_link">고객센터</a>
        </li>
        <li class="footer_menu_item">
        <!-- ::before -->
        <a href="/help/partner" class="footer_menu_link">티켓판매안내</a>
        </li>
        <li class="footer_menu_item">
         <!-- ::before -->
         <a href="/advertisement/" class="footer_menu_link">광고안내</a>
        </li>
      </ul>
    </div>
   <!-- 맨 밑 하단 회사정보-->
   <div class="footer_inner">
    <span class="footer_corp_title"><b>준영 주식회사</b></span>
    <address class="footer_address">
      <p>
        <span class="footer_address_item">주소: 06043 서울특별시 강남구 강남대로</span>
        <span class="footer_address_item">
          <!-- before -->
          대표이사: 이준영
        </span>
        <span class="footer_address_item">
          <!-- before -->
          사업자등록번호: 144-81-25090
        </span>
      </p>
      <p>
        <span class="footer_address_item">010-6368-9069</span>
        <span class="footer_address_item">
          <!-- before -->
          tjsans9069@naver.com
        </span>
        <span class="footer_address_item">
          <!-- before -->
          통신판매업 신고번호: 제 2023-서울강남-04352호
        </span>
        <span class="footer_address_item">
          <!-- before -->
          <a href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=1448125090" target="_blank" class="btn_hyperlink" rel="noreferrer"><b>사업자정보확인</b></a>
        </span>
        <span class="footer_address_item">
          <!-- before -->
          개인정보보호 책임자: 이지수
        </span>
      </p>
    </address>
    <span class="footer_copyright">Copyright @ JY LINK Corporation. All rights reserved.</span>
    <div class="footer_etc">
      <ul class="footer_sns">
        <li class="footer_sns_item">
          <a href="https://blog.naver.com/" target="_blank" class="footer_sns_link" rel="noreferrer">
            <span class="common_icon icon_naverblog_gray">
              <span class="blind">네이버블로그</span>
              <!-- after -->
            </span>
          </a>
        </li>
        <li class="footer_sns_item">
          <a href="https://www.instagram.com/" target="_blank" class="footer_sns_link" rel="noreferrer">
            <span class="common_icon icon_instagram_gray">
              <span class="blind">인스타</span>
            </span>
          </a>
        </li>
        <li class="footer_sns_item">
          <a href="https://www.youtube.com/" target="_blank" class="footer_sns_link" rel="noreferrer">
            <span class="common_icon icon_youtube_gray">
              <span class="blind">유튜브</span>
            </span>
          </a>
        </li>
      </ul>
    </div>
  </div>
  <script src="/Tcp2/assets/js/modify_member.js"></script>
  <script src="/Tcp2/assets/js/del_btn.js"></script>
</body>
</html>