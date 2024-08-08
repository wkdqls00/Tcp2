<%@page import="java.util.ArrayList"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제단계3</title>
  <link rel="stylesheet" href="/Tcp2/assets/css/payment_p3.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%
int payment_idx = (int)request.getAttribute("pm");
@SuppressWarnings("unchecked")
ArrayList<SelectPayment_p2DTO> p2dto = (ArrayList<SelectPayment_p2DTO>)request.getAttribute("p2dto");
@SuppressWarnings("unchecked")
ArrayList<ReservedSeatInfoDTO> rsidto = (ArrayList<ReservedSeatInfoDTO>)request.getAttribute("rsidto");
String time_limit = (String)request.getAttribute("time_limit");
int total_amount = (int)request.getAttribute("total_amount");
@SuppressWarnings("unchecked")
ArrayList<CustomerPayinfoDTO> cpdto = (ArrayList<CustomerPayinfoDTO>)request.getAttribute("cpdto");
@SuppressWarnings("unchecked")
ArrayList<SeatPriceDTO> pricelist = (ArrayList<SeatPriceDTO>)request.getAttribute("pricelist");
String address = (String)request.getAttribute("address");

%>
  <header>
    <img src="/Tcp2/assets/img/ticklink/종튼.png" alt=""> 
  </header>
  <div class="paystepup3">
    <img src="/Tcp2/assets/img/ticklink/결제단계3.png" alt="">
  </div>
  <main>
    <div class="main_1">
      <div class="howtoreceive">수령방법</div>
      <div class="howtoreceivebox">
        <div class="ticket">티켓</div>
        <div class="pickupbox">현장수령</div>
      </div>
      <div class="pickupnotice">*티켓은 관람일 당일 현장에서 예매번호 및 본인확인 후 수령할 수 있습니다.</div>
      <div class="ordererinformation">주문자 정보</div>
      <div class="ordererinformationbox1">
        <div class="orderername">이름<span class="colred">*</span></div>
        <div class="orderernameresult" id="name"><%=cpdto.get(0).getName()%></div>
        <div class="phonenumber">휴대폰번호<span class="colred">*</span></div>
        <div><input type="text" value="<%=cpdto.get(0).getPhone()%>" class="inputphonenumber" id="phonenumber"></div>
      </div>
      <div class="ordererinformationbox2">
        <div class="orderername">이메일</div>
        <div><input type="text" value="<%=cpdto.get(0).getEmail()%>" class="inputemail" id="emailInput"></div>
      </div>
 
      <div class="ordererok">예매자 확인</div>
      <div class="agreebox1">
        <div class="checkboxdiv1"><input type="checkbox"></div>
        <div class="agreecheck1">주문자 확인 및 예매처리를 위해 휴대폰번호,이메일,(배송수령 시)주소,(입력필요 시)생년월일을 수집하며,<br/>
        이용목적 달성 이후 파기합니다.</div>
      </div>
      <div class="agreebox2">
        <div class="checkboxdiv2"><input type="checkbox"></div>
        <div class="agreecheck2">개인정보 제 3자 제공에 동의합니다.(고객응대 및 관람정보안내 등을 위함)</div>
      </div>
    </div>
    <div class="main_2">
      <div class="titleimgbox">
        <div>
          <img src="<%=p2dto.get(0).getPoster_url()%>" alt="" style="width: 41px; height: 50px;">
        </div>
        <div><%=p2dto.get(0).getName()%></div>
      </div>
      <div class="reservationinfo">
        예매정보
      </div>
   <div class="reservationinfoborder">

      <%
      System.out.println(rsidto.size());
      for(int i = 0; i < rsidto.size(); i++){ 
    	    String seatrank = "";
    		switch(pricelist.size()){
    		case 1 : {
    			seatrank = "전";
    			break;			
    		}
    		case 2 : {
    			seatrank = rsidto.get(i).getRank().equals("VIP") ? "VIP" : "R";
    			break;
    		}
    		case 3 : {
    			seatrank = rsidto.get(i).getRank().equals("VIP") ? "VIP" : (rsidto.get(i).getRank().equals("R") ? "R" : "S");
    			break;
    		}
    		default : {
    			seatrank = rsidto.get(i).getRank();
    		}
        }
      %>
      
	     <div class="reservationinfodiv">
	        <div class="reservationinfoborder1"><%=seatrank%>석</div>
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
        <div><span id=totalAmount><%=String.format("%,d", total_amount)%> </span>원</div>
      </div>
      <div class="divhrblack"></div>
      <div class="cancel"><span class="canceltitle">취소기한:</span><%=time_limit%></div>
      <div class="cancel" style="margin-top: 0px;"><span class="canceltitle">취소수수료:</span>티켓금액의 0%~30%</div>
      <div class="agreebox3">
        <div class="checkboxdiv3"><input type="checkbox"></div>
        <div class="agreecheck3">취소기한 및 취소수수료 동의</div>
      </div>
      <!--<div class="payselect">
        <label>
            <input type="radio" name="payment" value="naverpay" required>
            네이버페이로 결제하기
        </label><br>
        </div>-->
        <div class="payselect">
        <label>
            <input type="radio" name="payment" value="kakaopay">
            카카오페이로 결제하기
        </label><br>
        </div>
      <div class="prenextbutton">
        <div><button class="prenextbtn" onclick="history.back()">이전단계</button></div>
        <div><button class="redprenextbtn" onclick="checkCheckboxes()">결제하기</button></div>
        
      </div>
    </div>
  </main>

<script>
        function checkCheckboxes() {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
            const paymentOptions = document.getElementsByName('payment');
			const price = <%=total_amount%>;
            let selectedPayment = null;
            
            for (let i = 0; i < paymentOptions.length; i++) {
                if (paymentOptions[i].checked) {
                    selectedPayment = paymentOptions[i].value;
                    break;
                }
            }

            if (allChecked) {
                if (selectedPayment == null){
                	alert("결제수단을 선택해주세요.");
                	return;
                }
                if (price === 0){
                	alert('무료 공연 입니다!')
    	            location.href='http://localhost:9090/Tcp2/Payment_p3?pm=<%=payment_idx%>&type=x';
                }
                if (selectedPayment === 'kakaopay'){
                	kakaopay();
                }
                else if (selectedPayment === 'naverpay'){
                	naverpay();
                }
           	} else {
               	alert("모든 약관에 동의하셔야 합니다.");
       		}
        }
        
    	function kakaopay() { 
    		const email = document.getElementById('emailInput').value;
    		const name = document.getElementById('name').innerText;
    		const phonenumber = document.getElementById('phonenumber').value;
    	    var IMP = window.IMP; 
    	    IMP.init('imp41617173'); 
    	    IMP.request_pay({
    	    	pg : "kakaopay", 
    	        pay_method : 'card',
    	        merchant_uid : 'merchant_' + new Date().getTime(),
    	        name : '<%=p2dto.get(0).getName()%>',
    	        amount : <%=total_amount%>,
    	        buyer_email : email,
    	        buyer_name : name,
    	        buyer_tel : phonenumber,
    	        buyer_addr : '<%=address%>',
    	        buyer_postcode : '구매자 주소',
    	        m_redirect_url : 'http://localhost:9090/Tcp2/Payment_p3?pm=<%=payment_idx%>&type=kakaopay'
    	    }, function(rsp) {
    	        if ( rsp.success ) {
    	            location.href='http://localhost:9090/Tcp2/Payment_p3?pm=<%=payment_idx%>';
    	        } else {
    	            var msg = '결제에 실패하였습니다.';
    	            alert(msg);
    	            rsp.error_msg;
    	        } 
    	    });

    	}
            

    		
</script>


</body>
</html>