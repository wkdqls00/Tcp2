<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	function kakaopay(){
	    var IMP = window.IMP; 
	    IMP.init('imp41617173'); 
	    IMP.request_pay({
	    	pg : "kakaopay", 
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : '지수의사랑',
	        amount : 550000,
	        buyer_email : '구매자 이메일',
	        buyer_name : '구매자 이름',
	        buyer_tel : '구매자 번호',
	        buyer_addr : '구매자 주소',
	        buyer_postcode : '구매자 주소',
	        m_redirect_url : 'http://localhost:9090/Tcp2/ticketlink/Pay/prepare.html'
	    }, function(rsp) {
	        if ( rsp.success ) {
	            var msg = '결제가 완료되었습니다.';
	            alert(msg);
	            location.href='http://localhost:9090/Tcp2/ticketlink/Pay/prepare.html';
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            alert(msg);
	            rsp.error_msg;
	        } 
	    });

	}
    </script>


</head>
<body>




	<button onclick="kakaopay()">카카오페이 결제</button>

</body>
</html>