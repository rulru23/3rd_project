<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
	  <meta charset="UTF-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <!-- <link rel="stylesheet" href="style.css"> -->
	  <c:set var="path" value="${pageContext.request.contextPath}"/>
	  <link rel="stylesheet" href="${path}/css/main/index.css"/>
	  <title>SANDWAY</title>
	  <% String user = (String)session.getAttribute("user");%>
	</head>
<body>
  <!--header-->
  <header class="h_wrap">
    <div id="header">
      <div class="h_top">
          <div id="logo"><a data-url="main/main" href="/">SANDWAY</a></div>
         	<div id="util">
		    	<%if (user == null){ %>
		            <a id="900" href="/login">로그인</a>
		            <a id="900" href="/join">회원가입</a>
				<%}else{ 			 %>
		        	ID : <%=user %> 
		        	<a href="/logout">로그아웃</a>
		        	<%if(user.equals("admin")){%>
		        		<a href="/payment/adminPayCancel">주문 취소</a>
		        	<%}else{ %>
		        		<a data-url="/allPayments">장바구니</a>
		        	<%} %>
				<%}%>
          </div>
      </div>
        <div class="menu_wrap">
          <nav class="menu_bar">
            <a data-url="board/boardMain?content_type=menu">메인 메뉴</a>
            <a data-url="board/boardMain?content_type=side">사이드 메뉴</a>
            <a data-url="">가맹점</a>
            <a data-url="board/boardMain?content_type=event">이벤트</a>
            <a data-url="board/boardMain?content_type=fast-sub">온라인 주문</a>
          </nav>
        </div>
    </div>
  </header>
  <!--header end-->
</body>
</html>