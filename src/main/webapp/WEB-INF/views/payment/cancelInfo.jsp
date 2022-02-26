<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script><!-- jQuery CDN --->
</head>
<body>
<!-- onclick을 통해서 reason value 가져오고 ajax로 데이터 restcontroller에 넘기기 -->
	결제 취소 사유 : <input id="reasonTxt" onkeyup="printTxt()">
	<button id="cancelBtn" onclick="cancelPay()">환불하기</button>
<script type="text/javascript">
	var reason;
	function printTxt()  {
		  reason = document.getElementById('reasonTxt').value;
	}
	
	function cancelPay() {
		//console.log(reason);
	    jQuery.ajax({
	        "url": "/payment/cancelProcess", // 예: http://www.myservice.com/payments/cancel
	        "type": "POST",
	        "contentType": "application/json",
	        "data": JSON.stringify({
	          "payment_id": "${payment_id}",
	          "imp_uid": "${imp_uid}",
	          "merchant_uid": "${merchant_uid}", // 예: ORD20180131-0000011
	          "cancel_request_amount": ${menu_price}, // 환불금액
	          "reason": reason, // 환불사유
	          "refund_holder": "가상계좌 예금주", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
	          "refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
	          "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
	        }),
	        "dataType": "json"
		}).done(function(data) {
    		data = JSON.stringify(data);
    		jsonData = JSON.parse(data);
    		
    		console.log(jsonData);
    		
    		if ( jsonData.everythings_fine ) {
    			$.ajax({
    				"url": "/payment/cancelProcess",
    				"type": "POST",
    				"contentType": "application/json",
    				"data": JSON.stringify({
    					"reason": jsonData.reason,
    					"imp_uid": jsonData.imp_uid,
    					"amount" : jsonData.amount
    				}),
    				"dataType": "json"
    			}).done(function (data) {
    	    		data = JSON.stringify(data);
    	    		jsonData = JSON.parse(data);
    	    		
    	    		alert("결제취소 완료");
    	    		location.href="/";
				})
    			
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    	});
	}
</script>
<br>
${imp_uid }
</body>
</html>