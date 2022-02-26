<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
<style type="text/css">

.b_box{
      display: flex;
      flex-direction: row;
      justify-content: center;
      text-align: center;
      margin-top:90px;
    }

    .b_box .box ul{
      list-style-type: none;
      padding:0;    
    }

    .b_img1{      
      display: block;
      width: 200px;
      height: 200px;
      background: white;
      margin-bottom: 10px;
    }

    .box{
      color:white;
      width: 202px;
      height: 250px;
      border: 1px solid #009132;
      margin: 10px;
      padding: 0 0;
      background: #009132;
    }
</style>    
    
    
    
    
<title>Insert title here</title>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<h1 style="text-align:center">Bread</h1>
	<div class="b_box">
		<c:forEach var="bList" items="${bList}" varStatus="status">
			<div class="box" id = "${bList.bread_id}" onclick="choice(this.id)">
				<img src="/images/bread0.png" class="b_img1">
				${bList.bread}
			</div>	
		</c:forEach>
	</div>

<script>

function choice(id){
	
	var bList = document.getElementsByClassName("box");
	for(var i = 0; i < bList.length; i++){
		
/* 		bList[i].style.fontWeight="normal";
		bList[i].style.color="#FFFFFF"; */
		
		bList[i].style.border="1px solid #009132";
		bList[i].style.background="#009132";
	}
	
	//document.getElementById(id).style.fontWeight = "bold";
	//document.getElementById(id).style.color = "#FFCC00";
	
	document.getElementById(id).style.border = "1px solid #FFCC00";
	document.getElementById(id).style.background = "#FFCC00";
	
	var breadName = document.getElementById(id).innerText;
	window.parent.document.getElementById("bread_name").value = breadName;
	
	window.parent.document.getElementById("bread").value = id;
	
	
}


</script>


		

</body>
</html>