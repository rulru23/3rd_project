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
	   <link rel="stylesheet" href="style.css">
	  <c:set var="path" value="${pageContext.request.contextPath}"/>
	  <link rel="stylesheet" href="${path}/css/main/index.css"/>
	  <title>SANDWAY</title>
	  <% String user = (String)session.getAttribute("user");%>
	</head>
<body>
  
<div class="wrapper">

  <jsp:include page="./fragments/header.jsp"></jsp:include>

    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script>
		$(document).ready(function(e) {
		    $('a').click(function(){
		        $('#iframe').attr('src',$(this).attr('data-url'));		        
		        })
		});
					
  </script> 
  
	<script lang="JavaScript"> 
		function autoResize(obj){ 
			var newheight; var newwidth; 
			if(obj.contentDocument)
				{ 
					newheight = obj.contentDocument.documentElement.scrollHeight; 
					newwidth = obj.contentDocument.documentElement.scrollWidth; 
				} else { 
						newheight=obj.contentWindow.document.body.scrollHeight; 
						newwidth=obj.contentWindow.document.body.scrollWidth; 
					} 
					obj.height= newheight + "px"; obj.width= newwidth + "px"; 
				} 
	</script>


  
  <iframe onLoad="autoResize(this);" width="100%" id="iframe" src="main/main"></iframe>

  
  

  
  <jsp:include page="./fragments/footer.jsp"></jsp:include>

</div>


</body>
</html>