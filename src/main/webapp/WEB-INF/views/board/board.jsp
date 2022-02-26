<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
      .background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 1000;

        /* 숨기기 */
        z-index: -1;
        opacity: 0;
      }

      .show {
        opacity: 1;
        z-index: 1000;
        transition: all 0.5s;
      }

      .window {
        position: relative;
        width: 100%;
        height: 100%;
      }

      .popup1, .popup2, .popup3, .popup4, .popup5 {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #ffffff;
        box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);

         /* 임시 지정 */
        width: 1200px;
       height: 600px;

        /* 초기에 약간 아래에 배치 */
        transform: translate(-50%, -40%);
        
      }

      .show .popup {
        transform: translate(-50%, -50%);
        transition: all 0.5s;
      }
   .chart{
      background-color: #f6f6f6;
   }
   .nutrition{
      margin-left: 50px;
      margin-right: 50px;
   }
   .btn-value{
      font-weight:bold;
      font-size: large;
   }
   
   #next, #prev {
     background-color:#009132;
     text-align: center;
     display:block;
     height: 100px;
     width: 100px;
     line-height: 95px;
     border-radius: 50%;
     /*background:url(/images/plus.png) center 100%;*/
     display:inline-block;
     
   }
   
   iframe{
      margin-top: 30px;
      width : 900px;
      height: 500px;
   }
         
</style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.iconify.design/2/2.1.2/iconify.min.js"></script>

<div class="container" style="text-align:center">
   <div class="name">
      <div class="title">
         <h1><b>${board.board_title}</b></h1>
      </div>
      <div class="price mt-3">
         <h4>${board.board_category} | &#8361;${board.board_price}</h4>
      </div>
   </div>
   <div class="image">
      <img src="../images/tuna.png" height="300px" width="400px"><br>   
   </div>
   <div class="content">
      <h4>${board.board_content}</h4>   
   </div>
   <c:if test="${content_type ne 'event'}">
   <div class="chart mt-5 mb-5">
   <br>
   <div class="margin-container">
   <div class="nutrition mt-5 mb-5">
      <h2>영양 성분표</h2><br>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">중량(g)</th>
            <th scope="col">열량(kcal)</th>
            <th scope="col">단백질(g)</th>
            <th scope="col">포화지방(g)</th>
            <th scope="col">당류(g)</th>
            <th scope="col">나트륨(mg)</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>228</td>
            <td>338</td>
            <td>21 (38%)</td>
            <td>5.9 (38%)</td>
            <td>8.6 (38%)</td>
            <td>1064 (35%)</td>
          </tr>
        </tbody>
      </table>
      

   </div>
   
      <div class="info mb-5">
         *영양 성분은 제가 아무렇게나 적은 것입니다. 이 내용에 대한 책임은 본 제작사에게 없으며, 실제로 먹을일은 없으니 안심하셔도 됩니다. <br>
         *알러지 반응에 대한 결과는 모르겠네요. 우리나라 사람은 어차피 알러지 반응이 크게 없어서 신경 안써도 됩니다. <br>
         *중량의 경우 표준 레시피 기준이나, 지점의 직원의 제작에 따라 조금씩 다를 수 있음을 상기 시켜 드립니다. <br>
         *괄호 속 %는 1일 영양소 기준치에 대한 비율 입니다
      </div>
   <br>
   </div>
   </div>
   </c:if>

   <c:if test="${content_type eq 'fast-sub'}">
      <button id="show" type="button" class="btn btn-success" onclick="insertPayment()">&nbsp
         <span class="iconify" data-icon="ion:restaurant-outline" style="color: #fc0; font-size: 34px;"></span>
         <span class="btn-value">Fast-Sub</span>&nbsp
      </button>
             
       <div class="background" >
         <div class="window">
            <div id="btn-close" style="text-align:right">
               <span id="close">
                  <span class="iconify" data-icon="ion:close-outline" style="color: lightgray;" data-width="70" data-height="70"></span>
               </span>
            </div>
            <form action="/paymentsProcess" method="post">
            
               <input type="text" style="display:none" id="payment_id" value="na" name="payment_id">
               <input type="text" style="display:none" id="meat" value="${board.board_title}" name="meat">
            <input type="text" style="display:none" id="price" value="${board.board_price}" name="menu_price"> 
            
            <input type="text" style="display:none" class="choice" id="bread" value="na" name="bread_id">
            <input type="text" style="display:none" id="bread_name" value="na" name="bread_name">
            
            <input type="text" style="display:none" class="choice" id="cheese" value="na" name="cheese_id">
            <input type="text" style="display:none" id="cheese_name" value="na" name="cheese_name">
            
            <input type="text" style="display:none" class="choice" id="sauce" value="na" name="sauce_id">
            <input type="text" style="display:none" id="sauce_name" value="na" name="sauce_name">
            
            <input type="text" style="display:none" class="choice" id="veg" value="na" name="veg_id">
            <input type="text" style="display:none" id="veg_name" value="na" name="veg_name">
            
            <input type="text" style="display:none" class="choice" id="side" value="na" name="side_id">
            <input type="text" style="display:none" id="side_name" value="na" name="side_name">
            
            <input type="text" style="display:none" class="choice" id="beverage" value="na" name="beverage_id">
            <input type="text" style="display:none" id="beverage_name" value="na" name="beverage_name">
            
            
              <div class="popup1" style="display:block;">
                 <span id="next" style="visibility:hidden;">[next]</span>  
                 <iframe src="/iframe/breadAll" id="breadAll"></iframe>
                 <span id="next" onclick="next(1)">
                    <span class="iconify" data-icon="ion:chevron-forward" style="color: #fc0;" data-width="70" data-height="70"></span>
                 </span>
                              
              </div>
              <div class="popup2" style="display:none">
                 <span id="prev" onclick="prev(2)">
                 <span class="iconify" data-icon="ion:chevron-back-outline" style="color: #fc0;" data-width="70" data-height="70"></span>
                 </span>
                 <iframe src="/iframe/cheeseAll"></iframe>
                   <span id="next" onclick="next(2)">
                      <span class="iconify" data-icon="ion:chevron-forward" style="color: #fc0;" data-width="70" data-height="70"></span>
                   </span>
                   
              </div>
              <div class="popup3" style="display:none">
                 <span id="prev" onclick="prev(3)">
                 <span class="iconify" data-icon="ion:chevron-back-outline" style="color: #fc0;" data-width="70" data-height="70"></span>
                 </span>
                 <iframe src="/iframe/sauceAll"></iframe>   
                 <span id="next" onclick="next(3)">
                    <span class="iconify" data-icon="ion:chevron-forward" style="color: #fc0;" data-width="70" data-height="70"></span>
                 </span>
                           
              </div>
                <div class="popup4" style="display:none">
                 <span id="prev" onclick="prev(4)">
                 <span class="iconify" data-icon="ion:chevron-back-outline" style="color: #fc0;" data-width="70" data-height="70"></span>
                 </span>
                 <iframe src="/iframe/vegAll"></iframe>   
               <span id="next" onclick="next(4)">
                  <span class="iconify" data-icon="ion:chevron-forward" style="color: #fc0;" data-width="70" data-height="70"></span>
               </span>
                         
              </div>
              <div class="popup5" style="display:none">
                 <span id="prev" onclick="prev(5)">
                 <span class="iconify" data-icon="ion:chevron-back-outline" style="color: #fc0;" data-width="70" data-height="70"></span>
                 </span>
                 <iframe src="/iframe/sideAll"></iframe>
               <span id="next" style="visibility:hidden;">[next]</span>
               <button id="chocieSubmit" type="button" class="btn btn-success" style="margin-botton:100px;" onclick="check()">&nbsp
                  <span class="iconify" data-icon="ion:restaurant-outline" style="color: #fc0; font-size: 34px;"></span>
                  <span class="btn-value">Fast-Sub</span>&nbsp
               </button>                                
              </div>
              
   
                                     
           </form>
         </div>
       </div>      
   </c:if>&nbsp&nbsp&nbsp
   
   <a href="boardMain?content_type=${content_type}">
      <button type="button" class="btn btn-success">&nbsp
         <span class="iconify" data-icon="ion:list-sharp" style="color: #fc0; font-size: 34px;"></span>
         <span class="btn-value">목록보기</span>&nbsp
      </button>
   </a>
