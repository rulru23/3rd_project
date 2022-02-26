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
	</head>
<body>
  <!--footer-->
  <footer>
    <div class="f_wrap">
      <div class="f_tab">
        <ul>
          <li>이용약관</li>
          <li>개인정보처리방침</li>
          <li>샌드카드</li>
          <li>점주관리자</li>
          <li>Listens</li>
        </ul>
      </div>        
      <p>서울특별시 종로구 돈화문로 26, 3~5층(묘동, 단성사) | 대표 : 6조 | 전화 : 02-000-0000 | 사업자등록번호 : 000-00-0000</p>
      <p>Copyright © SANDWAY 종로. All rights reserved.</p>
    </div>
  </footer> 
  <!--footer end-->
</body>
</html>