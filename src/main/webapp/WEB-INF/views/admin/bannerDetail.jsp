<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	String id= (String)session.getAttribute("id");
	%>
	<script type="text/javascript">
	$(document).ready(function(){
		 $("#banner").click(function(){
		        location.href = "${pageContext.request.contextPath}/product/detail/${vo.product_id}";
		    });
	});
	</script>
 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/menu.jsp" flush="false"/>
		<div class="content">
			<div class="bannerbutton">
			 <input type="button" id="banner" value="해당상품과연결">   
			</div>
			<div class="bannerimage">
           <img src="${pageContext.request.contextPath}/resources/bannerimage/${vo.banner_url}" style="margin-left: auto; margin-right: auto;">
         	</div>
         	<div class="bannerdesc">
         	<p>${vo.banner_desc }</p>
         	</div>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>