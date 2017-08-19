<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/product.css" />
  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
    $("ul.navsub").hide();
	 $("ul.nav li").hover(function(){
	    $("ul:not(:animated)",this).slideDown("fast");
		},
		function(){"WebContent/joinForm.jsp"
		   $("ul",this).slideUp("fast");
		});
 });
</script>
 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/admin/menu.jsp" flush="false"/>
		<div class="content">
		<div class="produ">
		<div class="nav">
		<ul class="nav">
		<li><a href="#">신발</a>
		<ul class="navsub">
			<li><a href="${pageContext.request.contextPath}/admin/list.do?num=1&page=1">나이키</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/list.do?num=2&page=1">아디다스</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/list.do?num=3&page=1">퓨마</a></li>
		</ul>
		</li>
		<li><a href="">상의</a></li>
		<li><a href="">하의</a></li>
		<li><a href="">액세서리</a></li>
		<li><a href=""></a></li>
		</ul>
		</div>
		</div>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>