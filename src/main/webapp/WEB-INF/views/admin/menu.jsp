<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/join.js"></script>
<title>Insert title here</title>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
    $("ul.sub").hide();
	 $("ul.menu li").hover(function(){
	    $("ul:not(:animated)",this).slideDown("fast");
		},
		function(){"WebContent/joinForm.jsp"
		   $("ul",this).slideUp("fast");
		});
 });
</script>
<%
	String id= (String)session.getAttribute("id");
	%>
	
</head>
<body>
		<div class="member">
	
		<div class="member2">
		
		<form action="${pageContext.request.contextPath}/logout.do" method="post"> 
		관리자페이지입니다.
		<input type="submit" value="로그아웃">
		</form>
		</div>
		</div>
		<div class="menu">
	
		 <ul class="menu">
		 <li class="logo"><a href="${pageContext.request.contextPath}/admin/home.do">Hoseo</a></li>
       <li class="menu2" ><a class="menu3" href="${pageContext.request.contextPath}/admin/product.do">상품관리</a>
	  
		 </li>
	    <li class="menu2" ><a class="menu3" href="#">게시판관리</a>
	    <ul class="sub">
		    <li><a href="${pageContext.request.contextPath}/boardlist.do?page=1">공지사항</a></li>
			<li><a href="${pageContext.request.contextPath}/qaboardlist.do?page=1">Q&A게시판</a></li>
		</ul>
		</li>
		<li class="menu2"><a class="menu3" href="${pageContext.request.contextPath}/admin/delivery.do?page=1">배송관리</a>
		</li>
		<li class="menu2"><a class="menu3" href="${pageContext.request.contextPath}/admin/banner.do?page=1">홈배너관리</a></li>
   </ul>
		</div>
</body>
</html>