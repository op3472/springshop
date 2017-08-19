<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/menu.jsp" flush="false"/>
		<div class="content">
		<jsp:include page="/WEB-INF/views/side.jsp" flush="false"/>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>
