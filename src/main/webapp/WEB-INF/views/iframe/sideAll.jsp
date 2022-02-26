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
<title>Insert title here</title>

<style type="text/css">

.b_box{
      display: flex;
      flex-direction: row;
      justify-content: center;
      text-align: center;
    }

    .b_box .box ul{
      list-style-type: none;
      padding:0;    
    }

    .b_img1{      
      display: block;
   width: 180px;
      height: 180px;
      background: white;
      margin-bottom: 5px;
    }

    .box1, .box2{
      color:white;
      width: 182px;
      height: 230px;
      border: 1px solid #009132;
      margin: 10px;
      padding: 0 20;
      background: #009132;
    }
</style>    


</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

<h1 style="text-align:center">Side & Beverage</h1>
   <div class="b_box">
      <c:forEach var="bList" items="${bList}" varStatus="status">
         <div class="box1" id = "${bList.beverage_id}" onclick="bevchoice(this.id)">
            <img src="/images/drink.png" class="b_img1">
            ${bList.beverage}
         </div>   
      </c:forEach>
   </div>
   
   <div class="b_box">
      <c:forEach var="cList" items="${cList}" varStatus="status">
         <div class="box2" id = "cookie${cList.cookie_id}"  onclick="sidechoice(this.id)">
            <img src="/images/cookie.png" class="b_img1">
            ${cList.cookie}
         </div>   
      </c:forEach>
   </div>
   
   <div class="b_box">
      <c:forEach var="pList" items="${pList}" varStatus="status">
         <div class="box2" id = "potatoe${pList.potatoe_id}"  onclick="sidechoice(this.id)">
            <img src="/images/potato.png" class="b_img1">
            ${pList.potatoe}
         </div>   
      </c:forEach>
   </div>



<script>
function bevchoice(id){
   
   
   var bList = document.getElementsByClassName("box1");
   
   for(var i = 0; i < bList.length; i++){
      
      //bList[i].style.fontWeight="normal";
      //bList[i].style.color="#FFFFFF";
      
      bList[i].style.border="1px solid #009132";
      bList[i].style.background="#009132";
   }
   
   //document.getElementById(id).style.fontWeight = "bold";
   //document.getElementById(id).style.color = "#FFCC00";
   
   document.getElementById(id).style.border = "1px solid #FFCC00";
   document.getElementById(id).style.background = "#FFCC00";
   
   var breadName = document.getElementById(id).innerText;
   window.parent.document.getElementById("beverage_name").value = breadName;
   
   window.parent.document.getElementById("beverage").value = id;
   
   
}
function sidechoice(id){
   
   var bList = document.getElementsByClassName("box2");
   for(var i = 0; i < bList.length; i++){
      
      //bList[i].style.fontWeight="normal";
      //bList[i].style.color="#FFFFFF";
      
      bList[i].style.border="1px solid #009132";
      bList[i].style.background="#009132";
   }
   
   //document.getElementById(id).style.fontWeight = "bold";
   //document.getElementById(id).style.color = "#FFCC00";
   
   document.getElementById(id).style.border = "1px solid #FFCC00";
   document.getElementById(id).style.background = "#FFCC00";
   
   var breadName = document.getElementById(id).innerText;
   window.parent.document.getElementById("side_name").value = breadName;
   
   window.parent.document.getElementById("side").value = id;
   
   
}
</script>

</body>
</html>