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
		        	<input type="text" id="insertId" onkeyup="getValue()" required placeholder="아이디를 입력해 주세요" maxlength="30" >
		        </div>
		        <div class="input_aera">
		        	<input type="password" id="insertPw" onkeyup="getValue()" required placeholder="비밀번호를 입력해 주세요" maxlength="30"></div>
					<button id="checkBtn" onclick="memCheck()">로그인</button>
				<div>
			<a href="/join" >회원 가입하러 가기</a></div>
		</div>
	</main>
	<jsp:include page="../fragments/footer.jsp"/>
	<script type="text/javascript">
		var mem_id;
		var mem_pw;
		
		function getValue()  {
			  mem_id = document.getElementById('insertId').value;
			  mem_pw = document.getElementById('insertPw').value;
		}
		
		function memCheck() {
		    jQuery.ajax({
		        "url": "/login/memCheck", // 예: http://www.myservice.com/payments/cancel
		        "type": "POST",
		        "contentType": "application/json",
		        "data": JSON.stringify({
		          "mem_id": mem_id,
		          "mem_pw": mem_pw
		        }),
		        "dataType": "json"
			}).done(function(data) {
	    		data = JSON.stringify(data);
	    		jsonData = JSON.parse(data);
	    		
	    		if(jsonData.success){
	    			//$('#header').load(location.href+' #header');
	    			location.href = "/";
	    		}else{
	    			alert(jsonData.error);
	    		}

	    	});
		}
	</script>
</body>
</html>