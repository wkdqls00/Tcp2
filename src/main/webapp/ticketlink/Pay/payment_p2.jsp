<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제단계2</title>
  <link rel="stylesheet" href="/Tcp2/assets/css/payment_p2.css">
</head>
<body>
<%
int playinfo_idx = (int)request.getAttribute("pi");
int payment_idx = (int)request.getAttribute("pm");
@SuppressWarnings("unchecked")
ArrayList<SelectPayment_p2DTO> p2dto = (ArrayList<SelectPayment_p2DTO>)request.getAttribute("p2dto");
@SuppressWarnings("unchecked")
ArrayList<SeatPriceDTO> pricelist = (ArrayList<SeatPriceDTO>)request.getAttribute("pricelist");
@SuppressWarnings("unchecked")
ArrayList<ReservedSeatInfoDTO> rsidto = (ArrayList<ReservedSeatInfoDTO>)request.getAttribute("rsidto");
int total = 0;
String time_limit = (String)request.getAttribute("time_limit");
%>
  <header>
    <img src="/Tcp2/assets/img/ticklink/종튼.png" alt=""> 
  </header>
  <div class="paystepup2">
    <img src="/Tcp2/assets/img/ticklink/결제단계2.png" alt="">
  </div>
  <main>
    <div class="main_1">
      <div class="border_red">
        <div class="warning">선택한 좌석이 고객님께 선점되었습니다. <span class="redcol">8분 이내 결제하지 않으실 경우 선점된 좌석이 해제</span>됩니다.</div>
      </div>
      <div class="selectticketguide">
        티켓가격,정보확인
      </div>
      <div class="selectticket">
        <b><%=rsidto.size()%>매</b>를 선택하셨습니다.
      </div>
<%
for (int i = 0; i < rsidto.size(); i++) { 
    String rank = rsidto.get(i).getRank();
    final String seatRank;
    switch (pricelist.size()) {
    case 1:
        seatRank = "전";
        break;
    case 2:
        seatRank = rank.equals("VIP") ? "VIP" : "R";
        break;
    case 3:
        seatRank = rank.equals("VIP") ? "VIP" : (rank.equals("R") ? "R" : "S");
        break;
    default:
        seatRank = rank;
        break;
}
    String seatprice = pricelist.stream()
        .filter(p -> seatRank.equals(p.getRank()))//같은랭크만 남김
        .map(p -> p.getPrice()) //가격추출
        .findFirst()
        .orElse("");

    if (!seatprice.equals("무료")) {
%>
        <div class="selectqty">
            <div>일반(정가)</div>
            <div>
                <div style="font-size: 18px;"><%= rsidto.get(i).getSeat_chart() %></div>
                <div><b style="font-size: 18px;"><%= seatprice.equals("무료") ? "0" : seatprice.substring(0, seatprice.length() - 1) %></b>원<span style="font-size: 18px;"></span></div>
            </div>
            <div></div>
        </div>
<%
        total += Integer.parseInt(seatprice.substring(0, seatprice.length() - 1).replaceAll(",", ""));
    } else {
    	%> 
    	        <div class="selectqty">
            <div>일반(정가)</div>
            <div>
                <div style="font-size: 18px;"><%= rsidto.get(i).getSeat_chart() %></div>
                <div><b style="font-size: 18px;">0</b>원<span style="font-size: 18px;"></span></div>
            </div>
            <div></div>
        </div>
    	<% 
    	
    }
}
%>


    </div>
    <div class="main_2">
      <div class="titleimgbox">
        <div>
          <img src="<%=p2dto.get(0).getPoster_url()%>" alt="" style="height: 50px;">
        </div>
        <div><%=p2dto.get(0).getName()%></div>
      </div>
      <div class="reservationinfo">
        예매정보
      </div>
      <div class="reservationinfoborder">
      <%for(int i = 0; i < rsidto.size(); i++){ %>
	     <div class="reservationinfodiv">
	        <div class="reservationinfoborder1"><%=rsidto.get(i).getRank()%>석</div>
	        <div class="reservationinfoborder2"><%=rsidto.get(i).getSeat_chart()%></div>
	     </div>
      <%} %>
      </div>
      <div class="resertable">
        <div>일시</div>
        <div><%=p2dto.get(0).getPlay_date() + p2dto.get(0).getStart_time()%></div>
      </div>
      <div class="divhrgrey"></div>
      <div class="resertable">
        <div>예매수수료</div>
        <div>0</div>
      </div>
      <div class="divhrgrey"></div>
      <div class="resertable">
        <div>배송료</div>
        <div>0</div>
      </div>
      <div class="divhrgrey"></div>
      <div class="resertable">
        <div>쿠폰할인</div>
        <div>0</div>
      </div>
      <div class="divhrgrey"></div>
      <div class="resertable">
        <div>총결제</div>
        <div><span id=totalAmount><%=String.format("%,d", total)%></span>원</div>
      </div>
      <div class="divhrblack"></div>
      <div class="cancel"><span class="canceltitle">취소기한:</span><%=time_limit%></div>
      <div class="cancel" style="margin-top: 0px;"><span class="canceltitle">취소수수료:</span>티켓금액의 0%~30%</div>
      <div class="prenextbutton">
        <div><button class="prenextbtn" onclick="history.back()">이전단계</button></div>
        <div><button class="prenextbtn" onclick="location.href='/Tcp2/Payment_p2?pi=<%=playinfo_idx%>&pm=<%=payment_idx%>&totalamount=<%=total%>'">다음단계</button></div>
      </div>
    </div>
  </main>
</body>
</html>
