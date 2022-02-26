<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/css/main/main.css"/>

<% String user = (String)session.getAttribute("user");%>

</head>
<body>
	<!-- main-content -->
  <main class="main-content">

    <!-- event banner -->
      <div class="main_tap_event_wrapper">
        <img class="bn" src="${path}/images/main/bn/bn_1.png">
      </div>
    <!-- event banner end -->
    
    <!-- section menu -->
    <section class="section_menu">

          <div class="sub_hd">
            <h2 class="sub_title">SAND MENU</h2>
                <div class="sub_tab">
                  <ul>
                    <li class="active"><a href="#">클래식</a></li>
                    <li class="active"><a href="#">프레쉬</a></li>
                    <li class="active"><a href="#">프리미엄</a></li>
                  </ul>
                </div>
          </div> 
          <div class="sub_img">        
            <ul>
              <li class="active"  id="sand1">
                <a href="#">
                  <div class="wrap">
                      <div>
                        <img src="${path}/images/main/menu/sand1.png"/>
                      </div>
                      <strong class="menu">더블햄치즈</strong>
                      <p>샌드위치 </p>
                  </div>
                </a>
              </li>

              <li class="active" id="sand2">
                <a href="#">
                  <div class="wrap">
                      <div>
                        <img src="${path}/images/main/menu/sand2.png"/>
                      </div>
                      <strong class="menu">치킨 바게트</strong>
                      <p>샌드위치 </p>
                  </div>
                </a>
              </li>

              <li class="active" id="sand3">
                <a href="#">
                  <div class="wrap">
                      <div>
                        <img src="${path}/images/main/menu/sand3.png"/>
                      </div>
                      <strong class="menu">오리지널</strong>
                      <p>샌드위치 </p>
                  </div>
                </a>
              </li>

              <li class="active" id="sand4">
                <a href="#">
                  <div class="wrap">
                      <div>
                        <img src="${path}/images/main/menu/sand4.png"/>
                      </div>
                      <strong class="menu">베이컨 치아바타</strong>
                      <p>샌드위치 </p>
                  </div>
                </a>
              </li>            
            </ul>
          </div>          
    </section>
    <!--section menu end -->
    <hr>
    <aside class="quick_link">
      <ul>
        <li class="qm01">
          <a href="#">
            <div class="icon">
              <img src="${path}/images/main/icon/open.png">
            </div>
              <strong>프랜차이즈</strong>
              <span>투자정보</span>            
          </a>
        </li>
        <li class="qm02">
          <a href="#" >
            <div class="icon">
              <img src="${path}/images/main/icon/location.png">
            </div>
              <strong>지사안내</strong>
              <span>수도권/지방 지사정보</span>            
          </a>
        </li>
        <li class="qm03">
          <a href="#">
            <div class="icon">
              <img src="${path}/images/main/icon/video.png">
            </div>
              <strong>광고영상</strong>
              <span>TV광고/동영상</span>            
          </a>
        </li>
        <li class="qm04">
          <a href="#">
            <div class="icon">
              <img src="${path}/images/main/icon/qa.png">
            </div>
              <strong>고객문의</strong>
              <span>자주하는 질문</span>            
          </a>
        </li>
      </ul> 
    </aside>

  </main>
  <!--main-content end-->
</body>
</html>