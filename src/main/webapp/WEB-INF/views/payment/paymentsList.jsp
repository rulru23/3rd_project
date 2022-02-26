<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style>

.set{
	border: 3px solid #009132;
}
 .list{
	width:50%;
	float: left;
}
.img{
	width:50%;
	float:left;
	text-align:right;
} 

.left{
	width:50%;
	float: left;
	padding-bottom: 36vh;
}
.right{
	width:50%;
	float:left;
	text-align:right;
}
</style>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

<c:set var="menu" value="" />
<div class="container mt-5">
	<h1><b>��ٱ���</b></h1> 
	<h6 style="color: grey; display:inline;">�ֹ���ȣ</h6>
	<span id="ordernum"><h6 style="color: grey; display:inline;"> ${payment.payment_id}</h6></span>
	<input type="text" style="display:none;" id = "paymentId" value="${payment.payment_id}">
	<c:choose>
		<c:when test="${na eq 'na' }">
			<h3>No List!</h3>
		</c:when>
		<c:otherwise>
			<c:set var="length" value="${fn:length(sandName)}" />
		<div id="all">
			<c:forEach var="sandName" items="${sandName}" varStatus="status">
			<c:set var="menu" value="${menu += '/'}"/>
            <c:set var="menu" value="${menu += sandName.meat}"/>
				<div class="set mt-3 mb-4" id="${status.index}" onclick="clickSet(this.id,'<c:out value="${length}"/>');">
				
					<input type="text" style="display:none;" value="" id = "sandid">
					<input type="text" style="display:none;" value="${sandList[status.index].sandwich_id}" id="id${status.index}">
					<input type="text" style="display:none;" value="" id="id">
					<input type="text" style="display:none;" value-"" id="currentprice">
					<div class="list" style="margin-top: 20px">
						<div class="sandwich">
							<h4><b>&nbsp&nbsp&nbsp${sandName.meat}</b></h4>
							<br>
							<h6>
								&nbsp&nbsp&nbsp&nbsp${sandName.bread} |
								${sandName.cheese} |
								${sandName.sauce} |
								${sandName.veg} 
							</h6>
						</div>
						<div class="side" style="color: grey;">
							&nbsp&nbsp&nbsp ${sideName[status.index].cookie} 
							${sideName[status.index].potatoe} |
							${sideName[status.index].beverage} 	
						</div>
					</div>
					<div class="img" style="margin-top: 20px">
						<img src="../images/sand1.png" width="300px">
					</div>&nbsp&nbsp&nbsp
					<span id="info${status.index}" style="color:#FFCC00">
						<h4 style="display:inline;"><b>${sandName.price}</b></h4>
					</span>
					<h4 style="display:inline; color:#FFCC00;"><b>��</b></h4> <br><br>
				</div>
			</c:forEach>
		</div>
			<div class="bottom-info" id="allinfo"> 
				<div class="left">
					<h2 style="display:inline;"><b>�� �ݾ�</b></h2>&nbsp&nbsp&nbsp&nbsp
					<span id="totalprice">
						<h1 style="color: #009132; display:inline;"><b>${payment.menu_price}</b></h1>
					</span>
					<h1 style="color: #009132; display:inline;"><b>��</b></h1>
				</div>
				<div class="right">	
						<button type="button" class="btn btn-success" style="text-align:right;" onclick="delSet()">
							<span class="iconify" data-icon="ion:close" style="color: #fc0;" data-width="40" data-height="40"></span>
							<b>&nbsp�޴� �����ϱ�</b>
						</button>
					
					&nbsp
					<a href="/board/boardMain?content_type=fast-sub">
						<button type="button" class="btn btn-success" style="text-align:right;">
							<span class="iconify" data-icon="ion:add" style="color: #FFCC00;" data-width="40" data-height="40"></span>
							<b>&nbsp�޴� �߰��ϱ�</b> <!-- ion:fast-food-outline -->
						</button>
					</a>&nbsp
						<button type="button" class="btn btn-success" style="text-align:right;" id="paymentBtn" onclick="requestPay()">
							<span class="iconify" data-icon="ion:fast-food-outline" style="color: #FFCC00;" data-width="40" data-height="40"></span>
							<b>&nbsp�����ϱ�</b>
						</button>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<script>

var totalPrice = document.getElementById("totalprice").innerText;

