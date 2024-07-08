<%@page import="dto.ScriptManagementDto"%>
<%@page import="dao.ScriptManagementDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ScriptManagementDto> list = (ArrayList<ScriptManagementDto>) request.getAttribute("list");
	int count = (int)request.getAttribute("count");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/mypage.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/review.management.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/footer.css">
    <link rel="stylesheet" href="/Tcp2/assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/reset.css">
    <title>후기 관리>공연</title>
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
                        <li class="utill_link"><a href="#">로그인</a></li>
                        <li class="utill_link"><a href="#">예매확인/취소</a></li>
                        <li class="utill_link"><a href="#">회원가입</a></li>
                        <li class="utill_link"><a href="#">고객센터</a></li>
                        <li class="utill_link"><a href="#">마이페이지</a></li>
                    </ul>
                </div> 
            </div>
            <div class="nav_box">
                <div class="inner">
                    <h1 class="logo"><a href="../html/main.html">로고</a></h1>
                    <ul class="nav">
                        <li><a href="#">공연/전시</a></li>
                        <li><a href="#">커뮤니티</a></li>
                    </ul>
                </div>
            </div>
            <div class="gnb_box">
                <div class="inner">
                    <ul class="gnb_list">
                        <li class="gnb_link"><a href="#">홈</a></li>
                        <li class="gnb_link"><a href="#">공연</a></li>
                        <li class="gnb_link"><a href="#">전시</a></li>
                        <li class="gnb_link"><a href="#">랭킹</a></li>
                        <li class="gnb_link"><a href="#">커뮤니티</a></li>
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
                            <a href="">
                                <div class="qmenu_box">
                                    <span class="qmenu_tit">예매내역</span>
                                    <span class="qmenu_subtit state_number">0</span>
                                </div>
                            </a>
                        </li>
                        <li class="quick_menu_item info">
                            <a href="">
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
                                <li><a href="/Tcp2/Ticket_checkServlet">예매확인/취소</a></li>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <span class="help_submenu_tit">할인혜택</span>
                            <ul class="help_submenu">
                                <li><a href="">포인트</a></li>
                                <li><a href="">예매권</a></li>
                                <li><a href="">상품권</a></li>
                                <li><a href="">쿠폰</a></li>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <span class="help_submenu_tit">활동관리</span>
                            <ul class="help_submenu">
                                <li><a href="">참여 이벤트</a></li>
                                <li class="on"><a href="/Tcp2/ScriptManagementServlet">후기관리</a></li>
                                <li><a href="">팬클럽/멤버십 내역</a></li>
                                <li><a href="">취소표 대기 신청 내역</a></li>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <span class="help_submenu_tit">증빙서류</span>
                            <ul class="help_submenu">
                                <li><a href="">입금증</a></li>
                                <li><a href="">현금영수증</a></li>
                                <li><a href="">신용카드 매출 전표</a></li>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <span class="help_submenu_tit">회원정보관리</span>
                            <ul class="help_submenu">
                                <li><a href="">환불계좌관리</a></li>
                                <li><a href="/Tcp2/Mypage_memberServlet">회원정보수정</a></li>
                                <li><a target="_blank" href="/Tcp2/Modify_mainServlet">회원탈퇴</a></li>
                            </ul>
                        </li>
                    </ul> 
                    <!--본문내용-->
                    <div class="help_recont">
                        <div class="h3_line">   
                            <div class="h3"><h4 class="h4">후기 관리</h4></div>
                        </div>
                        <p class="guide_text">
                            고객님께서 남겨주신 후기를 확인하실 수 있습니다<br>
                            종원링크 운영정책에 위봔되거나, 후기의 성격에 맞지 않는 글은 고객님께 사전 통보 없이 삭제될 수 있습니다.
                        </p>
                        <ul class="mypage_tab">
                            <li class="on"><a href="/Tcp2/ScriptManagementServlet">공연</a></li>
                            <li><a href="/Tcp2/ScriptManagementServletE">전시</a></li>
                        </ul>
                        <div class="basic_tbl">
                            <table>
                                <colgroup>
                                    <col style="width: 250px;">
                                    <col>
                                    <col style="width: 140px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">상품명</th>
                                        <th scope="col">후기내용</th>
                                        <th scope="col">작성일</th>
                                    </tr>
                                </thead>
                               
                                <tbody>
                                <% for(ScriptManagementDto l : list) { %>
                                    <tr>
                                        <td class="tl"><a href=""><%=l.getPlay_name()%></a></td>
                                        <td class="tl"><a href=""><%=l.getContent() %>...</a></td>
                                        <td class="fs12"><%=l.getReg_date()%></td>
                                    </tr>
                                <%}%>
                                </tbody>
                                
                            </table>
                        </div>
                        <div class="paging">
                         <%
                            int cp = 1;
                            String page_ = request.getParameter("cp");
                            if (page_ != null && !page_.equals(""))
                            	cp = Integer.parseInt(page_);
                          %>
                            <a href="/Tcp2/ScriptManagementServlet?cp=1" class="first">처음</a>
                            <a href="/Tcp2/ScriptManagementServlet?cp=<%=Math.max(cp-1, 1)%>" class="prev">이전</a>
                            <strong><%=cp %></strong>
                            <a href="/Tcp2/ScriptManagementServlet?cp=<%=cp+1%>" class="next">다음</a>
                            <a href="/Tcp2/ScriptManagementServlet?cp=<%=count%>" class="end">마지막</a>
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