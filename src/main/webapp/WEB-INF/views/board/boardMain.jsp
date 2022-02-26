<%@ page language="java" contentType="text/html; charset=UTF-8"
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
    
<title>${content_type}</title>

<style>

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}

#plus-container{
   text-align: center;
}

#plus {
  background-color:#009132;
  text-align: center;
  display:block;
  height: 100px;
  width: 100px;
  line-height: 100px;
  border-radius: 50%;
  /*background:url(/images/plus.png) center 100%;*/
  display:inline-block;
  
}

   figure { transition: opacity 0.2s; position: relative; margin: 0;}
   
   figure figcaption {color: #009132;bottom: 70px; opacity: 0;position: absolute; text-align: center; width: 100%;transition: all .3s ease; line-height: 180px;}

    figure:hover img {transform: scale(1.0, 1.0);transition: all .3s ease;opacity: 0.15;}

    figure:hover figcaption {opacity: 1;transition: all .3s ease; line-height: 180px;}

</style>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

<div class="container" id="top"> 
   <h1>${fn:toUpperCase(content_type)}</h1>
   <hr>
   <h3>
   <span onclick="showAll('${fn:length(bList)}')" style="cursor:pointer;">전체보기</span> |
   <c:choose>
      <c:when test="${content_type eq 'menu' || content_type eq 'fast-sub'}">
      
         <span onclick="showCategory('classic', 'premium', 'fresh')" style="cursor:pointer;">Classic</span> | 
         <span onclick="showCategory('premium', 'classic', 'fresh')" style="cursor:pointer;">Premium</span> | <span onclick="showCategory('fresh', 'classic', 'premium')" style="cursor:pointer;"> Fresh</span>
      
      </c:when>
      <c:when test="${content_type eq 'side'}">
      
         <span onclick="showCategory('potatoe', 'cookie', 'beverage')">감자</span> | 
         <span onclick="showCategory('cookie', 'potatoe', 'beverage')">쿠키</span> | <span onclick="showCategory('beverage', 'potatoe', 'cookie')">음료</span>
      
      </c:when>
      <c:when test="${content_type eq 'event'}">
      
         <span onclick="showCategory('event', 'promotion', 'end')">이벤트</span> | 
         <span onclick="showCategory('promotion', 'event', 'end')">프로모션</span> | <span onclick="showCategory('end', 'promotion', 'event')">종료</span>
      
      </c:when>
      <c:otherwise>
      </c:otherwise>
   </c:choose>
   </h3>
</div>

<div class="container" id="middle">
   <!-- Meat Board -->
      <div class="row mt-5 mb-5">
         <c:forEach items="${bList}" var="bList" varStatus="status">
                  
            <div class="col-lg-4 mb-4 ${fn:toLowerCase(bList.board_category)}" style="${status.count > 6 ? 'display:none;' : 'display:block;'}" 
            id="eventCard${status.count}">
            <figure> 
            <a href="board?content_type=${content_type}&board_id=${bList.board_id}">
               <div class="card">
                 <h4><b>
                 <figcaption>
                  Detail
                 </figcaption>
                 </h4></b>
                 <img src="../images/tuna.png" class="card-img-top" height="250px">
                 
                 <div class="card-body" style="text-align:center">
                   <p class="card-text">
                      <h4><b>${bList.board_title}</b></h4>
                      <h5>${bList.board_category}</h5>
                   </p>
                 </div>
               </div>
            </a>
            </figure>
            </div>   
         </c:forEach>
      </div>
   <!-- Meat Board End -->
</div>

<!--Event plus-->
<!-- https://icon-sets.iconify.design/ion/add/ -->
<div id="plus-container">
   <a href="#" onclick="return false">
      <span id="plus" onclick="plusEvent('${fn:length(bList)}')">
         <span class="iconify" data-icon="ion:add" style="color: #FFCC00;" data-width="70" data-height="70"></span>
      </span>
   </a>
</div>
<!--Event plus End -->

<select onchange="checkAlert(event)">
  <option value="">선택</option>
  <option value="1">Test</option>
  <option value="2">Say Hello</option>
</select>

<script>


function checkAlert(evt) {
     if (evt.target.value === "1") {
       alert('Test');
     }else if(evt.target.value === "2"){
        alert("Hello");
     }
}

var status = 'all';
var numOfCard = 7;
function plusEvent(length){
   if(status == 'all'){
      showAllPlusEvent(length);
   }else{
      showCatePlusEvent();
   }
}

function showAllPlusEvent(length){
   if(numOfCard <= length){
      for(var i =0; i< 3; i++){
         if(document.getElementById("eventCard"+numOfCard) == null){
            return;
         }
         document.getElementById("eventCard"+numOfCard).style.display="block";
         numOfCard++;
      }
   }else{
      alert("No More Event!");
   }
}

function showCatePlusEvent(){
   var stop = 0;
   var category = document.getElementsByClassName(status);
   for(var i = 0; i < category.length; i++){
      if(stop == 3){
         return;
      }
      if(category[i].style.display == 'none'){
         category[i].style.display = 'block';
         stop++;
      }
   }
   if(stop == 0){
      alert("No More Event!");
   }
}

function display(menuCard){
   var length;
   
   if(menuCard.length > 6){
      length = 6;
   }else{
      length = menuCard.length;
   }
   for (var i = 0; i < length; i++){
      menuCard[i].style.display = "block";
   }
   for(var j = length; j < menuCard.length; j++){
      menuCard[i].style.display = "none";
   }
}

function hide(menuCard){
   for (var i = 0; i < menuCard.length; i++){
      menuCard[i].style.display = "none";
   }
}

function showAll(length){
   status='all';
   var size;
   if(length > 7){
      size = 7;
      for(var i = 1; i < size; i++){
         document.getElementById("eventCard"+i).style.display = "block";
      }
      for(var j = size; j <= length; j++){
         document.getElementById("eventCard"+j).style.display = "none";
      }
   }else{
      size = length;
      for(var i = 1; i < size; i++){
         document.getElementById("eventCard"+i).style.display = "block";
      }
   }
}

function showCategory(category, otherC1, otherC2){
   status = category;
   numOfCard=7;
   var menuCard = document.getElementsByClassName(category);
   var other = document.getElementsByClassName(otherC1);
   var other2 = document.getElementsByClassName(otherC2);
   
   display(menuCard);
   hide(other);
   hide(other2);   
}
</script>




</body>
</html>