</div>

<script>
window.onload = function(){
   //console.log(document.getElementById("breadAll").contentWindow.document.getElementById("bread1"));
}

//console.log(document.getElementById("bread").value);

window.onkeydown=function(event){
   var esc = 27;
    if(event.keyCode == esc){
         close();
    }

};

function insertPayment(){
    $.ajax({
        url: "/insertInitialPayments",
        type:"post",
        data:{},
        dataType: "text",
        success: function(data) {
        	console.log(data);
           document.getElementById("payment_id").value = data;
        },
        error: function() {
            alert("error");
        }
    });
}

function check(){
   var side = document.getElementById("side").value;
   var bev = document.getElementById("beverage").value;
   if(side == 'na' || bev == 'na'){
      alert("선택해주세요");
      return;
   }else{
      document.getElementById("chocieSubmit").type="submit";
   }
}

function next(i){
   var nextPop = i + 1;
   
   var choice = document.getElementsByClassName("choice");
   
   if(choice[i-1].value == 'na'){
      alert("선택해 주세요");
      return;
   }
   
   var current = document.getElementsByClassName("popup"+i);
   var next = document.getElementsByClassName("popup"+nextPop);
   
   current[0].style.display = "none";
   next[0].style.display = "block";
   

}

function prev(i){
   var prevPop = i - 1;
   
   var current = document.getElementsByClassName("popup"+i);
   var next = document.getElementsByClassName("popup"+prevPop);
   
   current[0].style.display = "none";
   next[0].style.display = "block";
}

function show() {
    document.querySelector(".background").className = "background show";
  }

function close() {
    document.querySelector(".background").className = "background";
    
    var pop1 = document.getElementsByClassName("popup"+1);
    pop1[0].style.display="block";
    
    var numOfPop = 5+1;
    for(var i = 2; i < numOfPop; i++){
       var pop = document.getElementsByClassName("popup"+i);
       pop[0].style.display="none";
    }
    window.location.reload();
  }

  document.querySelector("#show").addEventListener("click", show);
  document.querySelector("#close").addEventListener("click", close);
</script>

</body>
</html>