<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/member/login.css">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script><!-- jQuery CDN --->
</head>
<body>
	<jsp:include page="../fragments/header.jsp"/>
	<main>
		<div class="login_box">
			<a href="/main/main"><img src="/images/sand_img.png" alt="이미지" class="bm_img"></a>
				<div class="input_aera">
	            	<input type="text" class="mem_id" id="insertId" onkeyup="getValue()" maxlength="20"  placeholder="아이디를 입력해 주세요" required>
            	</div>          
	               
				<div class="input_aera">
					<input type="password" class="mem_pw1" id="insertPw" onkeyup="getValue()" maxlength="20"  placeholder="비밀번호를 입력해 주세요" required>
				</div>
               	<div class="input_aera">
               		<input type="text"  class="mem_name" id="insertName" onkeyup="getValue()" placeholder="이름을 입력해주세요" required>
              	</div>
	               
				<div class="input_aera">
					<input type="text" class="mem_tel" id="insertTel" onkeyup="getValue()" maxlength="20"  placeholder="전화번호를 입력해주세요" required>
				</div>
	               
				<div class="input_aera">
					<input type="text"  class="mem_address" id="insertAddress" onkeyup="getValue()" placeholder="주소를 입력해주세요" required>
                </div>
                <button id="joinBtn" onclick="memJoin()">회원가입</button>
        </div>
    </main>
    <jsp:include page="../fragments/footer.jsp"/>
    
	<script type="text/javascript">
		var mem_id;
		var mem_pw;
		var mem_name;
		var mem_tel;
		var mem_address;
		
		function getValue()  {
			  mem_id = document.getElementById('insertId').value;
			  mem_pw = document.getElementById('insertPw').value;
			  mem_name = document.getElementById('insertName').value;
			  mem_tel = document.getElementById('insertTel').value;
			  mem_address = document.getElementById('insertAddress').value;
		}
		
		function memJoin() {
		    jQuery.ajax({
		        "url": "/login/joinCheck", // 예: http://www.myservice.com/payments/cancel
		        "type": "POST",
		        "contentType": "application/json",
		        "data": JSON.stringify({
		          "mem_id": mem_id,
		          "mem_pw": mem_pw,
		          "mem_name": mem_name,
		          "mem_tel": mem_tel,
		          "mem_address": mem_address
		        }),
		        "dataType": "json"
			}).done(function(data) {
	    		data = JSON.stringify(data);
	    		jsonData = JSON.parse(data);
	    		
	    		if(jsonData.success){
	    			alert(jsonData.success);
	    			location.href = "/";
	    		}else{
	    			alert(jsonData.error);
	    		}

	    	});
		}
	</script>
	
</body>
</html>