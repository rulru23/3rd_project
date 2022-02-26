<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 취소</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
</script>
<script	src="https://code.jquery.com/jquery-3.3.1.min.js"
  		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  		crossorigin="anonymous">
</script>
</head>
<body>
	<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">결제 날짜</th>
		      <th scope="col">주문 번호</th>
		      <th scope="col">주문 금액</th>
		      <th scope="col">아이디</th>
		    </tr>
		  </thead>
		<c:forEach var="order" items="${ orderList }">
		  <tbody>
		    <tr>
		      <td><c:out value="${ order.payment_date }"/></td>
		      <td><c:out value="${ order.payment_id }"/></td>
		      <td><c:out value="${ order.menu_price }"/></td>
		      <td><c:out value="${ order.mem_id }"/></td>
		      <td><a href="/paymet/cancelInfo/imp_uid/${order.imp_uid}/menu_price/${order.menu_price}/merchant_uid/${order.merchant_uid}/payment_id/${order.payment_id}">결제 취소</a></td>
		    </tr>
		  </tbody>
	  	</c:forEach>
	</table>
</body>
</html>