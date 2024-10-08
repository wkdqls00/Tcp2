<%@page import="java.util.ArrayList"%>
<%@page import="dto.Ticket_checkDto"%>
<%@page import="dao.Ticket_checkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Ticket_checkDto> list = (ArrayList<Ticket_checkDto>) request.getAttribute("list");
	ArrayList<Integer> countList = (ArrayList<Integer>)request.getAttribute("countList");
	int count = (int)request.getAttribute("count");
	HttpSession hs = request.getSession();
	int totalT = (int)hs.getAttribute("totalT");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/mypage.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/ticket_check.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/footer.css">
    <link rel="stylesheet" href="/Tcp2/assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="/Tcp2/assets/css/reset.css">
    <title>예매확인</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
                                    <li class="on"><a href="/Tcp2/Controller?command=ticket_check">예매확인/취소</a></li>
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
                                    <li><a href="/Tcp2/Controller?command=mypage">회원정보수정</a></li>
                                    <li><a href="/Tcp2/Controller?command=modify">회원탈퇴</a></li>
                                </ul>
                            </li>
                        </ul> 
                    <!--본문내용-->
                    <div class="help_recont"> 
                        <div class="h3">
                            <h4 class="h4">예매확인/취소</h4> 
                        </div>
                        <p class="guide_txt">
                            <span style="color: #fa2828;">예매번호</span>를 클릭하면 예매 상세 내용을 확인할 수 있습니다.
                            <br>공연/전시 예매 내역은 하단의 공연/전시 탭을 선택하면 확인할 수 있습니다.
                        </p>
                        <ul class="mypage_tab"> <!--예매확인 / 예매취소-->
                            	<li><a href="/Tcp2/Controller?command=ticket_check">예매확인</a></li>
                            	<li class="on"><a href="/Tcp2/Controller?command=ticket_cancle">예매취소</a></li>
                        </ul>
                        <div class="sortbox">
                            <dl class="daytbox fl">
                                <dt>기간별 조회</dt>
                                <dd style="float: left"> <!--기간별 조회-->
                                    <ul class="daysort">
                                        <li><a href="/Tcp2/Controller?command=ticket_check_periodR&day=15">15일</a></li>
                                        <li><a href="/Tcp2/Controller?command=ticket_check_periodR&day=30">1개월</a></li>
                                        <li><a href="/Tcp2/Controller?command=ticket_check_periodR&day=60">2개월</a></li>
                                        <li><a href="/Tcp2/Controller?command=ticket_check_periodR&day=90">3개월</a></li>
                                    </ul>
                                </dd>
                            </dl>
                            <dl class="monthbox fr">
                                <dt>월 별 조회</dt> <!--월 별 조회-->
                                 <dd style="float: left;">
                                    <div class="selectbox binding">
                                        <a href="" class="select ng-binding" id="viOrRe">예매일</a>
                                        <ul class="select_list ng-hiding" style="display: block;">
                                            <li class="ng-scope" id="reser"><a href="">예매일</a></li>
                                            <li class="ng-scope" id="view"><a href="">관람일</a></li>
                                        </ul>
                                    </div>
                                    <div class="selectbox binding">
                                        <a href="" class="select ng-binding" id="year">연도</a>
                                        <ul class="select_list ng-hiding" style="display: block;">
                                            <li class="ng-scope"><a href="">2024년</a></li>
                                            <li class="ng-scope"><a href="">2023년</a></li>
                                            <li class="ng-scope"><a href="">2022년</a></li>
                                        </ul>
                                    </div>
                                    <div class="selectbox binding">
                                        <a href="" class="select ng-binding" id="month">월</a>
                                        <ul class="select_list ng-hiding" style="display: block;">
                                            <li class="ng-scope"><a href="">1월</a></li>
                                            <li class="ng-scope"><a href="">2월</a></li>
                                            <li class="ng-scope"><a href="">3월</a></li>
                                            <li class="ng-scope"><a href="">4월</a></li>
                                            <li class="ng-scope"><a href="">5월</a></li>
                                            <li class="ng-scope"><a href="">6월</a></li>
                                            <li class="ng-scope"><a href="">7월</a></li>
                                            <li class="ng-scope"><a href="">8월</a></li>
                                            <li class="ng-scope"><a href="">9월</a></li>
                                            <li class="ng-scope"><a href="">10월</a></li>
                                            <li class="ng-scope"><a href="">11월</a></li>
                                            <li class="ng-scope"><a href="">12월</a></li>
                                        </ul>
                                    </div> <!--조회버튼-->
                                    <a href="" class="btn_blank" id="searchMonth">조회</a>
                                </dd>
                            </dl>
                        </div>
                        <p class="guide_txt v2"> <!--안내문-->
                            예매한 내역이 확인이 안되실 경우
                            <a href="">1:1 상담문의</a>
                            를 이용해주세요.
                        </p>
                        <div class="basic_tbl">
                            <table>
                                <colgroup>
                                    <col style="width:90px">
                                    <col>
                                    <col style="width:135px">
                                    <col style="width:50px">
                                    <col style="width:100px">
                                    <col style="width:155px">
                                </colgroup>
                                <thead> <!--테이블-->
                                    <tr>
                                        <th scope="col">예매번호</th>
                                        <th scope="col">티켓명</th>
                                        <th scope="col">관람일시</th>
                                        <th scope="col">매수</th>
                                        <th scope="col">취소가능일</th>
                                        <th scope="col">상태</th>
                                    </tr>
                                </thead>
                                <tbody> <!--예매내역-->
                                	<%	
                                		int cnt = 0;
                                		for(Ticket_checkDto dto : list) {
                                			String status = dto.getStatus();
                                			if(status.equals("Y")) status = "결제완료";
                                			else status = "환불완료";
                                			if(cnt == 10) break;
                                	%>
                                    <tr>
                                        <td class="fs12 point_number"><a href=""><%=dto.getPayment_idx()%></a></td>
                                        <td class="tl ng-scope1"><a href="/Tcp2/Controller?command=playinfo&play_idx=<%=dto.getPlay_idx()%>"><%=dto.getName() %></a></td>
                                        <td class="fs12 number ng-binding"><%=dto.getStart_date()%></td>
                                        <td class="ng-binding"><%=countList.get(cnt) %>장</td>
                                        <td class="fs12 number color_point"><%=dto.getStart_date()%><br><%=dto.getStart_time()%></td>
                                        <td>
                                            <div class="reserve_condition1"><%=status%></div>
                                            <div class="reserve_condition2"><%=dto.getPay_date() %></div>
                                        </td>
                                    </tr>
                                    <%		cnt++;
                                    	}
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging"> <!--페이지 이동-->
                            <%
                            int currP = 1;
                            String currP_ = request.getParameter("currP");
                            if (currP_ != null && !currP_.equals(""))
                            	currP = Integer.parseInt(currP_);
                            %>
                            <a href="/Tcp2/Controller?command=ticket_cancle&currP=1" class="first">맨앞</a>
                            <a href="/Tcp2/Controller?command=ticket_cancle&currP=<%=Math.max(currP -1, 1)%>" class="prev">이전</a>
                            <strong><%=currP%></strong>
                            <a href="/Tcp2/Controller?command=ticket_cancle&currP=<%=Math.min(currP + 1, count)%>" class="next">다음</a>
                            <a href="/Tcp2/Controller?command=ticket_cancle&currP=<%=count%>" class="end">맨뒤</a>
                        </div>
                        <div class="note">
                            <h6>
                                <span></span>
                                티켓취소 안내
                            </h6>
                            <ol>
                                <li>예매한 티켓 전체 취소, 혹은 신용카드 결제 시 부분 취소가 가능합니다.<br>단, 일부 상품의 경우도 부분취소가 불가합니다.</li>
                                <li>티켓이 배송된 이후에는 인터넷이나 고객센터를 통한 취소가 불가하며, 받으신 티켓을 취소일 전까지 <span style="color: #ef3e4e;">종원링크 주식회사</span> 본사로 반송을 해주셔야 취소 가능합니다. (등기우편을 이용해주세요!)</li>
                                <li>예매 당일 자정까지 취소하실 경우는 예매수수료도 환불되며, 취소수수료가 부과되지 않습니다. 그 이후에 취소하실 경우는 예매수수료가 환불되지 않으며, 취소수수료는 정책에 따라 부과됩니다.</li>
                                <li>일부 경기의 경우 상황에 따라 일괄 취소 건이 발생할 수있으며, 일괄 취소 시에는 취소 수수료가 부과되지 않습니다.</li>
                                <li>티켓의 날짜/시간/좌석 등급/좌석 위치 변경은 불가합니다. 자세한 안내가 필요할 경우 고객센터를 이용해주세요.</li>
                            </ol>
                        </div>
                    </div> <!--안쪽 내용들-->
                    <div></div>
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
<script src="/Tcp2/assets/js/ticket_check.js"></script>
<script src="/Tcp2/assets/js/toMonthR.js"></script>
</body>
</html>