function clickSet(id,end){
	   for(var i = 0; i < end; i++){
	      document.getElementById(i).style.border=' 3px solid #009132';
	   }
	   document.getElementById(id).style.border=' 3px solid #FFCC00';
	   
	   var currentprice = document.getElementById("info"+id).innerText;
	   var sandId = document.getElementById("id"+id).value;
	   document.getElementById("sandid").value = sandId;
	   //console.log(document.getElementById("sandid").value);
	   //console.log(document.getElementById("info"+id));
	   
	   document.getElementById("id").value=id;
	   document.getElementById("currentprice").value = currentprice;
	   //console.log(document.getElementById("currentprice").value);
	   //console.log(document.getElementById("id").value);
	}
	
	function delSet(){
	   var setId = document.getElementById("id").value;
	   if(setId == ""){
	      alert("�������ּ���");
	      return;
	   }
	   document.getElementById(setId).style.display="none";
	   
	   var currentPrice = document.getElementById("currentprice").value;
	   //var totalPrice = document.getElementById("totalprice").innerText;
	   //var minusPrice = totalPrice - currentPrice;
	   totalPrice -= currentPrice;
	   //console.log(totalPrice)
	   document.getElementById("totalprice").innerHTML = "<h1 style='color: #009132; display:inline;'><b>"+totalPrice+"</b></h1>";
	   var sandId = document.getElementById("sandid").value;
	   var paymentId= document.getElementById("paymentId").value;
	   
	   //console.log(document.getElementById("id"));
	   //console.log(currentPrice);
	   
	   
	    $.ajax({
	        url: "/deleteSet",
	        type:"post",
	        data:{
	           id : sandId,
	           pId: paymentId,
	           cPrice: currentPrice
	        },
	        dataType: "text",
	        success: function(data) {
	        },
	        error: function() {
	            alert("error");
	        }
	    });
	   
	   if(totalPrice == 0){
	      document.getElementById("all").innerHTML = "<h3>No List!</h3>";
	      document.getElementById("allinfo").innerHTML = "";
	      document.getElementById("ordernum").innerHTML = "";   
	   }
	   
	}

</script>
<script type="text/javascript">
console.log(totalPrice);
	function requestPay() {
    	
    	let today = new Date();
    	
	    IMP.init("imp12077457"); // ��: imp00000000
		  // IMP.request_pay(param, callback) ����â ȣ��
		  
	    IMP.request_pay({
	        pg : 'html5_inicis',
	        pay_method : 'kakaopay', //card(�ſ�ī��), trans(�ǽð�������ü), vbank(�������), phone(�޴����Ҿװ���)
	        merchant_uid : 'merchant_' + today.getHours() + today.getMinutes() + today.getSeconds(), //�������� �����Ͻô� ���� �ֹ���ȣ�� ����
	        name : '������ġ',
	        amount : totalPrice,
	        buyer_email : 'iamport@siot.do',
	        buyer_name : '�������̸�',
	        buyer_tel : '010-1234-5678',
	        buyer_addr : '����Ư���� ������ �Ｚ��',
	        buyer_postcode : '123-456'
	    }, function(rsp) {
	        if ( rsp.success ) {
	        	//console.log(rsp);
	        	//[1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid �����ϱ�
	        	jQuery.ajax({
	        		url: "/payment/payProcess", //cross-domain error�� �߻����� �ʵ��� �������ּ���
	        		type: 'POST',
	        		contentType: 'application/json',
	        		dataType: 'json',
	        		data: JSON.stringify({
	    	    		imp_uid : rsp.imp_uid,
	    	    		merchant_uid : rsp.merchant_uid,
	    	    		menu_price : rsp.paid_amount,
	    	    		payment_id : ${payment.payment_id}
	    	    		//��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
	        		})
	        	}).done(function(data) {
	        		data = JSON.stringify(data);
	        		jsonData = JSON.parse(data);
	        		
 	        		//console.log('���� :' + JSON.stringify(data));
	        		//console.log('���� :' + JSON.parse(data).imp_uid);
	        		//console.log('���� :' + typeof(jsonData.everythings_fine));
	        		
	        		//[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
	        		if ( jsonData.everythings_fine == 'true' ) {
	        			
/* 	        			var msg = '������ �Ϸ�Ǿ����ϴ�.';
	        			msg += '\n����ID : ' + rsp.imp_uid;
	        			msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
	        			msg += '\���� �ݾ� : ' + rsp.paid_amount;
	        			msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
	        			
	        			console.log(msg); */
	        			alert("���� �Ϸ�");
	        			location.href = '/main/main';
	        		} else {
	        			//[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
	        			//[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
	        		}
	        	});
	        } else {
	            var msg = '������ �����Ͽ����ϴ�.';
	            msg += '�������� : ' + rsp.error_msg;
	            
	            console.log(msg);
	        }
	    });
	}
</script>

</body>
</html>