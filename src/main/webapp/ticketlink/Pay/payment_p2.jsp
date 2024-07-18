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
  <title>Document</title>
  <link rel="stylesheet" href="../../assets/css/payment_p2.css">
  <script>

    function updateJavaVariable() {
        var xhr = new XMLHttpRequest(); // XMLHttpRequest 객체를 생성합니다.
        xhr.open("POST", "updateVariableServlet", true); // 비동기 POST 요청을 준비합니다.
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); // 요청 헤더를 설정합니다.
        
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) { // 요청이 완료되고 응답이 성공적일 때
                document.getElementById("result").innerText = xhr.responseText; // 응답 텍스트를 HTML 요소에 표시합니다.
            }
        };
        
        xhr.send("newValue=새로운값"); // 서버로 데이터를 전송합니다.
    }
  </script>
</head>
<body>
<%
int playinfo_idx = Integer.parseInt(request.getParameter("pi"));
int payment_idx = Integer.parseInt(request.getParameter("pm"));
String [] seat_idx = request.getParameter("selectedSeats").split(",");
ArrayList<GetPlayIdxDTO> idxlist = new GetPlayIdxDAO().getidxlist(playinfo_idx);
System.out.println(idxlist.get(0));
int play_idx = idxlist.get(0).getPlay_idx();
int playhall_idx = idxlist.get(0).getPlayhall_idx();
ArrayList<SelectPayment_p2DTO> p2dto = new SelectPayment_p2DAO().Selectpayment_p2(playinfo_idx); //일시, 공연이름, 포스터
ArrayList<SeatPriceDTO> pricelist = new SeatPriceDAO().selectSeatPrice(play_idx);//등급별가격 
ArrayList<ReservedSeatInfoDTO> rsidto = new ReservedSeatInfoDAO().selectSeatPrice(payment_idx);//결제하려는좌석 
int total = 0;

//SeatPriceDTO [rank=VIP, price=55,000원]
//SeatPriceDTO [rank=R, price=55,000원]
//SeatPriceDTO [rank=S, price=50,000원]
//SeatPriceDTO [rank=A, price=45,000원]
		
%>







  <header>
    <img src="../../assets/img/ticklink/종튼.png" alt=""> 
  </header>
  <div class="paystepup2">
    <img src="../../assets/img/ticklink/결제단계2.png" alt="">
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
      for(int i = 0; i < rsidto.size(); i++){ 
      			String seatRank = "";
			if (pricelist.size() == 1)
				seatRank = "전";
			else if (pricelist.size() == 2)
				seatRank = rsidto.get(i).getRank().equals("VIP") ? "VIP" : "R";
			else if (pricelist.size() == 3)
				seatRank = rsidto.get(i).getRank().equals("VIP") ? "VIP" : (rsidto.get(i).getRank().equals("R") ? "R" : "S");
			else {
				seatRank = rsidto.get(i).getRank();
			}
			String seatprice = "";
			for (int j = 0; j < pricelist.size(); j++) {
				if(seatRank.equals(pricelist.get(j).getRank())) 
					seatprice = pricelist.get(j).getPrice();
			}
			%>
      <div class="selectqty">
        <div>일반(정가)</div>
        <div>
          <div style="font-size: 18px;"><%=rsidto.get(i).getSeat_chart()%></div>
          <div><b style="font-size: 18px;"><%=seatprice.equals("무료") ? "0" : seatprice.substring(0,seatprice.length()-1)%></b>원<span style="font-size: 18px;"></span></div>
        </div>
        <div>

        </div>
      </div>
      <%
      if(seatprice.equals("무료")) continue;
      total += Integer.parseInt(seatprice.substring(0,seatprice.length()-1).replaceAll(",",""));
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
      <div class="cancel"><span class="canceltitle">취소기한:</span>2024.06.19.17:00</div>
      <div class="cancel" style="margin-top: 0px;"><span class="canceltitle">취소수수료:</span>티켓금액의 0%~30%</div>
      <div class="prenextbutton">
        <div><button class="prenextbtn" onclick="history.back()">이전단계</button></div>
        <div><button class="prenextbtn" onclick="location.href='../../Payment_p2?pi=<%=playinfo_idx%>&pm=<%=payment_idx%>&totalamount=<%=total%>'">다음단계</button></div>
      </div>
    </div>
  </main>
</body>
</html>
