<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
HttpSession hs = request.getSession();
int totalT = (int)hs.getAttribute("totalT");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/mypage.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/footer.css">
    <link rel="stylesheet" href="/Tcp2/assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/reset.css">
    <title>마이페이지</title>
    <style>
    </style>
</head>
<body>
    <div class="wrap">
        <!-- 맨 위 상단 메뉴바  -->
        <header>
            <div class="utill">
                <div class="inner">
                    <ul>
                        <%if(request.getSession().getAttribute("userIdx") == null){ %>
			            <li class="utill_link"><a href="/Tcp2/Controller?command=login">로그인</a></li>
			            <%} else { %>
			            <li class="utill_link"><a href="#" onclick="if(confirm('로그아웃 하시겠습니까?')) { window.location.href='/Tcp2/Controller?command=logout'; } return false;">로그아웃</a></li>
			            <%} %>
			            <li class="utill_link"><a href="/Tcp2/Controller?command=ticket_check">예매확인/취소</a></li>
			            <%if(request.getSession().getAttribute("userIdx") == null){ %>
			            <li class="utill_link"><a href="/Tcp2/Controller?command=newaccount">회원가입</a></li>
			            <%} %>
			            <li class="utill_link"><a href="/Tcp2/Controller?command=cscenter">고객센터</a></li>
			            <li class="utill_link"><a href="/Tcp2/Controller?command=mypage">마이페이지</a></li>
                    </ul>
                </div> 
            </div>
            <div class="nav_box">
                <div class="inner">
                    <h1 class="logo"><a href="/Tcp2/Controller?command=main">로고</a></h1>
                    <ul class="nav">
                        <li><a href="#">공연</a></li>
                        <li><a href="/Tcp2/band/band_main.jsp">커뮤니티</a></li>
                    </ul>
                </div>
            </div>
            <div class="gnb_box">
                <div class="inner">
                    <ul class="gnb_list">
                        <li class="gnb_link"><a href="/Tcp2/Controller?command=main">홈</a></li>
			            <li class="gnb_link"><a href="/Tcp2/Controller?command=main">공연</a></li>
			            <li class="gnb_link"><a href="/Tcp2/Controller?command=ranking">랭킹</a></li>
			            <li class="gnb_link"><a href="/Tcp2/Controller?command=band_main">커뮤니티</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="content">
            <div class="container">
                <!--상단 메뉴들-->
                <div class="quick_menu"> 
                    <div class="title">
                        <h2 class="title_txt">마이페이지</h2>
                    </div>
                    <ul class="quick_menu_list">
                        <li class="quick_menu_item reserve">
                            <a href="/Tcp2/Controller?command=ticket_check">
                                <div class="qmenu_box">
                                    <span class="qmenu_tit">예매내역</span>
                                    <span class="qmenu_subtit state_number"><%=totalT %></span>
                                </div>
                            </a>
                        </li>
                        <li class="quick_menu_item info">
                            <a href="/Tcp2/Controller?command=mypage">
                                <div class="qmenu_box">
                                    <span class="qmenu_tit">회원정보</span>
                                    <span class="qmenu_subtit">수정</span>
                                </div>
                            </a>
                        </li>
                    </ul> 
                </div>
                <!--마이페이지 부터 내용-->
                <div class="help_cont"> 
                    <!--왼쪽메뉴-->
                    <ul class="helpMenu">
                        <li class="has_sub">
                            <span class="help_submenu_tit">예매관리</span>
                            <ul class="help_submenu special">
                                <li><a href="/Tcp2/Controller?command=ticket_check">예매확인/취소</a></li>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <span class="help_submenu_tit">할인혜택</span>
                            <ul class="help_submenu">
                                <li><a href="#" onclick="event.preventDefault(); alert('준비 중입니다.');">포인트</a></li>
                                <li><a href="" onclick="event.preventDefault(); alert('준비 중입니다.');">예매권</a></li>
                                <li><a href="" onclick="event.preventDefault(); alert('준비 중입니다.');">상품권</a></li>
                                <li><a href="" onclick="event.preventDefault(); alert('준비 중입니다.');">쿠폰</a></li>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <span class="help_submenu_tit">활동관리</span>
                            <ul class="help_submenu">
                                <li><a href="" onclick="event.preventDefault(); alert('준비 중입니다.');">참여 이벤트</a></li>
                                <li><a href="/Tcp2/Controller?command=script_concert">후기관리</a></li>
                                <li><a href="" onclick="event.preventDefault(); alert('준비 중입니다.');">팬클럽/멤버십 내역</a></li>
                                <li><a href="" onclick="event.preventDefault(); alert('준비 중입니다.');">취소표 대기 신청 내역</a></li>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <span class="help_submenu_tit">증빙서류</span>
                            <ul class="help_submenu">
                                <li><a href="" onclick="event.preventDefault(); alert('준비 중입니다.');">입금증</a></li>
                                <li><a href="" onclick="event.preventDefault(); alert('준비 중입니다.');">현금영수증</a></li>
                                <li><a href="" onclick="event.preventDefault(); alert('준비 중입니다.');">신용카드 매출 전표</a></li>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <span class="help_submenu_tit">회원정보관리</span>
                            <ul class="help_submenu">
                                <li><a href="" onclick="event.preventDefault(); alert('준비중입니다.');">환불계좌관리</a></li>
                                <li class="on"><a href="/Tcp2/Controller?command=mypage">회원정보수정</a></li>
                                <li><a href="/Tcp2/Controller?command=modify">회원탈퇴</a></li>
                            </ul>
                        </li>
                    </ul> 
                    <!--회원정보수정내용-->
                    <div class="help_recont">  
                        <div class="h3"><h4 class="h4">회원정보수정</h4></div>
                        <div class="grey_box"><p><strong>회원님은<span style="color: #fa2828;">'일반회원'</span>이십니다</strong></p></div>
                        <div class="mtmwrite_tbl">
                            <table> 
                                <colgroup>
                                    <col style="width: 160px;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">아이디</th>
                                        <td><%=request.getAttribute("id") %>
                                            <p>
                                                <span class="checkbox">
                                                    <input type="checkbox" id="agree_mail">
                                                </span>
                                               <label for="agree_mail">종원링크 홍보성 정보수신 동의</label>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">비밀번호</th>
                                        <td><a href="/Tcp2/Controller?command=modify" class="btn_blank" style="display: inline-block;">비밀번호 변경</a></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">연락처</th>
                                        <td><%=request.getAttribute("phone") %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">주소</th>
                                        <td><%=request.getAttribute("address") %></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="list_btn">
                            <a href="/Tcp2/Controller?command=modify" class="btn btn_full">회원정보 수정</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--하단-->
       <footer id="common_footer">
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
</body>
</html>