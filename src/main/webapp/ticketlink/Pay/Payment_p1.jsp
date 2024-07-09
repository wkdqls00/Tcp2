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
  <title>좌석선택</title>
  <link rel="stylesheet" href="/Tcp2/assets/css/payment_p1.css">
</head>
<body>
<%
SeatStatusDAO ssdao = new SeatStatusDAO();//남은좌석수
ArrayList<SeatStatusDTO>  list = ssdao.selectSeatStatus(1, 1);
ArrayList<String> slist = ssdao.selectSeatChart(1);//예약된 좌석list
SeatPriceDAO spdao = new SeatPriceDAO();
ArrayList<SeatPriceDTO>  pricelist = spdao.selectSeatPrice(1);//등급별가격 
ArrayList<Selectpayment_p1DTO> playinfo = new Selectpayment_p1DAO().Selectpayment_p1(72254);//공연이름 공연장이름 날짜 시간
%>

  <header>
    <img src="/Tcp2/assets/img/ticklink/종튼.png" alt="">
  </header>
  <div id="paystepup1">
    <img src="/Tcp2/assets/img/ticklink/결제단계1.png" alt="">
  </div>
  <div id="main">
    <div>
      <div>

        <span class="playtitle"><%=playinfo.get(0).getPlay_name()%></span>
        <br/>
        <span class="playhallname"><%=playinfo.get(0).getPlayhall_name()%></span> 
        <span class="line"> </span>
        <span class="playstartdatetime"><%=playinfo.get(0).getDate()%> <%=playinfo.get(0).getTime()%></span>
        <div class="btn">
          <button class="episodeBtn">회차변경</button>
        </div>
      </div>
      <div id="playhallseat">
        <img src="/Tcp2/assets/img/ticklink/공연장좌석2.png" alt="">
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-1" style="top: 112px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-2" style="top: 112px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-3" style="top: 112px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-4" style="top: 112px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-5" style="top: 112px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-6" style="top: 112px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-7" style="top: 112px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-8" style="top: 112px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-9" style="top: 112px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-10" style="top: 112px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-11" style="top: 112px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="A-12" style="top: 112px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="B-1" style="top: 129px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="B-2" style="top: 129px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-3" style="top: 129px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-4" style="top: 129px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-5" style="top: 129px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-6" style="top: 129px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-7" style="top: 129px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-8" style="top: 129px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-9" style="top: 129px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-10" style="top: 129px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-11" style="top: 129px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-12" style="top: 129px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-13" style="top: 129px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="B-14" style="top: 129px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="B-15" style="top: 129px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="B-16" style="top: 129px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="C-1" style="top: 146px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="C-2" style="top: 146px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="C-3" style="top: 146px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="C-4" style="top: 146px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="C-5" style="top: 146px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="C-6" style="top: 146px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="C-7" style="top: 146px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="C-8" style="top: 146px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="C-9" style="top: 146px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="C-10" style="top: 146px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="C-11" style="top: 146px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="C-12" style="top: 146px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="C-13" style="top: 146px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="C-14" style="top: 146px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="C-15" style="top: 146px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="C-16" style="top: 146px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="D-1" style="top: 163px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="D-2" style="top: 163px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="D-3" style="top: 163px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="D-4" style="top: 163px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="D-5" style="top: 163px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="D-6" style="top: 163px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="D-7" style="top: 163px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="D-8" style="top: 163px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="D-9" style="top: 163px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="D-10" style="top: 163px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="D-11" style="top: 163px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="D-12" style="top: 163px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="D-13" style="top: 163px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="D-14" style="top: 163px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="D-15" style="top: 163px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="D-16" style="top: 163px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="D-17" style="top: 163px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="D-18" style="top: 163px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="E-1" style="top: 180px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="E-2" style="top: 180px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="E-3" style="top: 180px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="E-4" style="top: 180px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="E-5" style="top: 180px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="E-6" style="top: 180px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="E-7" style="top: 180px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="E-8" style="top: 180px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="E-9" style="top: 180px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="E-10" style="top: 180px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="E-11" style="top: 180px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="E-12" style="top: 180px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="E-13" style="top: 180px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="E-14" style="top: 180px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="E-15" style="top: 180px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="E-16" style="top: 180px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="E-17" style="top: 180px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="E-18" style="top: 180px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="F-1" style="top: 197px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="F-2" style="top: 197px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="F-3" style="top: 197px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="F-4" style="top: 197px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="F-5" style="top: 197px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="F-6" style="top: 197px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="F-7" style="top: 197px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="F-8" style="top: 197px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="F-9" style="top: 197px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="F-10" style="top: 197px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="F-11" style="top: 197px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="F-12" style="top: 197px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="F-13" style="top: 197px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="F-14" style="top: 197px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="F-15" style="top: 197px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="F-16" style="top: 197px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="F-17" style="top: 197px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="F-18" style="top: 197px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="F-19" style="top: 197px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="F-20" style="top: 197px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="G-1" style="top: 214px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="G-2" style="top: 214px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="G-3" style="top: 214px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="G-4" style="top: 214px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="G-5" style="top: 214px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="G-6" style="top: 214px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="G-7" style="top: 214px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="G-8" style="top: 214px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="G-9" style="top: 214px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="G-10" style="top: 214px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="G-11" style="top: 214px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="G-12" style="top: 214px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="G-13" style="top: 214px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="G-14" style="top: 214px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="G-15" style="top: 214px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="G-16" style="top: 214px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="G-17" style="top: 214px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="G-18" style="top: 214px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="G-19" style="top: 214px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="G-20" style="top: 214px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="H-1" style="top: 231px; left: 136px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="H-2" style="top: 231px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="H-3" style="top: 231px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="H-4" style="top: 231px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="H-5" style="top: 231px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="H-6" style="top: 231px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="H-7" style="top: 231px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="H-8" style="top: 231px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="H-9" style="top: 231px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="H-10" style="top: 231px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="H-11" style="top: 231px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="H-12" style="top: 231px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="H-13" style="top: 231px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="H-14" style="top: 231px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="H-15" style="top: 231px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="H-16" style="top: 231px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="H-17" style="top: 231px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="H-18" style="top: 231px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="H-19" style="top: 231px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="H-20" style="top: 231px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="H-21" style="top: 231px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="H-22" style="top: 231px; left: 506px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="I-1" style="top: 248px; left: 136px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="I-2" style="top: 248px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="I-3" style="top: 248px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="I-4" style="top: 248px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="I-5" style="top: 248px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="I-6" style="top: 248px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="I-7" style="top: 248px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="I-8" style="top: 248px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="I-9" style="top: 248px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="I-10" style="top: 248px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="I-11" style="top: 248px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="I-12" style="top: 248px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="I-13" style="top: 248px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="I-14" style="top: 248px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="I-15" style="top: 248px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="I-16" style="top: 248px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="I-17" style="top: 248px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="I-18" style="top: 248px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="I-19" style="top: 248px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="I-20" style="top: 248px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="I-21" style="top: 248px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="I-22" style="top: 248px; left: 506px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="J-1" style="top: 280px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="J-2" style="top: 280px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="J-3" style="top: 280px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="J-4" style="top: 280px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="J-5" style="top: 280px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="J-6" style="top: 280px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="J-7" style="top: 280px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="J-8" style="top: 280px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="J-9" style="top: 280px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="J-10" style="top: 280px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="J-11" style="top: 280px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="J-12" style="top: 280px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="J-13" style="top: 280px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="J-14" style="top: 280px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="J-15" style="top: 280px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="J-16" style="top: 280px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="J-17" style="top: 280px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="J-18" style="top: 280px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="J-19" style="top: 280px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="J-20" style="top: 280px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="K-1" style="top: 297px; left: 136px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="K-2" style="top: 297px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="K-3" style="top: 297px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="K-4" style="top: 297px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="K-5" style="top: 297px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="K-6" style="top: 297px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="K-7" style="top: 297px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="K-8" style="top: 297px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="K-9" style="top: 297px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="K-10" style="top: 297px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="K-11" style="top: 297px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="K-12" style="top: 297px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="K-13" style="top: 297px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="K-14" style="top: 297px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="K-15" style="top: 297px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="K-16" style="top: 297px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="K-17" style="top: 297px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="K-18" style="top: 297px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="K-19" style="top: 297px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="K-20" style="top: 297px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="K-21" style="top: 297px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="K-22" style="top: 297px; left: 506px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="L-1" style="top: 314px; left: 120px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="L-2" style="top: 314px; left: 136px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="L-3" style="top: 314px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="L-4" style="top: 314px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="L-5" style="top: 314px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="L-6" style="top: 314px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="L-7" style="top: 314px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="L-8" style="top: 314px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="L-9" style="top: 314px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="L-10" style="top: 314px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="L-11" style="top: 314px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="L-12" style="top: 314px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="L-13" style="top: 314px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="L-14" style="top: 314px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="L-15" style="top: 314px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="L-16" style="top: 314px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="L-17" style="top: 314px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="L-18" style="top: 314px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="L-19" style="top: 314px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="L-20" style="top: 314px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="L-21" style="top: 314px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="L-22" style="top: 314px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="L-23" style="top: 314px; left: 506px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="L-24" style="top: 314px; left: 522px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="M-1" style="top: 331px; left: 120px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="M-2" style="top: 331px; left: 136px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="M-3" style="top: 331px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="M-4" style="top: 331px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="M-5" style="top: 331px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="M-6" style="top: 331px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="M-7" style="top: 331px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="M-8" style="top: 331px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="M-9" style="top: 331px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="M-10" style="top: 331px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="M-11" style="top: 331px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="M-12" style="top: 331px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="M-13" style="top: 331px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="M-14" style="top: 331px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="M-15" style="top: 331px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="M-16" style="top: 331px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="M-17" style="top: 331px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="M-18" style="top: 331px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="M-19" style="top: 331px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="M-20" style="top: 331px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="M-21" style="top: 331px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="M-22" style="top: 331px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="M-23" style="top: 331px; left: 506px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="M-24" style="top: 331px; left: 522px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="N-1" style="top: 348px; left: 120px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="N-2" style="top: 348px; left: 136px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="N-3" style="top: 348px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="N-4" style="top: 348px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="N-5" style="top: 348px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="N-6" style="top: 348px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="N-7" style="top: 348px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="N-8" style="top: 348px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="N-9" style="top: 348px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="N-10" style="top: 348px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="N-11" style="top: 348px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="N-12" style="top: 348px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="N-13" style="top: 348px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="N-14" style="top: 348px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="N-15" style="top: 348px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="N-16" style="top: 348px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="N-17" style="top: 348px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="N-18" style="top: 348px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="N-19" style="top: 348px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="N-20" style="top: 348px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="N-21" style="top: 348px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="N-22" style="top: 348px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="N-23" style="top: 348px; left: 506px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="N-24" style="top: 348px; left: 522px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="O-1" style="top: 365px; left: 120px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="O-2" style="top: 365px; left: 136px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="O-3" style="top: 365px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="O-4" style="top: 365px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="O-5" style="top: 365px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="O-6" style="top: 365px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="O-7" style="top: 365px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="O-8" style="top: 365px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="O-9" style="top: 365px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="O-10" style="top: 365px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="O-11" style="top: 365px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="O-12" style="top: 365px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="O-13" style="top: 365px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="O-14" style="top: 365px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="O-15" style="top: 365px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/VIP_seat.png" alt="" class="reserved" id="O-16" style="top: 365px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/VIP_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="O-17" style="top: 365px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="O-18" style="top: 365px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="O-19" style="top: 365px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="O-20" style="top: 365px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="O-21" style="top: 365px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="O-22" style="top: 365px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="O-23" style="top: 365px; left: 506px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="O-24" style="top: 365px; left: 522px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="P-1" style="top: 382px; left: 120px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="P-2" style="top: 382px; left: 136px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="P-3" style="top: 382px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="P-4" style="top: 382px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="P-5" style="top: 382px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="P-6" style="top: 382px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-7" style="top: 382px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-8" style="top: 382px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-9" style="top: 382px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-10" style="top: 382px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-11" style="top: 382px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-12" style="top: 382px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-13" style="top: 382px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-14" style="top: 382px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-15" style="top: 382px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-16" style="top: 382px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-17" style="top: 382px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="P-18" style="top: 382px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="P-19" style="top: 382px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="P-20" style="top: 382px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="P-21" style="top: 382px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="P-22" style="top: 382px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="P-23" style="top: 382px; left: 506px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="P-24" style="top: 382px; left: 522px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="Q-1" style="top: 399px; left: 120px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="Q-2" style="top: 399px; left: 136px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="Q-3" style="top: 399px; left: 152px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="Q-4" style="top: 399px; left: 168px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="Q-5" style="top: 399px; left: 184px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="Q-6" style="top: 399px; left: 200px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-7" style="top: 399px; left: 233px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-8" style="top: 399px; left: 249px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-9" style="top: 399px; left: 265px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-10" style="top: 399px; left: 281px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-11" style="top: 399px; left: 297px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-12" style="top: 399px; left: 313px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-13" style="top: 399px; left: 329px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-14" style="top: 399px; left: 345px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-15" style="top: 399px; left: 361px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-16" style="top: 399px; left: 377px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-17" style="top: 399px; left: 393px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/R_seat.png" alt="" class="reserved" id="Q-18" style="top: 399px; left: 409px;" data-original-src="/Tcp2/assets/img/ticklink/R_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="Q-19" style="top: 399px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="Q-20" style="top: 399px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="Q-21" style="top: 399px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="Q-22" style="top: 399px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="Q-23" style="top: 399px; left: 506px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/A_seat.png" alt="" class="reserved" id="Q-24" style="top: 399px; left: 522px;" data-original-src="/Tcp2/assets/img/ticklink/A_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="R-1" style="top: 445px; left: 151px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="R-2" style="top: 445px; left: 167px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="R-3" style="top: 445px; left: 183px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="R-4" style="top: 445px; left: 199px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="R-5" style="top: 445px; left: 442px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="R-6" style="top: 445px; left: 458px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="R-7" style="top: 445px; left: 474px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
		<img src="/Tcp2/assets/img/ticklink/S_seat.png" alt="" class="reserved" id="R-8" style="top: 445px; left: 490px;" data-original-src="/Tcp2/assets/img/ticklink/S_seat.png"> 
      </div>
    </div>
    <div>
      <img src="/Tcp2/assets/img/ticklink/공연장좌석2.png" alt="" class="playhallseatimgsmall">
      <div class="kingframe">
        <div class="frame">
          <div class="frame_1">등급선택</div>
          <div class="frame_2">
            <button class="f5" onClick="window.location.reload()">
              새로고침
            </button>
          </div>
        </div>
        <div class="box1">
          <div class="box_block1">전체</div>
          <div class="box_block2">
            <span class="colorbox" style="background-color:#ED1C24"></span>
            <span class="seatgrade"><%=list.get(0).getRank()%>석</span><!-- vip -->
            <span><%=String.format("%,d", pricelist.get(0).getPrice())%>원</span>
            <span class="seatstatus"><%=list.get(0).getCount()%>석</span>
          </div>
          <div class="box_block2">
            <span class="colorbox" style="background-color:#3F48CC"></span>
            <span class="seatgrade"><%=list.get(1).getRank()%>석</span><!-- r -->
            <span><%=String.format("%,d", pricelist.get(1).getPrice())%>원</span>
            <span class="seatstatus"><%=list.get(1).getCount()%>석</span>
          </div>
          <div class="box_block2">
            <span class="colorbox" style="background-color:#FFF200"></span>
            <span class="seatgrade"><%=list.get(2).getRank()%>석</span><!-- s -->
            <span><%=String.format("%,d", pricelist.get(2).getPrice())%>원</span>
            <span class="seatstatus"><%=list.get(2).getCount()%>석</span>
          </div>
          <div class="box_block2">
            <span class="colorbox" style="background-color:#22B14C"></span>
            <span class="seatgrade"><%=list.get(3).getRank()%>석</span><!-- a -->
            <span><%=String.format("%,d", pricelist.get(3).getPrice())%>원</span>
            <span class="seatstatus"><%=list.get(3).getCount()%>석</span>
          </div>
          <div class="box_block3">
            <span class="colorbox" style="background-color: #7F7F7F;"></span> 
            <span class="seatgrade" style="margin-left: 15px;">예약석</span>
          </div>
        </div>
        <div class="whktjrtjswja">
          <img src="/Tcp2/assets/img/ticklink/좌석선점어쩌구.png" alt="">
        </div>
        <div class="prenextbutton">
          <div><button class="prenextbtn" >이전단계</button></div>
          <div><button class="prenextbtn" onclick="location.href='/Tcp2/ticketlink/Pay/payment_p2.jsp'">다음단계</button></div>
        </div>
      </div>
    </div>
  </div>
  <script>
document.addEventListener('DOMContentLoaded', function() {
    var images = document.querySelectorAll('.reserved');
    var clickedSrc = '/Tcp2/assets/img/ticklink/선택한좌석.png';

    images.forEach(function(image) {
        var originalSrc = image.getAttribute('data-original-src');

        image.addEventListener('click', function() {
            var currentSrc = image.src.split('/').pop();
            var originalFileName = originalSrc.split('/').pop();

            if (currentSrc === originalFileName) {
                image.src = clickedSrc;
            } else {
                image.src = originalSrc;
            }
        });
    });
});
var imgarr = [<%
for (String id : slist) out.print("'" + id + "'" + (slist.indexOf(id) < slist.size() - 1 ? ", " : ""));
%>//예약내역 있는 좌석 표시OFF 마지막 요소가 아니면 ,를 추가
	];
imgarr.forEach(function(id){
	var imgElement = document.getElementById(id);
	if (imgElement) {
		imgElement.style.display = 'none';
	}
});
  </script>
</body>
</html>