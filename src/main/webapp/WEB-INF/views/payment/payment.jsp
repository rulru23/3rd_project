<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#paymentBtn").click(function(){
			requestPay();
		})
	})

    //var IMP = window.IMP; // 생략 가능
	function requestPay() {
    	
    	let today = new Date();
    	
	    IMP.init("imp12077457"); // 예: imp00000000
		  // IMP.request_pay(param, callback) 결제창 호출
		  
	    IMP.request_pay({
	        pg : 'html5_inicis',
	        pay_method : 'kakaopay', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
	        merchant_uid : 'merchant_' + today.getHours() + today.getMinutes() + today.getSeconds(), //상점에서 관리하시는 고유 주문번호를 전달
	        name : '주문명:결제테스트',
	        amount : 100,
	        buyer_email : 'iamport@siot.do',
	        buyer_name : '구매자이름',
	        buyer_tel : '010-1234-5678',
	        buyer_addr : '서울특별시 강남구 삼성동',
	        buyer_postcode : '123-456'
	    }, function(rsp) {
	        if ( rsp.success ) {
	        	//console.log(rsp);
	        	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	        	jQuery.ajax({
	        		url: "/payment/payProcess", //cross-domain error가 발생하지 않도록 주의해주세요
	        		type: 'POST',
	        		contentType: 'application/json',
	        		dataType: 'json',
	        		data: JSON.stringify({
	    	    		imp_uid : rsp.imp_uid,
	    	    		merchant_uid : rsp.merchant_uid,
	    	    		menu_price : rsp.paid_amount
	    	    		//기타 필요한 데이터가 있으면 추가 전달
	        		})
	        	}).done(function(data) {
	        		data = JSON.stringify(data);
	        		jsonData = JSON.parse(data);
	        		
 	        		//console.log('성공 :' + JSON.stringify(data));
	        		//console.log('성공 :' + JSON.parse(data).imp_uid);
	        		//console.log('성공 :' + typeof(jsonData.everythings_fine));
	        		
	        		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	        		if ( jsonData.everythings_fine ) {
	        			
/* 	        			var msg = '결제가 완료되었습니다.';
	        			msg += '\n고유ID : ' + rsp.imp_uid;
	        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	        			msg += '\결제 금액 : ' + rsp.paid_amount;
	        			msg += '카드 승인번호 : ' + rsp.apply_num;
	        			
	        			console.log(msg); */
	        			alert("결제 완료");
	        			location.href = '/';
	        		} else {
	        			//[3] 아직 제대로 결제가 되지 않았습니다.
	        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	        		}
	        	});
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            
	            console.log(msg);
	        }
	    });
	}
</script>
<title>결제</title>
</head>
<body>
	<button onclick="requestPay()" id="paymentBtn">결제하기</button>
</body>
</html>