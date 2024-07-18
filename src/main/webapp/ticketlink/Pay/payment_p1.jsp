<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//	HttpSession hs = request.getSession();
//	int member_idx = (int)hs.getAttribute("userIdx");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>좌석선택</title>
  <link rel="stylesheet" href="../../assets/css/payment_p1.css">
</head>
<body>
<%//2871, 62866
int member_idx = 1;
int playinfo_idx = Integer.parseInt(request.getParameter("pi"));
ArrayList<GetPlayIdxDTO> idxlist = new GetPlayIdxDAO().getidxlist(playinfo_idx);
System.out.println(idxlist.get(0));
int play_idx = idxlist.get(0).getPlay_idx();
int playhall_idx = idxlist.get(0).getPlayhall_idx();
SeatStatusDAO ssdao = new SeatStatusDAO();//남은좌석수
ArrayList<SeatStatusDTO>  list = ssdao.getSeatStatus(playhall_idx, playinfo_idx);//등급별 좌석수
ArrayList<String> slist = ssdao.selectSeatChart(playinfo_idx);//예약된 좌석list
ArrayList<SeatPriceDTO> pricelist = new SeatPriceDAO().selectSeatPrice(play_idx);//등급별가격 
ArrayList<Selectpayment_p1DTO> playinfo = new Selectpayment_p1DAO().Selectpayment_p1(playinfo_idx);//공연이름 공연장이름 날짜 시간
String[] color = {"#ED1C24", "#3F48CC", "#FFF200", "#22B14C"};
ArrayList<SeatDTO> seat = new SeatDAO().getSeatlist(playhall_idx);//공연좌석배치설계리스트
%>

  <header>
    <img src="../../assets/img/ticklink/종튼.png" alt="">
  </header>
  <div id="paystepup1">
    <img src="../../assets/img/ticklink/결제단계1.png" alt="">
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
        <img src="../../assets/img/ticklink/<%=new GetSeatImg().getSeatImg(playhall_idx)%>" alt="">
        <form action="../../payment_p1" id="nextForm">
        <input type="hidden" id="selectedSeats" name="selectedSeats" value="">
                <input type="hidden" name="idx" value="<%=playinfo_idx%>">
        
        <% 
        String seatRank = "";
        for(int i = 0; i < seat.size(); i++){
        	if (pricelist.size() == 1)  seatRank = "B";
        	else if (pricelist.size() == 2)
        		seatRank = seat.get(i).getRank().equals("VIP") ? "VIP" : "R";
        	else if (pricelist.size() == 3)
        		seatRank = seat.get(i).getRank().equals("VIP") ? "VIP" : (seat.get(i).getRank().equals("R") ? "R" : "S");
        	else{
        		seatRank = seat.get(i).getRank();
        	}
        %>
			<img src="../../assets/img/ticklink/<%=seatRank%>_seat.png" alt="" class="reserved" id ="<%=seat.get(i).getSeat_idx()%>" name="<%=seat.get(i).getSeat_idx()%>" style="top: <%=seat.get(i).getY()%>px; left: <%=seat.get(i).getX()%>px;" data-original-src="../../assets/img/ticklink/<%=seatRank%>_seat.png"> 
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
		color[0] = "#B5E61D";	
		for(int j = 0; j < list.size(); j++){
			leftseat[0] += list.get(j).getCount();
		}
	}
	else if(pricelist.size() == 2){
		leftseat[0] = list.get(0).getCount();
		for(int j = 1; j < list.size(); j++){
			leftseat[1] += list.get(j).getCount();
		}
	}
	else if(pricelist.size() == 3){
		leftseat[0] = list.get(0).getCount();
		leftseat[1] = list.get(1).getCount();
		for(int j = 2; j < list.size(); j++){
			leftseat[2] += list.get(j).getCount();
		}
	}
	else if(pricelist.size() == 4){
		leftseat[0] = list.get(0).getCount();
		leftseat[1] = list.get(1).getCount();
		leftseat[2] = list.get(2).getCount();
		for(int j = 3; j < list.size(); j++){
			leftseat[3] += list.get(j).getCount();
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
          <img src="../../assets/img/ticklink/좌석선점어쩌구.png" alt="">
        </div>
        <div class="prenextbutton">
          <div><button class="prenextbtn" >이전단계</button></div>
          <div><button id="nextBtn" class="prenextbtn" onclick="">다음단계</button></div>
        </div>
      </div>
    </div>
  </div>
  
  <script>
  document.addEventListener('DOMContentLoaded', function() {
	    var images = document.querySelectorAll('.reserved');
	    var clickedSrc = '../../assets/img/ticklink/선택한좌석.png';
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

</script>
</body>
</html>