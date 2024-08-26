<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Integer member_idx = (Integer)request.getSession().getAttribute("userIdx");
System.out.println(member_idx);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>등급/좌석선택</title>
  <link rel="stylesheet" href="/Tcp2/assets/css/payment_p1.css">
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
  <style>
   	    .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.7);
            z-index: 10;
            display: block;
       	}
       	.g-recaptcha {
		    position: absolute;
		    left: 40%;
		    top: 45%;
		    z-index: 11;
		    opacity: 1; 
		    transition: opacity 3s ease; 
		}
		.recaptchacomplete {
		    opacity: 0; 
		}
  </style>
</head>
<body>
<%//2871, 62866
int playinfo_idx = Integer.parseInt(request.getParameter("pi"));
@SuppressWarnings("unchecked")
ArrayList<GetPlayIdxDTO> idxlist = (ArrayList<GetPlayIdxDTO>) request.getAttribute("idxlist");
System.out.println(idxlist.get(0));
@SuppressWarnings("unchecked")
ArrayList<SeatStatusDTO> list = (ArrayList<SeatStatusDTO>) request.getAttribute("list");
@SuppressWarnings("unchecked")
ArrayList<String> slist = (ArrayList<String>) request.getAttribute("slist");
@SuppressWarnings("unchecked")
ArrayList<SeatPriceDTO> pricelist = (ArrayList<SeatPriceDTO>) request.getAttribute("pricelist");
@SuppressWarnings("unchecked")
ArrayList<Selectpayment_p1DTO> playinfo = (ArrayList<Selectpayment_p1DTO>)request.getAttribute("playinfo");
String[] color = (String[])request.getAttribute("color");
@SuppressWarnings("unchecked")
ArrayList<SeatDTO> seat = (ArrayList<SeatDTO>) request.getAttribute("seat");
String seatImg = (String)request.getAttribute("seatImg");
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
        <img src="/Tcp2/assets/img/ticklink/<%=seatImg%>" alt="">
        <form action="/Tcp2/Controller" id="nextForm">
        <input type="hidden" name="command" value="pay1">
        <input type="hidden" id="selectedSeats" name="selectedSeats" value="">
                <input type="hidden" name="idx" value="<%=playinfo_idx%>">
        
        <% 
        String seatRank = "";
        for (int i = 0; i < seat.size(); i++) {
            String rank = seat.get(i).getRank();
            switch (pricelist.size()) {
                case 1:
                    seatRank = "B";
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
        %>
			<img src="/Tcp2/assets/img/ticklink/<%=seatRank%>_seat.png" alt="" class="reserved" id ="<%=seat.get(i).getSeat_idx()%>" name="<%=seat.get(i).getSeat_idx()%>" style="top: <%=seat.get(i).getY()%>px; left: <%=seat.get(i).getX()%>px;" data-original-src="/Tcp2/assets/img/ticklink/<%=seatRank%>_seat.png"> 
		<%}%>
		
		</form>
      </div>
    </div>
    <div>
      <img src="<%=playinfo.get(0).getPoster_url()%>" alt="" class="playhallseatimgsmall">
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
<%
for (int i = 0; i < pricelist.size(); i++) {
    int leftseat[] = new int[4];
    if(pricelist.size() == 1){
        color[0] = "#B5E61D"; //색상설정
    }

    // leftseat 배열에 값 할당
    for (int j = 0; j < list.size(); j++) {
        if (j < pricelist.size() - 1) {
            leftseat[j] = list.get(j).getCount();
        } else {
            leftseat[pricelist.size() - 1] += list.get(j).getCount();
        }
    }
	%>
          <div class="box_block2">
            <span class="colorbox" style="background-color:<%=color[i]%>"></span>
            <span class="seatgrade"><%=pricelist.get(i).getRank()%>석</span>
            <span><%=pricelist.get(i).getPrice()%></span>
            <span class="seatstatus"><%=leftseat[i] == 0 ? "매진" : leftseat[i] +"석"%></span>
          </div>	
<%} %>
          <div class="box_block3">
            <span class="colorbox" style="background-color: #7F7F7F;"></span> 
            <span class="seatgrade" style="margin-left: 15px;">예약석</span>
          </div>
        </div>
        <div class="whktjrtjswja">
          <img src="/Tcp2/assets/img/ticklink/좌석선점어쩌구.png" alt="">
        </div>
        <div class="prenextbutton">
          <div><button class="prenextbtn" onclick="window.close()">이전단계</button></div>
          <div><button id="nextBtn" class="prenextbtn" onclick="">다음단계</button></div>
        </div>
      </div>
    </div>
  </div>
  	<div class="overlay" id="overlay"></div>
  	<div class="g-recaptcha" data-sitekey="6LdxTS8qAAAAABwdtPsPaAb9b_rnafUn9FIfnlOv" data-callback="recaptchaCallback"></div>
  		
  	
  
  <script>
  document.addEventListener('DOMContentLoaded', function() {
	    var images = document.querySelectorAll('.reserved');
	    var clickedSrc = '/Tcp2/assets/img/ticklink/선택한좌석.png';
	    var selectedSeats = [];

	    images.forEach(function(image) {
	        var originalSrc = image.getAttribute('data-original-src');

	        image.addEventListener('click', function() {
	            var currentSrc = image.src.split('/').pop();
	            var originalFileName = originalSrc.split('/').pop();
	            var seatId = image.id; // 또는 image.name

	            if (currentSrc === originalFileName) {
		        	if(selectedSeats.length > 4){
		        		alert('좌석은 5개까지 구매 가능합니다.');
		        		return;
		        	}
	                image.src = clickedSrc;
	                if (!selectedSeats.includes(seatId)) {
	                    selectedSeats.push(seatId);
	                }
	            } else {
	                image.src = originalSrc;
	                var index = selectedSeats.indexOf(seatId);
	                if (index !== -1) {
	                    selectedSeats.splice(index, 1);
	                }
	            }

	            // 선택된 좌석 목록을 저장
	            document.getElementById('selectedSeats').value = selectedSeats.join(',');
	        });
	    });

	    // 폼 제출시 선택한 좌석목록을 저장
	    document.getElementById('seatForm').addEventListener('submit', function(e) {
	        document.getElementById('selectedSeats').value = selectedSeats.join(',');
	    });
	});

	// 예약된 좌석을 숨기기 위한 배열과 루프
	var imgarr = [<%
	for (String s : slist) out.print("'" + s + "'" + (slist.indexOf(s) < slist.size() - 1 ? ", " : ""));
	%>];

	imgarr.forEach(function(id){
	    var imgElement = document.getElementById(id);
	    if (imgElement) {
	        imgElement.style.display = 'none';
	    }
	});

	// 다음 버튼 클릭 시 선택된 좌석을 확인하고 폼 제출
	document.getElementById('nextBtn').addEventListener("click", function() {
	    if(selectedSeats.length === 0){
	        alert("한개 이상의 좌석을 선택해 주세요");
	    } else {
	        document.getElementById('nextForm').submit();
	    }
	});
    function recaptchaCallback() {
 		let reCap = document.querySelector('.g-recaptcha');
 		let overlay = document.getElementById('overlay');
 		overlay.style.display = 'none';
 		reCap.classList.add("recaptchacomplete");
    }
</script>
</body>
</html>